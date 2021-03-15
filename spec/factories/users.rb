FactoryBot.define do
  factory :user do
    imei { Faker::Code.imei }
    nin { Faker::Code.imei }
    infected { false }
    status { "green" } 
  end
end
