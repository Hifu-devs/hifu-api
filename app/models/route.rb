require 'json'

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
    routes.each do |route|
      @phone = route.contact.phone.to_s
      @name = route.user.name.to_s
      @activity = route.activity.to_s
      @email = route.contact.email.to_s

      data = {
              "phone" => @phone,
              "name" => @name,
              "activity" => @activity,
              "email" => @email
            }
      json = data.to_json
      Faraday.post('https://hifu-sms.herokuapp.com/alert', json)
    end
  end
end
