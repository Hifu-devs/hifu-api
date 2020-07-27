class UserSerializer
  include FastJsonapi::ObjectSerializer

  attributes :name, :email, :phone, :address, :age, :race,
           :gender, :sat_tracker_address, :blood_type, :allergies,
           :medical_conditions, :heightCM, :weightKG

end
