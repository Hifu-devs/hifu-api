module Types
  class ContactType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Integer, null: false
    field :name, String, null: true
    field :email, String, null: true
    field :phone, String, null: true
  end
end
