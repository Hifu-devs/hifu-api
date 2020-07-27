require 'json'

class Route < ApplicationRecord
  belongs_to :user
  has_many :waypoints, dependent: :destroy
  has_one :contact, through: :user

# default status is 0, active
# maybe we don't even need this if we are going to destroy upon checking in
  enum status: {active: 0, complete: 1, notified: 2}

  def self.send_alerts(time)
    routes = Route.where('end_time <= ?', time).where(status: "active")
    send_text(routes)
    send_email(routes)
    routes.each { |route| route.update(status: "notified")}
    Array(routes)
  end

  def self.send_text(routes)
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

  def self.send_email(routes)
    routes.each do |route|
      authority_info = JSON.parse(HifuAuthoritiesService.new.authority_info(route.waypoints.first).body)
      info = EmailInfoSerializer.new(route, {params: {name: authority_info["name"],
                                     phone: authority_info["phone"]}}).serialized_json
      Faraday.post('https://nameless-ravine-82701.herokuapp.com/email_alert', info)
    end
  end


end
