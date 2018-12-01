require "rails_helper"

describe User, type: :model do
  context 'validations' do
    it {should validate_presence_of :email}
    it {should validate_uniqueness_of :email}
    it {should validate_presence_of :password_digest}
    it {should validate_presence_of :zip_code}
    it {should validate_presence_of :phone_number}
  end

  context 'associations' do
    it {should have_many(:coats)}
  end
end
