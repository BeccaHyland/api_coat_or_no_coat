require 'rails_helper'

describe 'Sessions API' do
  describe 'POST /api/v1/sessions' do
    context 'with valid email and username' do
      it 'creates a session for the user' do

        user = create(:user, email: "whatever@example.com",
                      password_digest: "password")

        headers = { "Content-Type" => "application/json",
                    "Accept" => "application/json"}
        json_payload = { email: "whatever@example.com",
                          password_digest: "password"}

        post "/api/v1/sessions", params: json_payload, headers: headers

        expect(response.status).to eq(201)

        post_response = JSON.parse(response.body, symbolize_names: true)

        expect(post_response[:data][:attributes]).to have_key(:api_key)
        expect(post_response[:data][:attributes][:api_key]).to_not be nil
      end
    end
  end
end
