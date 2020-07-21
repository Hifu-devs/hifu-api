require 'rails_helper'

RSpec.describe Route, type: :model do
  describe 'relationships' do
    it {should belong_to(:user)}
    it {should have_many(:waypoints).dependent(:destroy)}
    it {should have_one(:contact).through(:user)}
  end

  describe 'class methods' do
    it '.find_alerts' do
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

        u2 = User.create(
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

        u3 = User.create(
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

        r1 = Route.create(
            user_id: u.id,
            start_time: Faker::Time.between(from: 1.seconds.from_now, to: 60.seconds.from_now),
            end_time: Time.now.strftime("%Y-%m-%d %H:%M"),
            activity: Faker::Verb.ing_form ,
            party_size: Faker::Number.number(digits: 1),
            notes: Faker::Music::Prince.lyric
            )
        r2 = Route.create(
            user_id: u2.id,
            start_time: Faker::Time.between(from: 1.seconds.from_now, to: 60.seconds.from_now),
            end_time: Time.now.strftime("%Y-%m-%d %H:%M"),
            activity: Faker::Verb.ing_form ,
            party_size: Faker::Number.number(digits: 1),
            notes: Faker::Music::Prince.lyric
            )

        r3 = Route.create(
            user_id: u3.id,
            start_time: Faker::Time.between(from: 1.seconds.from_now, to: 60.seconds.from_now),
            end_time: Faker::Time.between(from: 1.days.from_now, to: 10.days.from_now),
            activity: Faker::Verb.ing_form ,
            party_size: Faker::Number.number(digits: 1),
            notes: Faker::Music::Prince.lyric
            )

        # last_wp = nil
        # eta = DateTime.parse(r.start_time) + 1.hours

        expect(Route.find_alerts(Time.now.strftime("%Y-%m-%d %H:%M")).count).to equal(2)
      end

    end
  end
