class ChangeEetaToEta < ActiveRecord::Migration[6.0]
  def change
    rename_column :waypoints, :estimated_eta, :eta
  end
end
