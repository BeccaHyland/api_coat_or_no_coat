class CoatSerializer
  include FastJsonapi::ObjectSerializer
  set_type :coat
  attributes :title, :high_temp, :low_temp, :precip_condition
end
