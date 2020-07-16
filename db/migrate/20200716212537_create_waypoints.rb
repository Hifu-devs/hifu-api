class CreateWaypoints < ActiveRecord::Migration[6.0]
  def change
    create_table :waypoints do |t|
      t.references :route, null: false, foreign_key: true
      t.bigint :previous_wp
      t.bigint :next_wp
      t.float :latitude
      t.float :longitude
      t.timestamp :estimated_eta
    end
  end
end
