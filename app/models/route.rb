class Route < ApplicationRecord
  belongs_to :user
  has_many :waypoints, dependent: :destroy
  has_one :contact, through: :user

# default status is 0, active
# maybe we don't even need this if we are going to destroy upon checking in
  enum status: {active: 0, complete: 1}

  def self.send_alerts(time)
    time = time
    routes = Route.where(end_time: time)
  # Faraday.post('https://hifu-sms.herokuapp.com/alert', '{"phone": "+13038758190", "name": "Joe Smith", "activity": "kayaking", "email": "friend@example.com" }')
  # require "pry"; binding.pry
    routes.each do |route|
      phone = route.contact.phone
      test_string = '{ "phone": #{route.contact.phone}, "name": #{route.user.name}, "activity": #{route.activity}, "email": #{route.contact.email} }'
      require "pry"; binding.pry
      Faraday.post('https://hifu-sms.herokuapp.com/alert', '{ "phone": phone, "name": #{route.user.name}, "activity": #{route.activity}, "email": #{route.contact.email} }')
    end
  end
end
