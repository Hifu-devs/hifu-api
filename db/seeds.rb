# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all

u = User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.full_address,
    age: Faker::Number.number(digits: 2),
    race: ["White", "Hispanic", "Black", "Native American", "Prefer Not to Say"].sample,
    gender: Faker::Gender.type,
    sat_tracker_address: Faker::Internet.email,
    blood_type: Faker::Blood.type,
    allergies: Faker::ProgrammingLanguage.name,
    medical_conditions: Faker::Hipster.word + "itis",
    heightCM: Faker::Number.number(digits: 2),
    weightKG: Faker::Number.number(digits: 2)
    )

r = Route.create(
    user_id: u.id,
    start_time: Faker::Time.between(from: 1.minutes.from_now, to: 1.days.from_now),
    end_time: Faker::Time.between(from: 1.days.from_now, to: 10.days.from_now),
    activity: Faker::Verb.ing_form ,
    party_size: Faker::Number.number(digits: 1),
    notes: Faker::Music::Prince.lyric
    )

last_wp_id = nil
10.times do |i|
  w =  Waypoint.create(
        # previous_wp: last_wp_id,
        # next_wp tbd
        route_id: r.id,
        latitude: Faker::Address.latitude,
        longitude: Faker::Address.longitude,
        estimated_eta: DateTime.parse(r.start_time) + 1.hours
        )
  last_wp_id = w.id
  binding.pry
  Waypoint.find(last_wp_id).next_wp = w.id if last_wp_id
  end
    