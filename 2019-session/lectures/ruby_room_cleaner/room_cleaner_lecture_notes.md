[Link to weekly assignment](../../assignments/assignment-3-ruby.md)

# Clean Your House with Ruby!


Imagine we are programming a robot to clean your house. Using basic ruby, we can quickly and easily design the robot's most basic functions.


## Objectives
+ Define rooms to be cleaned using variables and arrays
+ Write methods to represent the cleaning processes.
  - Pass arguments to these methods so they know which rooms to clean
  - Use variable interpolation to produce output from the methods.
+ Use conditionals to determine what kind of cleaning happens in each room
+ Use loops to run the same method over every room in the house.

## Things and Stuff

We're going to assign variables to represent our "things" and do "stuff"  to them in the form of methods. In this program the "things" are the rooms, and the cleaning processes are the "stuff.""

## Variables

Ruby allows you to assign most anything to a variable. Here we're defining the variable `room` as the string `"kitchen"`.

In ruby, a string is any collection of characters in quotes.

```ruby
room = "kitchen"
```

You can easily redefine any variable with the same syntax.

```ruby
room = "bedroom"
```

Variables can be strings, integers, booleans, arrays, hashes, constants, etc.

```ruby
window_count = 2

has_carpet = true

```

## Tiny Assignment #1

Define a variable in ruby for an integer, a string, and boolean.

## Methods

Methods are super versatile and can do almost anything. We're going to define a method to clean a room.

```ruby
def add_two_numbers
  2 + 5
end

For easy console output, we can also use `puts`.

`puts` (pronounced "put" "s" is short for "put string").

def hello_world
  puts "Hello World!"
end
```

```ruby
def hello_sum
  sum = 2 + 5
  puts "Hello " + sum
end
```

```ruby
def clean_room
  # some process to actually clean a room
end
```

```ruby
def clean_room
  puts "The room has been cleaned!"
end
```

How is this different from defining a variable? It's not.

```ruby
clean_room = "The room has been cleaned!"
```

But methods can do a lot of other cool stuff.

## Tiny Assignment #2

Define a method in ruby that outputs a simple arithmetic function or string. Method name and output are your choice. For strings, make sure to use `puts`.

## Arguments and Nested Methods

We often pass arguments or parameters to methods.

In lieu of the mechanical function lets use `puts` (put string) to represent what the robot is doing.

For simplicity, let's assume your dwelling only has 3 rooms: a bedroom, a kitchen, and a bathroom.

```ruby
def clean_room(room)
  puts "The " + room + " has been cleaned!"
end
```

You can pass any string in place of `room` and ruby will conform the output.

```ruby
clean_room("broccoli")

# => "The broccoli has been cleaned!"
```

Methods can take any number of arguments.

```ruby
def clean_rooms(room, other_room)
  puts "The " + room + " has been cleaned!"
  puts "The " + other_room + " has been cleaned!"
end
```

Ruby also lets you "interpolate" variables with some special syntax
```ruby
def clean_rooms(room, other_room)
  puts "The #{room} has been cleaned!"
  puts "The #{other_room} has been cleaned!"
end
```

### Tiny Assigment #3

Rewrite the `add_two_numbers` method with arguments to accept any two numbers.


## Methods can call other methods!

`clean_room(room)` is very non-specific. Our robot will need to be given more explicit instructions.

What are things the robot might do in a bedroom?

```ruby
def make_bed
  puts "The beds have been made."
end

def vaccuum(room)
  puts "The #{room} has been vacuumed."
end

def dust(room)
  puts "The #{room} has been dusted."
end

def clean_room(room)
  make_bed
  vaccuum(room)
  dust(room)
  puts "The #{room} has been cleaned."
end
```


##Operators

Just like math, we can compare objects in ruby using `>`, `<`, `==`, `!=`.

```ruby
5 > 3
# => true

3 > 5
# => false

5 == 5
# => true

5 != 5
# => false
```

We can also do this with strings (kind of).

```ruby
"cat" == "dog"
# => false

"cat" == "cat"

"cat" != "dog"
# => true

"cat" > "dog"
# => false

"dog" > "cat"
# => true

"apples" < "avocados"
# => true
```

For our room_cleaner program, we'll use the equality operator (`==`).

```ruby
# Let's define the variable room
room = "bedroom"
=> "bedroom"

# Let's use the equality operator on different values.

room == "bedroom"
=> true

room == "Sigourney Weaver"
=> false

```

**Pro-Tip:** Don't confuse variable assignment (`=`) with the equality operator (`==`)! # literally happens always

## Conditionals

We can encapsulate conditional code that only executes when the condition we set is met.

```ruby
def clean_room(room)
  if room == "bedroom"
    make_bed
    vacuum(room)
  end
  dust(room)
  puts "The #{room} has been cleaned."
end
```

`if` is often paired with `else` in case the input doesn't meet the condition.

```ruby
def clean_room(room)
  if room == "bedroom"
    make_bed
    vacuum(room)
  else
    puts "This room requires no specific cleaning processes."
  end
  dust(room)
  puts "The #{room} has been cleaned."
end
```


`if/else` supports more than two branches.

```ruby
def clean_room(room)
  if room == "bedroom"
    vacuum(room)
    make_bed
  elsif room == "kitchen"
    mop_floor
    wash_dishes
  elsif room == "bathroom"
    mop_floor
    clean_toilet
  else
    puts "The #{room} requires no specific cleaning processes."
  end

  dust(room)
  puts "The #{room} has been cleaned."
end
```

### Tiny Assigment #4

Edit your `add_two_numbers` method to return the sum only if the sum is positive.

## Arrays and Loops

In addition to single objects, ruby allows you to create "collections." The most basic collection is called an array.

```ruby
rooms = ["bedroom", "kitchen", "bathroom", "livingroom"]
```

Arrays are great because we can store multiple objects more efficiently.

So how do we run a method on each element in an array? We use a loop!

```ruby
def clean_house(rooms)
  rooms.each do |room|
    clean_room(room)
  end
end
```
The above method produces the following output:


```ruby
The bedroom has been vacuumed.
The bed has been made.
The bedroom has been dusted
The bedroom has been cleaned.
The floor has been mopped.
The dishes have been washed.
The kitchen has been dusted
The kitchen has been cleaned.
The floor has been mopped.
The toilet has been cleaned.
The bathroom has been dusted
The bathroom has been cleaned.
The livingroom requires no specific cleaning processes.
The livingroom has been dusted
The livingroom has been cleaned.
# and returns the original rooms array
=> ["bedroom", "kitchen", "bathroom", "livingroom"]
```

Let's dissect the each loop.

1. `.each` is a method we can call on a collection. It is essentially telling ruby to iterate over each element on the array.

2. `do` is a keyword that creates a "block" or an encapsulated part of the code where you define what you want to do each array element.

3. `|room|` is called a block variable. It's a way of easily identifying each array element in the code inside the block. Think of it as a shortcut for:
  ```ruby
  puts "The #{array_element_the_code_block_is_iterating_over_right_now} has been cleaned."
  ```
4. `end` signifies that the iterator block is closed. `do` and `end` are the bookends.

### Tiny Assigment #5

Write an each loop that takes an array of numbers and returns the square of each number.

## Run the Program

1. Save the program (if you haven't been all along).
2. Copy the file path.
3. In IRB, type `load '<file_path>'`. If it returns true, irb successfully loaded the file.
4. If you didn't call the main `clean_house(rooms)` method at the end of the file, run it now!
5. If no errors are thrown, watch the MAGIC!



