require 'rails_helper'

describe 'Coats API' do
  describe 'POST /api/v1/coats' do
    context 'with valid coat params' do
      it 'creates a new coat' do
        user = create(:user)

        payload = { title: "winter",
                    precip_condition: "snow",
                    high_temp: "50",
                    low_temp: "-10",
                    api_key: user.api_key}

        post "/api/v1/coats", params: payload

        expect(response.status).to eq(201)
        expect(user.coats.length).to eq(1)
      end
    end

    context 'with missing api key' do
      it 'returns a 401 error' do
        user = create(:user)

        payload = { title: "winter",
                        precip_condition: "snow",
                        high_temp: "50",
                        low_temp: "-10"}

        post "/api/v1/coats", params: payload

        expect(response.status).to eq(401)
        expect(user.coats.length).to eq(0)
      end
    end

    context 'with incorrect api key' do
      it 'returns a 401 error' do
        user = create(:user)

        payload = { title: "winter",
                        precip_condition: "snow",
                        high_temp: "50",
                        low_temp: "-10",
                        api_key: "wrong_api_key"}

        post "/api/v1/coats", params: payload

        expect(response.status).to eq(401)
        expect(user.coats.length).to eq(0)
      end
    end
  end

  describe 'GET /api/v1/coats' do
    context 'when user is logged in' do
      it 'returns all coats belonging to user' do
        user_1 = create(:user)
        user_1_coat = create(:coat, user_id: user_1.id)

        user_2 = create(:user)
        user_2_coat = create(:coat)

        payload = { api_key: user_1.api_key }

        get "/api/v1/coats", params: payload

        expect(response.status).to eq(200)

        get_response = JSON.parse(response.body, symbolize_names: true)

        expect(get_response[:data]).to be_an(Array)
        expect(get_response[:data].length).to eq(1)
        expect(get_response[:data].first[:attributes][:title]).to eq(user_1_coat[:title])
        expect(get_response[:data].first[:attributes][:high_temp]).to eq(user_1_coat[:high_temp])
        expect(get_response[:data].first[:attributes][:low_temp]).to eq(user_1_coat[:low_temp])
        expect(get_response[:data].first[:attributes][:precip_condition]).to eq(user_1_coat[:precip_condition])
      end
    end

    context 'with no api key' do
      it 'returns a 401 error' do
        user_1 = create(:user)
        user_1_coat = create(:coat, user_id: user_1.id)

        get "/api/v1/coats", headers: headers

        expect(response.status).to eq(401)
      end
    end

    context 'with incorrect api key' do
      it 'returns 401 error' do
        user_1 = create(:user)

        payload = { api_key: "wrong api key" }

        get "/api/v1/coats", params: payload, headers: headers

        expect(response.status).to eq(401)
      end
    end
  end
end
