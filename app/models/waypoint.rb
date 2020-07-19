class Waypoint < ApplicationRecord
  belongs_to :route
  has_one :next, class_name: "Waypoint", foreign_key: "previous_id"
  belongs_to :previous, class_name: "Waypoint", optional: true
end
