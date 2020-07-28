module Types
  class Input::UserInputType < Input::BaseInput
    description "Attributes for creating or updating a user"
    argument :name, String, required: false
    argument :email, String, required: true
    argument :phone, String, required: false
    argument :address, String, required: false
    argument :age, String, required: false
    argument :ethnicity, String, required: false
    argument :gender, String, required: false
    argument :satTrackerAddress, String, required: false
    argument :bloodType, String, required: false
    argument :allergies, String, required: false
    argument :medicalConditions, String, required: false
    argument :heightCM, String, required: false
    argument :weightKG, String, required: false
    argument :contact, Types::Input::ContactInputType, required: false
    argument :route, Types::Input::RouteInputType, required: false
  end
end