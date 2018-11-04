require 'rails_helper'

describe GoogleService do
  subject { GoogleService.new("80215") }

  context '#geocode_search' do
    context 'with valid zip code' do
      it "returns geocoded latitude and longitude" do

        results = subject.geocode_search

        expect(results).to have_key(:lat)
        expect(results).to have_key(:lng)
      end
    end
  end
end
