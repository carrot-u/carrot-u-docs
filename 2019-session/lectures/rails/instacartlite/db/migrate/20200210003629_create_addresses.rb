class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :user
      t.string :label
      t.string :street
      t.string :state
      t.string :city
      t.string :zipcode
      t.boolean :active
      t.string :timestamps

      t.timestamps
    end
  end
end
