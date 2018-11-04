require 'rails_helper'

describe ForecastCreator do
  subject { ForecastCreator.new("80215") }

  it 'exists' do
    expect(subject).to be_a(ForecastCreator)
  end

  context 'instance methods' do
    context '#today_forecast' do

    end

    context '#tomorrow_forecast' do

    end
  end


end
