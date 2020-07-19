FactoryBot.define do
  factory :contact do
    name {Faker::Name.name}
    email {Faker::Internet.email}
    phone {Faker::PhoneNumber.cell_phone}
  end
end