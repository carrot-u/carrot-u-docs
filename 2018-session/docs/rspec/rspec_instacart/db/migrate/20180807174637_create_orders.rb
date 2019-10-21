class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :customer, foreign_key: true
      t.references :driver, foreign_key: true
      t.text :items, array: true, default: []
      t.string :warehouse
      t.money :total
      t.boolean :replacements_ok, default: true

      t.timestamps
    end
  end
end
