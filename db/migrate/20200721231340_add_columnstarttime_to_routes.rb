class AddColumnstarttimeToRoutes < ActiveRecord::Migration[6.0]
  def change
    add_column :routes, :start_time, :datetime
    add_column :routes, :end_time, :datetime
  end
end
