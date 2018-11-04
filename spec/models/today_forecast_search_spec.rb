require 'rails_helper'

describe TodayForecastSearch do
  subject { TodayForecastSearch.new("80215") }

  it 'exists' do
    expect(subject).to be_a(TodayForecastSearch)
  end


end
