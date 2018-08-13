class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :driver

  validates_presence_of :items, :warehouse

  def advance_to_next_stage
    return if workflow_state == "delivered"
    case workflow_state
    when "brand_new"
      update(workflow_state: "shopping")
    when "shopping"
      update(workflow_state: "delivered")
    end
    customer.send_update(self)
  end
end
