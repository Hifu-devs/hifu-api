module Types
  class Input::RouteInputType < Input::BaseInput
    description "Attributes for creating or updating a route"
    argument :userEmail, String, required: false
    argument :startTime, DateTime, required: false
    argument :endTime, DateTime, required: true
    argument :activity, String, required: false
    argument :partySize, Integer, required: false
    argument :notes, String, required: false
    argument :waypoints, [Types::Input::WaypointInputType], required: false
  end
end