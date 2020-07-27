class ContactSerializer
  include FastJsonapi::ObjectSerializer

  attributes :name, :email
end
