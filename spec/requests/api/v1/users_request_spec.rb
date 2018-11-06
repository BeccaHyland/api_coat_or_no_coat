require 'rails_helper'

describe 'User API' do
  describe 'POST /api/v1/users' do
    context 'with valid user params' do
      it 'creates a new user' do

        headers = { "Content-Type" => "application/json",
                    "Accept" => "application/json"}
        json_payload = { email: "whatever@example.com",
                        zip_code: 80203,
                        phone_number: "3030303030",
                        password_digest: "password",
                        password_confirmation: "password"}.to_json

        post "/api/v1/users", params: json_payload, headers: headers

        expect(response.status).to eq(201)

        post_response = JSON.parse(response.body, symbolize_names: true)

        expect(post_response[:data][:attributes]).to have_key(:api_key)
        expect(post_response[:data][:attributes][:api_key]).to_not be nil
      end
    end

    context 'with missing user params' do
      it 'returns a 400 error' do
        headers = { "Content-Type" => "application/json",
                    "Accept" => "application/json"}
        json_payload = { email: "whatever@example.com",
                        password_digest: "password",
                        password_confirmation: "password"}.to_json

        post "/api/v1/users", params: json_payload, headers: headers

        expect(response.status).to eq(400)
      end
    end
  end
end
