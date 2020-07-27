class WaypointsSerializer
  include FastJsonapi::ObjectSerializer

  attributes :latitude, :longitude

end
