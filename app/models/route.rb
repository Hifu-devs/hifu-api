require 'json'

class Route < ApplicationRecord
  belongs_to :user
  has_many :waypoints, dependent: :destroy
  has_one :contact, through: :user

# default status is 0, active
# maybe we don't even need this if we are going to destroy upon checking in
  enum status: {active: 0, complete: 1, notified: 2}

  def self.send_alerts(time)
    time = time
    routes = Route.where('end_time <= ?', time).where(status: "active")
    send_text(routes)
    send_email(routes)
    routes.each { |route| route.status == "notified"}
    routes
  end

  def self.send_text(routes)
    Array(routes).each do |route|
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

  def self.send_email(routes)
    Array(routes).each do |route|
      info = { "data": {
               "user": { "name": route.user.name,
                         "email": route.user.email,
                         "phone": route.user.phone,
                         "address": route.user.address,
                         "age": route.user.age,
                         "race": route.user.race,
                         "gender": route.user.gender,
                         "sat_tracker_address": route.user.sat_tracker_address,
                         "blood_type": route.user.blood_type,
                         "allerges": route.user.allergies,
                         "medical_conditions": route.user.medical_conditions,
                         "heightCM": route.user.heightCM,
                         "weightKG": route.user.weightKG,
                         "contact": { "name": route.contact.name,
                                    "email": route.contact.email,
                                    "phone": route.contact.phone },
                         "route": { "start_time": route.start_time,
                                  "end_time": route.end_time,
                                  "activity": route.activity,
                                  "party_size": route.party_size,
                                  "notes": route.notes,
                                  "waypoints": route.waypoints }
                          }
                        }

                  }
      json = info.to_json
      Faraday.post('https://nameless-ravine-82701.herokuapp.com/email_alert', json)
    end
  end

end
