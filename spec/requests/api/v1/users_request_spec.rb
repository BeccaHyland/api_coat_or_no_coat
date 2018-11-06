require 'rails_helper'

describe 'User API' do
  describe 'POST /api/v1/users' do
    it 'creates a new user' do

      headers = { "Content-Type" => "application/json",
                  "Accept" => "application/json"}
      json_payload = { email: "whatever@example.com",
                      password: "password",
                      password_confirmation: "password"}.to_json

      post "/api/v1/users", params: json_payload, headers: headers

      expect(response).to be_sucessful

      post_response = JSON.parse(response.body, symbolize_names: true)

      expect(post_response.status).to eq(201)
      expect(post_response.body).to have_key(:api_key)
    end
  end
end
