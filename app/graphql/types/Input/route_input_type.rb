module Types
  class Input::RouteInputType < Input::BaseInput
    description "Attributes for creating or updating a route"
    argument :userEmail, String, required: false
    argument :startDate,  GraphQL::Types::ISO8601DateTime, required: false
    argument :endDate,  GraphQL::Types::ISO8601DateTime, required: true
    argument :activity, String, required: false
    argument :partySize, Integer, required: false
    argument :notes, String, required: false
    argument :wayPoints, [Types::Input::WaypointInputType], required: false
  end
end