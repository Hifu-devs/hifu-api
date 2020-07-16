class Route < ApplicationRecord
  belongs_to :user
  has_many :waypoints
  has_one :contact, through: :user

end
