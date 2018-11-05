require 'rails_helper'

describe 'Forecast API' do
  it 'returns one daily forecast by zip_code' do
    zip_code = "80215"

    VCR.use_cassette("API forecast search 80215") do
      get "/api/v1/forecasts/search?zip_code=#{zip_code}"
    end
    
    expect(response).to be_successful

    forecast = JSON.parse(response.body, symbolize_names: true)

    expect(forecast).to have_key(:data)
  end
end
