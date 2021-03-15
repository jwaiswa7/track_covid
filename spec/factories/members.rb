FactoryBot.define do
  factory :member do
    email { Faker::Internet.email }
    password { "topsecret" }
    password_confirmation { "topsecret" }
  end
end
