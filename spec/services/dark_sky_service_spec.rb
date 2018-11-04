require 'rails_helper'

describe DarkSkyService do
  subject { DarkSkyService.new({:lat=>39.747363, :lng=>-105.1083542}) }

  it 'exists' do
    expect(subject).to be_a(DarkSkyService)
  end
  #Q: does DarkSKy need lat/long to function? what does it take in?
  #A: yes, lat.long
  #example:
  # GET https://api.darksky.net/forecast/0123456789abcdef9876543210fedcba/42.3601,-71.0589

  context '#stringify_coordinates' do
    context 'with valid latitude / longitude hash' do
      it 'returns comma separated string' do
        expect(subject.stringify_coordinates).to eq("39.747363,105.1083542")
      end
    end
  end

  context '#forecast_search' do
    context 'with valid coordinates in string' do
      it 'returns forecast data' do
        results = subject.forecast_search

        # expect(results).to have_key(:)
      end
    end
  end
end
