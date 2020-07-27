class EmailInfoSerializer
  include FastJsonapi::ObjectSerializer

  attributes :activity, :party_size, :notes, :start_time, :end_time

  has_many :waypoints
  has_one :contact
  belongs_to :user

  attribute :user do |route|
    UserSerializer.new(route.user)
  end

  attribute :contact do |route|
    ContactSerializer.new(route.contact)
  end

  attribute :waypoints do |route|
    WaypointsSerializer.new(route.waypoints)
  end

  attribute :local_authority_name do |route, authority_info|
    authority_info[:name]
  end

  attribute :local_authority_phone do |route, authority_info|
    authority_info[:phone]
  end

end
