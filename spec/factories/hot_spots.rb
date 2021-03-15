FactoryBot.define do
  factory :hot_spot do
    name { Faker::Address.city }
    longitude { Faker::Address.longitude }
    latitude { Faker::Address.latitude }
    street { Faker::Address.street_name }
    city { Faker::Address.city }
    state { Faker::Address.state }
    country { Faker::Address.country }
    hits { rand(1..100) }
    infected { false }
    transport {  }
    identification { Faker::Address.city }
  end
end
