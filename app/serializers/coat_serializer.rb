class CoatSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :high_temp, :low_temp, :precip_condition
end
