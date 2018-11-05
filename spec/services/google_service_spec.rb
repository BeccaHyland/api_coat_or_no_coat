require 'rails_helper'

describe GoogleService do
  subject { GoogleService.new("80215") }

  context '#geocode_search' do
    context 'with valid zip code' do
      it "returns geocoded latitude and longitude" do

        results = VCR.use_cassette("Google svc geocode search 80215") do
          subject.geocode_search
        end

        expect(results).to have_key(:lat)
        expect(results).to have_key(:lng)
      end
    end
  end
end
