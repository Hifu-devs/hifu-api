class RouteSerializer
  include FastJsonapi::ObjectSerializer
  attribute :activity

  attribute :phone do |object|
    object.contact.phone
  end

  attribute :name do |object|
    object.user.name
  end

  attribute :email do |object|
    object.contact.email
  end
end
