class AddWaypointtoWaypoint < ActiveRecord::Migration[6.0]
  def change
    add_reference :waypoints, :previous
  end
end
