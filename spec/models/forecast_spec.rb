require 'rails_helper'

describe Forecast do
  json_data = {}
  subject { Forecast.new(json_data) }

  it 'exists' do
    expect(subject).to be_a(Forecast)
  end

end
