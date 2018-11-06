class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password_digest, :zip_code, :phone_number

  has_secure_password

end
