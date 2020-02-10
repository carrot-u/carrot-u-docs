class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.text :street
      t.text :city
      t.text :state
      t.text :zip_code
      t.boolean :active

      t.timestamps
    end
  end
end
