
def create_order
  puts "Hi! Welcome to Instacart! Let's get started!"
  puts "What's your name?"
  customer_name = gets.chomp
  puts "Thanks, #{customer_name}! What's your delivery address?"
  gets.chomp
  puts "Thanks! Which warehouse would you like to shop at today?"
  gets.chomp
  puts "Great. Let's get some items in your cart. For each item, press enter after typing the name."
  puts "You may select up to 10 items. If you are finished earlier, just type 'done'."
  order_items = []
  10.times do
    item_name = gets.chomp
    break if item_name == 'done'
    order_items << item_name
  end
  puts "Great thanks! Here is your list!"
  order_items.each do |item|
    puts item
  end
end

def submit_order
  puts "Your order is ready to submit. Type Y to continue. Type C to cancel."
  loop do
    response = gets.chomp
    if response.downcase.start_with?("y")
      break
      puts "Thanks! Your order has been placed and is currently being paired with a nearby shopper."
    elsif response.downcase.start_with?("c")
      puts "Sorry to hear that. Your order has been canceled. Goodbye!"
      exit!
    else
      puts "I didn't understand that. Type Y to submit or C to cancel."
    end
  end
end

def shop_order
  puts "Your shopper has arrived at the store and has begun shopping..."
  sleep(1)
  puts "Shopper is replacing your yogurt with your approved replacement..."
  sleep(1)
  puts "Shopper has successfully checked out and can no longer make any changes to your order"
  sleep(1)
  puts "Shopper is on their way. ETA 20 minutes."
end

def deliver_order
  puts "Knock, knock!"
  puts "         _________"
  puts "   __    |       |"
  puts "  (oo)   |       |"
  puts "   ——    |       |"
  puts "   ||——x | o     |"
  puts "   ||    |       |"
  puts "  /  \\   |       |"
  puts "__________________"
  sleep(0.5)
  puts "Your shopper has arrived with your order!"
end

def tiny_instacart
  create_order
  submit_order
  shop_order
  deliver_order
  return "Your order has been delivered! Please make sure to rate us 5 stars and don't forget to tip!"
end

tiny_instacart
