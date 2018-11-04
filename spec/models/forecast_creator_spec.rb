require 'rails_helper'

describe ForecastCreator do
  subject { ForecastCreator.new("80215") }

  it 'exists' do
    expect(subject).to be_a(ForecastCreator)
  end

  context 'instance methods' do
    context '#today_forecast' do
      it 'returns a forecast object' do
        expect(subject.today_forecast).to be_a(Forecast)
      end
    end

    context '#tomorrow_forecast' do #WIP
      it 'returns a forecast object' do
        #option - separate day creators that inherit from forecast creator
      end
    end
  end


end
