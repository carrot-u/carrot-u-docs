# Build a Mini Instacart

## Due Date

7/1 11:59pm

## Assignment submission process

- Create a new branch of the [assignments repo](https://github.com/carrot-u/assignments)
- Create a folder in the week4 folder for your submission.
- Once done, create a pull request to add you code to the repo. How to do that? All details [here](https://github.com/carrot-u/carrot-u-docs/blob/master/docs/overview/submitting-with-git.md).
Git is sometimes tricky, ask your mentors if you have issues.

# Instructions

The goal of this assignment is to use your understanding of classes in to build a Mini Instacart in Ruby.

You should be able to create a new customer, then "place orders" as that customer, and then have those orders "fulfilled"

Build classes so that the following code will work. I've left several parts blank ( note all the `...` ) so you can decide what needs to go there.

Use the code below as a starting point but feel free to expand on this functionality.

*Hint: you will probably need (at least) Customer, Shopper, Order, and Item classes. You can certainly create more.*

```ruby
catalog = {
  popsicle: Item.new(...),
  cheese: Item.new(...),
  fruit_snack: Item.new(...),
  ...
}

shoppers = [Shopper.new(...),...]

dave = Customer.new(...)

dave.orders
# []

dave.address = "123 Fake St. San Francisco, CA"

dave.add_item_to_cart(cheese)
puts dave.cart
# returns the items in the cart

puts dave.cart.total
# returns the total value of the current cart

dave.place_order

puts dave.orders

order = dave.orders.last

shopper = shoppers.sample # this is a way to get a random element from an Array in Ruby!

shopper.assign_order(order)

puts shopper.current_order

shopper.pick_current_order

shopper.deliver_current_order

puts order.status
# print out the status of this order

```
