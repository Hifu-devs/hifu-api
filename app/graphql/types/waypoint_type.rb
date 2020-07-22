module Types
  class WaypointType < Types::BaseObject
    field :id, ID, null: false
    field :route_id, Integer, null: false
    field :latitude, Float, null: true
    field :longitude, Float, null: true
    field :eta, GraphQL::Types::ISO8601DateTime, null: true
    field :previous_id, Integer, null: true
  end
end
