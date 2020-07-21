module Types
  class Input::ContactInputType < Input::BaseInput
    description "Attributes for creating or updating an emergency contact"
    argument :userEmail, String, required: false
    argument :name, String, required: false
    argument :email, String, required: false
    argument :phone, String, required: false
  end
end