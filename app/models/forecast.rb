class Forecast
  attr_reader :summary,
              :precip_probability,
              :precip_type,
              :max_precip_time

  def initialize(json_data = {})
    @summary = json_data[:summary]
    @precip_probability = json_data[:precipProbability]
    @precip_type = json_data[:precipType]
    @max_precip_time = json_data[:precipIntensityMaxTime] #format this to hour out of unix stamp
  end

end
