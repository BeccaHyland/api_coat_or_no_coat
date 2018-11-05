require 'rails_helper'

describe Forecast do
  data = { summary: "Snow in the afternoon",
          precip_probability: 0.67,
          precip_type: "snow",
          max_precip_time: "1541455200" }

  subject { Forecast.new(data) }

  it 'exists with attributes' do
    expect(subject).to be_a(Forecast)
    expect(subject.summary).to eq("Snow in the afternoon")
  end

end
