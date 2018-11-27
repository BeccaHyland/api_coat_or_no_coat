require 'rails_helper'

describe Coat, type: :model do
  context 'validations' do
    it {should validate_presence_of :title}
    it {should validate_presence_of :high_temp}
    it {should validate_presence_of :low_temp}
    it {should validate_presence_of :precip_condition}
  end

  context 'associations' do
    it {should belong_to(:user)}
  end
end
