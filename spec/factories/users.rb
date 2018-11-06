FactoryBot.define do
  factory :user do
    email { "kitten@kitten.com" }
    password_digest { "little_kitten" }
    zip_code { 77777 }
    phone_number {"777-777-7777"}
  end
end
