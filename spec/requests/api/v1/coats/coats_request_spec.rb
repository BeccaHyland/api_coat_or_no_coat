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
        user = create(:user)
        create_list(:coat, 3, user_id: user.id)
      end
    end
  end
end
