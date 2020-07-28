module Types
  class Input::RouteInputType < Input::BaseInput
    description "Attributes for creating or updating a route"
    argument :userEmail, String, required: false
    argument :startDate, Date, required: false
    argument :endDate, Date, required: true
    argument :activity, String, required: false
    argument :partySize, Integer, required: false
    argument :notes, String, required: false
    argument :waypoints, [Types::Input::WaypointInputType], required: false
  end
end