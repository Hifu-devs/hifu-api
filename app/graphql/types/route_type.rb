module Types
  class RouteType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Integer, null: false
    field :start_time, String, null: true
    field :end_time, String, null: true
    field :activity, String, null: true
    field :party_size, Integer, null: true
    field :notes, String, null: true
    field :status, Integer, null: true
    field :waypoints, [Types::WaypointType], null: true
  end
end
