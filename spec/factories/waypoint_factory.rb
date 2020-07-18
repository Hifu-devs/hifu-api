FactoryBot.define do
  factory :waypoint do
    previous_wp {}
    next_wp {}
    latitude {Faker::Address.latitude}
    longitude {Faker::Address.longitude}
    estimated_eta {}
  end
end