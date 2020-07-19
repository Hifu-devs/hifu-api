FactoryBot.define do
  factory :waypoint do
    latitude {Faker::Address.latitude}
    longitude {Faker::Address.longitude}
  end
end