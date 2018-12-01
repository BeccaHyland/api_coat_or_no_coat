require 'rails_helper'

describe 'Sessions API' do
  describe 'POST /api/v1/sessions' do
    context 'with valid email and username' do
      it 'creates a session for the user' do
        user = create(:user)

        headers = { "Content-Type" => "application/json",
                    "Accept" => "application/json"}
        json_payload = { email: user.email,
                          password: "little_kitten"}.to_json

        post "/api/v1/sessions", params: json_payload, headers: headers

        expect(response.status).to eq(200)

        post_response = JSON.parse(response.body, symbolize_names: true)

        expect(post_response[:data][:attributes][:api_key]).to eq(user.api_key)
      end
    end

    context 'with invalid email / username combination' do
      it 'returns a 400 status' do
        user = create(:user)

        headers = { "Content-Type" => "application/json",
                    "Accept" => "application/json"}
        json_payload = { email: "kitten@kitten.com",
                          password: "big_kitten"}.to_json

        post "/api/v1/sessions", params: json_payload, headers: headers

        expect(response.status).to eq(400)
      end
    end
  end
end
