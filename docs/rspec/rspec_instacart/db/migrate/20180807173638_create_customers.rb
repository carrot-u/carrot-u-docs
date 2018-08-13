class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.integer :phone, limit: 8
      t.string :street_address
      t.string :city
      t.string :state
      t.string :postal_code
      t.boolean :valid_payment_method
      t.boolean :express_member

      t.timestamps
    end
  end
end
