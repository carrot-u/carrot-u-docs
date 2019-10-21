class ChangeTotalsInOrder < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :total, :float
  end
end
