class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  set_id :time
  attributes :summary, :precip_probability, :precip_type, :max_precip_time
end
