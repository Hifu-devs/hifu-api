module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :email, String, null: true
    field :phone, String, null: true
    field :address, String, null: true
    field :age, Integer, null: true
    field :race, String, null: true
    field :gender, String, null: true
    field :sat_tracker_address, String, null: true
    field :blood_type, String, null: true
    field :allergies, String, null: true
    field :medical_conditions, String, null: true
    field :heightCM, Integer, null: true
    field :weightKG, Integer, null: true
    field :contact, Types::ContactType, null: true
    field :route, Types::RouteType, null: true
  end
end
