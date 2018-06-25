# Build a Mini Instacart

The goal of this assignment is to use your understanding of classes in to build a Mini Instacart in Ruby.

You should be able to create a new customer, then "place orders" as that customer.

Build classes so that the following code will work.

*Hint: you will probably need (at least) Customer, Order, and Item classes. You can certainly create more.*

```ruby
catalog = {
  popsicle: Item.new("Popsicle Multi-Flavor Pack", 4.99),
  cheese: Item.new("Blue Cheese", 8.99),
  fruit_snack: Item.new("Motts Fruit Snacks: 12 pack", 3.29)
}

dave = Customer.new("Dave", "dave.schwantes@instacart.com")
dave.orders
# []

dave.address = "123 Fake St. San Francisco, CA"

dave.add_item_to_cart(cheese)
puts dave.cart
# returns the items in the cart

puts dave.cart.total
# returns the total value of the current cart

dave.place_order

dave.orders
```
