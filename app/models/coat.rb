class Coat < ApplicationRecord
  validates_presence_of :title, :high_temp, :low_temp, :precip_condition

  belongs_to :user
end
