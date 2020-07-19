class RemoveNextPreviousWPfromWaypoint < ActiveRecord::Migration[6.0]
  def change
    remove_column :waypoints, :next_wp
    remove_column :waypoints, :previous_wp
  end
end
