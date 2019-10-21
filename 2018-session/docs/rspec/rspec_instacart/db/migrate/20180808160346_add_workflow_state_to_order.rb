class AddWorkflowStateToOrder < ActiveRecord::Migration[5.2]
  def up
    add_column :orders, :workflow_state, :string
  end

  def down
    remove_column :orders, :workflow_state, :string
  end
end
