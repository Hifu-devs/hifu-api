class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :address
      t.integer :age
      t.string :race
      t.string :gender
      t.string :sat_tracker_address
      t.string :blood_type
      t.string :allergies
      t.string :medical_conditions
      t.integer :heightCM
      t.integer :weightKG
    end
  end
end
