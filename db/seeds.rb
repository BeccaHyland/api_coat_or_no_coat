# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Coat.destroy_all

if Rails.env == 'development' || Rails.env == 'production'
  user = User.create!(email: "me@me.com", zip_code: 11111, phone_number: "111-111-1111", password_digest: "me")
  user.coats.create(title: "Bear Coat", high_temp: 50.0, low_temp: -10.0, precip_condition: "bearly raining")
end
