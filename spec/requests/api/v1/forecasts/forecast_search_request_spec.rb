require 'rails_helper'

describe 'Forecast API' do
  it 'returns weather by zip_code' do
    zip_code = "80215"

    get "/api/v1/forecasts/search?zip_code=#{zip_code}"

    


  end
end
