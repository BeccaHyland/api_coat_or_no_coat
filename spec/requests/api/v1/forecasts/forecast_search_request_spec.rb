require 'rails_helper'

describe 'Forecast API' do
  it 'returns one daily forecast by zip_code' do
    zip_code = "80215"

    get "/api/v1/forecasts/search?zip_code=#{zip_code}"

    expect(response).to be_sucessful

    forecast = JSON.parse(response.body, symbolize_names: true)

    expect(forecast).to have_key(:data)
  end
end
