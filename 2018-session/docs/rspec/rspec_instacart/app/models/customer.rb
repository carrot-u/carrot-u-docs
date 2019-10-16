class Customer < ApplicationRecord
  has_many :orders

  def send_update(order)
    case order.workflow_state
    when "shopping"
      puts "Good news, #{name}, #{order.driver.name} has started shopping your #{order.warehouse} order!"
    when "delivered"
      puts "Your order from #{order.warehouse} has been delivered. Click here to rate your experience. Thank you for using Instacart."
    end
  end
end
