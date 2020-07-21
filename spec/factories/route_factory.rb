FactoryBot.define do
  factory :route do
    start_time {Faker::Time.between(from: 1.minutes.from_now, to: 1.days.from_now).round}
    end_time {Faker::Time.between(from: 1.days.from_now, to: 10.days.from_now).round}
    activity {Faker::Verb.ing_form }
    party_size {Faker::Number.number(digits: 1)}
    notes {Faker::Music::Prince.lyric}
  end
end