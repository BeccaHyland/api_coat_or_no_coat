class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password_digest, :zip_code, :phone_number
  has_many :coats

  has_secure_password

  before_create :assign_api_key

  def assign_api_key
    self.api_key = SecureRandom.urlsafe_base64
  end

end
