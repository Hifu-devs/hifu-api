# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

def print_and_flush(content)
  print " \r" + content + " \r "
  $stdout.flush
end

puts "Reseting Database"

ActiveRecord::Base.connection.tables.each do |t|
  if t != "schema_migrations" && t != "ar_internal_metadata"
    puts "Destroying records in #{t} table "
    t.singularize.camelize.constantize.destroy_all
  end
end

ActiveRecord::Base.connection.tables.each do |t|
  puts "Reseting PK on #{t} table"
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

puts "\n--Create one test seed to check if heroku scheduler is activated correctly--"
test_user = User.create(
        name: "Testing Heroku Scheduler",
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

test_route = Route.create(
    user_id: test_user.id,
    start_time: Faker::Time.between(from: 1.minutes.from_now, to: 10.minutes.from_now),
    end_time: Faker::Time.between(from: 30.minutes.from_now, to: 32.minutes.from_now),
    activity: Faker::Verb.ing_form,
    party_size: Faker::Number.number(digits: 1),
    notes: Faker::Music::Prince.lyric
    )

test_way1 = Waypoint.create(
  route_id: test_route.id,
  latitude: 40.3453,
  longitude: -120.3642
)

test_way2 = Waypoint.create(
  route_id: test_route.id,
  latitude: 40.6222,
  longitude: -120.1032,
  previous_id: test_way1.id
)

c = Contact.create(
  user_id: test_user.id,
  name: "TESTING Heroku scheduler",
  email: "flewelling.margo@gmail.com",
  phone: "+17205775625"
)



puts "\n-- Grab a snickers, we're about to make a bunch of entries O(n^2) style --"
5.times do |i|
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


      c = Contact.create(
        user_id: u.id,
        name: Faker::Name.name,
        email: "flewelling.margo@gmail.com",
        phone: "+17205775625"
      )

  last_wp = nil
  eta = r.start_time + 1.hours

  i.times do |t|
    print_and_flush("\tCreating User and Routes #{i+1}%" +
    "\tCreating Route's Waypoints #{(t + 1.0 / i * 100).to_i + 1}%")

    w = r.waypoints.create(
        latitude: Faker::Address.latitude,
        longitude: Faker::Address.longitude,
        eta: eta
        )


    if last_wp
      last_wp.next = w
      eta = last_wp.eta + rand(10..100).minutes
    end

    last_wp = w
  end
end

puts "\n\n-- Seeding complete --\n"
