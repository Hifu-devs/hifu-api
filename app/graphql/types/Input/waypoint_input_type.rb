module Types
  class Input::WaypointInputType < Input::BaseInput
    description "Attributes for creating or updating a waypoint object"
    argument :route_id, Integer, required: false
    argument :latitude, Float, required: true
    argument :longitude, Float, required: true
    argument :eta, String, required: false
    argument :previous_id, Integer, required: false
  end
end