require 'rails_helper'

describe DarkSkyService do
  subject { DarkSkyService.new({:lat=>39.747363, :lng=>-105.1083542}) }

  context '#stringify_coordinates' do
    context 'with valid latitude / longitude hash' do
      it 'returns comma separated string' do
        expect(subject.stringify_coordinates).to eq("39.747363,-105.1083542")
      end
    end
  end

  context '#forecast_search' do
    context 'with valid search coordinates string' do
      it 'returns forecast data' do

        results = VCR.use_cassette("Darksky svc forecast search") do
          subject.forecast_search
        end

        expect(results).to have_key(:latitude)
        expect(results).to have_key(:longitude)
        expect(results).to have_key(:daily)
      end
    end
  end
end
