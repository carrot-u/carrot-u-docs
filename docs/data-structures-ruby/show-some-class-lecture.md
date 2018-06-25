# Show Some Class: Objects and Classes In Ruby

## Key Terms
- data structure
- class
- object

## Data Structures You've Already Been Using

### Arrays
```ruby
dave = ["Dave", 35, true, "🍕"]
dave.include?("🍕")
# true

names = ["Dave", "Muffy", "Chairman Meow"]
names << ["Bender"]
# ["Dave", "Muffy", "Chairman Meow", "Bender"]
names.sort
# ["Bender", "Chairman Meow", "Dave", "Muffy"]
names.size
# 4
```

### Hashes
```ruby
number_of_cats_owned = {
  dave: 1,
  muffy: 3,
  jeremy: 1
}
number_of_cats_owned[:dave]
# 1
number_of_cats_owned.each do |key, value|
  puts "#{key.to_s.capitalize} has #{value} cat(s)."
end

chairman = {
  animal_type: "cat",
  number_of_legs: 4,
  name: "Chairman Meow"
}

trex = {
  animal_type: "dinosaur",
  number_of_legs: 2,
  name: "Rex"
}

chairman[:name]
# "Chairman Meow"
```
## Ok. So What is a data structure?

A **data structure** is a data organization format. It a collection of data values and the relationship among them.

## What is a class? (And what is an object?)

A class is a template or blue print for objects. It describes what and object is and can do.

This means defining what values it can have and what methods it has. Values are accessed by methods (I'll explain what that means later).

The `Array` class has `sort` and `size` method.

An object is an **instance** of a class. You **instantiate** a class and get an object.

Animals have a type, a name, some number of legs, a favorite food, and they can eat!

## Ok. Let's make a class

```ruby
# code here
```

## Now let's use it!

```ruby
# code here
```

## Inheritance

A cat is an animal.
A dinosaur is an animal.
A octopus is an animal.

An octopus can spray ink. A cat cannot (to the best of my knowledge).

**Inheritance** allows classes to take on the properties of other classes. The class that is being inhertited from is called the **parent class** or **base class**.

Ruby has **single inheritance**, which means a class can only have 1 parent.

```ruby
# code here
```
## Ruby Standad Library Classes

The data structures in the Ruby standard library are implemented with classes. You can look at these definitions by looking at the Ruby source code.

The data structures in the Ruby standard library are implemented with classes. You can look at these definitions by looking at the Ruby source code.

### Example: Set

https://github.com/ruby/ruby/blob/trunk/lib/set.rb

```ruby
unique_words = Set.new
unique_words << "rectangle"
unique_words << "America"
unique_words << "megaphone"
unique_words << "rectangle"

puts unique_words
# ["rectangle", "America", "megaphone"]
```

## Bringing It Together

**Classes** describe **data structures**. **Objects** are instances of those classes.

## Getting Started on a NEW Mini Instacart

```ruby
class Customer
  def initialize()
    @orders = []
  end
end

class Order

end
```
