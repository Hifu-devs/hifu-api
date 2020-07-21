class Route < ApplicationRecord
  belongs_to :user
  has_many :waypoints, dependent: :destroy
  has_one :contact, through: :user

# default status is 0, active
# maybe we don't even need this if we are going to destroy upon checking in
  enum status: {active: 0, complete: 1}

  def self.find_alerts(time)
    time = time
    routes = Route.where(end_time: time)
    serialized = []

    routes.each do |route|
      
    end
  end
end
