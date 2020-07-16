class Route < ApplicationRecord
  belongs_to :user
  has_many :waypoints
  has_one :contact, through: :user

# default status is 0, active
# maybe we don't even need this if we are going to destroy upon checking in
  enum status: {active: 0, complete: 1}
end
