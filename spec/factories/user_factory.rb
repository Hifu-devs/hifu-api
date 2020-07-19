FactoryBot.define do
  factory :user do
    name {Faker::Name.name}
    email {Faker::Internet.email}
    phone {Faker::PhoneNumber.cell_phone}
    address {Faker::Address.full_address}
    age {Faker::Number.number(digits: 2)}
    race {["White", "Hispanic", "Black", "Native American", "Prefer Not to Say"].sample}
    gender {Faker::Gender.type}
    sat_tracker_address {Faker::Internet.email}
    blood_type {Faker::Blood.type}
    allergies {Faker::ProgrammingLanguage.name}
    medical_conditions {Faker::Hipster.word + "itis"}
    heightCM {Faker::Number.number(digits: 2)}
    weightKG {Faker::Number.number(digits: 2)}

    factory :user_route_contact do
      route
      contact
    end

  end
end

