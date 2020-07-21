FactoryBot.define do
  factory :waypoint do
    latitude {Faker::Address.latitude}
    longitude {Faker::Address.longitude}
    eta {Faker::Time.between(from: 1.minutes.from_now, to: 1.days.from_now).round}
  end
end