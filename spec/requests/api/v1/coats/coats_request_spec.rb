require 'rails_helper'

describe 'Coats API' do
  describe 'POST /api/v1/coats' do
    context 'with valid coat params' do
      it 'creates a new coat' do
        user = create(:user)

        headers = { "Content-Type" => "application/json",
                    "Accept" => "application/json"}
        json_payload = { title: "winter",
                        precip_condition: "snow",
                        high_temp: "50",
                        low_temp: "-10",
                        api_key: "#{user.api_key}"}.to_json

        post "/api/v1/coats", params: json_payload, headers: headers

        expect(response.status).to eq(201)
        expect(user.coats.length).to eq(1)
      end
    end

    context 'with missing api key' do
      it 'returns a 401 error' do
        user = create(:user)

        headers = { "Content-Type" => "application/json",
                    "Accept" => "application/json"}
        json_payload = { title: "winter",
                        precip_condition: "snow",
                        high_temp: "50",
                        low_temp: "-10"}.to_json

        post "/api/v1/coats", params: json_payload, headers: headers

        expect(response.status).to eq(401)
        expect(user.coats.length).to eq(0)
      end
    end

    context 'with incorrect api key' do
      it 'returns a 401 error' do
        user = create(:user)

        headers = { "Content-Type" => "application/json",
                    "Accept" => "application/json"}
        json_payload = { title: "winter",
                        precip_condition: "snow",
                        high_temp: "50",
                        low_temp: "-10",
                        api_key: "wrong_api_key"}.to_json

        post "/api/v1/coats", params: json_payload, headers: headers

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

        headers = { "Content-Type" => "application/json",
                    "Accept" => "application/json"}
        json_payload = { api_key: "#{user_1.api_key}"}.to_json

        get "/api/v1/coats", params: json_payload, headers: headers

        expect(response.status).to eq(200)

        get_response = JSON.parse(response.body, symbolize_names: true)

        expect(post_reponse[:data].to be_an(Array))
        expect(post_reponse[:data][:attributes].to be_an(Array))
        expect(post_reponse[:data]).to_not include(user_2_coat)
      end
    end
  end
end
