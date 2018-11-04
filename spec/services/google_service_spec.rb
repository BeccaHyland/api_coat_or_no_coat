require 'rails_helper'

describe GoogleService do
  subject { GoogleService.new("80215") }

  it 'exists' do
    expect(subject).to be_a(GoogleService)
  end

  context 'geocoding data' do
    context 'with valid zip code' do
      it "returns geocoded latitude and longitude" do
      results = subject.geocoded_data

      expect(results.first).to have_key[:lat]
      expect(results.first).to have_key[:lng]
    end
  end

end
