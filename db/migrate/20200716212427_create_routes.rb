class CreateRoutes < ActiveRecord::Migration[6.0]
  def change
    create_table :routes do |t|
      t.references :user, null: false, foreign_key: true
      t.string :start_time
      t.string :end_time
      t.string :activity
      t.integer :party_size
      t.string :notes
      t.integer :status, default: 0
    end
  end
end
