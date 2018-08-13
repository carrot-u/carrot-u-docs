class CreateDrivers < ActiveRecord::Migration[5.2]
  def change
    create_table :drivers do |t|
      t.string :name
      t.string :email
      t.integer :phone, limit: 8
      t.string :drivers_license_number
      t.string :drivers_license_state
      t.string :vehicle_license_plate
      t.boolean :background_check_clear

      t.timestamps
    end
  end
end
