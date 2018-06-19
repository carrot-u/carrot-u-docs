## Ruby One Assigments

### 1. Customize the [room_cleaner](../../ruby_room_cleaner/room_cleaner_complete.rb) program.

**Possibilities:**
  + Accept user input to get room names (or offer a selection of available rooms)
  + Create an invoice-style output at the end of the program that varies based on the rooms and processes completed.

### 2. Tiny Instacart!

  _Compose a simple terminal program using one or more of the common objects from Instacart (`orders`, `drivers`, `batches`, `order_items`, `payments`, etc)_

  1. Design a desired workflow. ex. The entire flow of a driver from accepting a batch to delivery
  2. Using the tools and concepts from [`room_cleaner_complete.rb`](../../ruby_room_cleaner/room_cleaner_complete.rb), construct a self-running terminal program that successfully runs through your intended workflow.
  3. Test your program thoroughly to ensure that it runs as expected.

**Possible Extensions:**
  + Ruby offers alternatives to `if/else` including `unless`, `while`, and `until`.
  + Set parameters for your program through user input
  + Make sure to incorporate `if/else` and the appropriate operators.
  + Look up how to use a ruby hash to create an array with multiple attributes per array element and run an each loop that checks the values of said attributes. ex. (`drivers = [{name: "Rose", role: "in-store-shopper"}, {name: "Donna", role: "shift-lead"}, {name: "Amelia Pond", role: "full-service"}, {name: "Martha Jones", role: "cashier"})


### 3. Guessing Game:
  _Create a simple terminal program where the user guesses a randomly generated number._

**Hints:**
  + You'll want to look at other kinds of loops, the `rand()` method,  and `gets.chomp` logic
  + _**Bonus:**_ REVERSE IT! Have the computer guess the user's input.
  + _**MOAR Bonus:**_ Look up how to implement a "binary search" to minimize the number of guesses the computer makes.
