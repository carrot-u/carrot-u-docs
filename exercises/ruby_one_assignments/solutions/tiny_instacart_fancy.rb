drivers = [
  {
    name: "Rose",
    role: "full-service",
    currently_on_shift: true,
    marqeta_funded: true,
    batches_completed_today: 4
  },
  {
    name: "Martha",
    role: "full-service",
    currently_on_shift: false,
    marqeta_funded: true,
    batches_completed_today: 0
  },
  {
    name: "Donna",
    role: "full-service",
    currently_on_shift: true,
    marqeta_funded: true,
    batches_completed_today: 1
  },
  {
    name: "Amy",
    role: "in-store-shopper",
    currently_on_shift: true,
    marqeta_funded: false,
    batches_completed_today: 0
  }
]

def complete_orders(drivers)
  drivers.each do |driver|
    order_flow(driver)
  end
end

def order_flow(driver)
  puts "*" * 40
  offer_batch(driver)
  puts "*" * 40
  puts "\n"
  sleep(1)
end

def offer_batch(driver)
  if driver[:currently_on_shift]
    puts "#{driver[:name]} has accepted the order!"
    start_shopping(driver)
  else
    puts "#{driver[:name]} is not on shift."
  end
end

def start_shopping(driver)
  puts "#{driver[:name]} has begun to shop for the order."
  sleep(2)
  puts "#{driver[:name]} has finished shopping the order and is ready to checkout."
  checkout(driver)
end

def checkout(driver)
  if driver[:marqeta_funded] && driver[:role] != "in-store-shopper"
    puts "#{driver[:name]} has successfully checked out!"
    deliver_order(driver)
  elsif driver[:marqeta_funded] && driver[:role] == "in-store-shopper"
    puts "#{driver[:name]} has successfully checked out and the order has been staged for pick up."
    pay_driver(driver)
  else
    puts "Insufficient funds. #{driver[:name]} must call for padding."
  end
end

def deliver_order(driver)
  puts "#{driver[:name]} has started delivery."
  sleep(2)
  puts "#{driver[:name]} has successfully delivered the order."
  pay_driver(driver)
end

def pay_driver(driver)
  case driver[:role]
  when "full-service"
    puts "#{driver[:name]} has been paid item commission, delivery commission, and tip."
  when "in-store-shopper"
    puts "#{driver[:name]} has been paid the hourly rate."
  end
  update_driver_status(driver)
end

def update_driver_status(driver)
  driver[:batches_completed_today] += 1
  if driver[:batches_completed_today] < 5
    offer_batch(driver)
  else
    puts "#{driver[:name]}'s shift has ended."
  end
end


complete_orders(drivers)

