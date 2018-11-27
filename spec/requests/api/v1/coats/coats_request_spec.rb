require 'rails_helper'

describe 'Coats API' do
  describe 'POST /api/v1/coats' do
    context 'with valid coat params' do
      it 'creates a new coat' do

        headers = { "Content-Type" => "application/json",
                    "Accept" => "application/json"}
        json_payload = { title: “winter”,
          precip_condition: “snow”,
          high_temp: “50”,
          low_temp: “-10”,
          api_key: "jgn983hy48thw9begh98h4539h4"}.to_json

        post "/api/v1/coats", params: json_payload, headers: headers

        expect(response.status).to eq(201)
      end
    end

    context 'with missing api key' do
      xit 'returns a 401 error' do
        headers = { "Content-Type" => "application/json",
                    "Accept" => "application/json"}
        json_payload = { title: “winter”,
          precip_condition: “snow”,
          high_temp: “50”,
          low_temp: “-10”}.to_json

        post "/api/v1/coats", params: json_payload, headers: headers

        expect(response.status).to eq(401)
      end
    end

    context 'with incorrect api key' do
      xit 'returns a 401 error' do

      end
    end
  end
end

# POST /api/v1/coats
# Content-Type: application/json
# Accept: application/json
# body:
# {
#   “title”: “winter”,
#   “precip_condition”: “snow”, or rain etc. or none
#   “high_temp”: “50”,
#   “low_temp”: “-10”,
#   "api_key": "jgn983hy48thw9begh98h4539h4"
# }
# Requirements:
# * API key must be sent
# * If no API key or an incorrect key is provided return 401 (Unauthorized)
