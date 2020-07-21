class RemoveColumnStartTimeFromRoute < ActiveRecord::Migration[6.0]
  def change
    remove_column :routes, :start_time
    remove_column :routes, :end_time
  end
end
