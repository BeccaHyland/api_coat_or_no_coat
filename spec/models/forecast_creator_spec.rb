require 'rails_helper'

describe ForecastCreator do
  subject { ForecastCreator.new("80215") }

  context 'instance methods' do
    context '#today_forecast' do
      it 'returns a forecast object' do
        VCR.use_cassette("today forecast 80215") do
          expect(subject.today_forecast).to be_a(Forecast)
        end
      end
    end

    context '#tomorrow_forecast' do #WIP
      it 'returns a forecast object' do
        #option - separate day creators that inherit from forecast creator
      end
    end
  end


end
