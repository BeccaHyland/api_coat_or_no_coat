FactoryBot.define do
  factory :coat do
    user
    title { "Coat of Many Colors" }
    high_temp { 72.0 }
    low_temp { 62.0 }
    precip_condition { "raining cats and dogs" }
  end
end
