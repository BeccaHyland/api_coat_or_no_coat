require 'rails_helper'

describe TodayForecastCreator do
  subject { TodayForecastCreator.new("80215") }

  it 'exists' do
    expect(subject).to be_a(TodayForecastCreator)
  end


end
