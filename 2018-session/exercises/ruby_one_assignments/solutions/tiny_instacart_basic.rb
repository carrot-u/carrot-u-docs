def shop_order(order_items)
  puts "√" * 40
  puts "Shopper has accepted the order arrived at the Warehouse Location!"
  puts "√" * 40
  puts "\n"
  sleep(1)
  order_items.each do |order_item|
    shopper_locates_item(order_item)
    puts "\n"
  end
  checkout
end

def shopper_picks_item(order_item)
  if order_item == "protein powder"
    puts "Shopper marked #{order_item} as refunded in the app."
    sleep(1)
  else
    puts "Shopper added #{order_item} to their shopping cart and marked found in the app."
    sleep(1)
  end
end

def shopper_locates_item(order_item)
  if order_item == "spinach" || order_item == "banana"
    puts "Shopper found #{order_item} in produce."
  elsif order_item == "egg whites"
    puts "Shopper found #{order_item} in dairy case."
  elsif order_item == "peanut butter"
    puts "Shopper found #{order_item} in the breakfast foods aisle."
  else
    puts "Shopper reported that the store does not carry this item."
  end
  sleep(1)
  shopper_picks_item(order_item)
end

def checkout
  sleep(2)
  puts "\n"
  puts "$" * 40
  puts "Shopper has successfully checked out and is en route to deliver the order!"
  puts "$" * 40
end

order_items = ["spinach", "banana", "protein powder", "egg whites", "peanut butter"]

shop_order(order_items)
