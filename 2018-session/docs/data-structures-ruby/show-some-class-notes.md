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
names << "Bender"
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

A class is a template or blueprint for objects. It describes what and object is and can do.

This means defining what values it can have and what methods it has. Values are accessed by methods (I'll explain what that means later).

The `Array` class has `sort` and `size` method.

An object is an **instance** of a class. You **instantiate** a class and get an object.

Animals have a type, a name, some number of legs, a favorite food, and they can eat!

## Ok. Let's make a class

*(build live)*

```ruby
class Animal

  attr_reader :number_of_legs, :name, :type_of_animal
  attr_accessor :favorite_food

  def initialize(type_of_animal, name, number_of_legs, favorite_food)
    @type = type_of_animal
    @name = name
    @number_of_legs = number_of_legs
    @favorite_food = favorite_food
  end

  # def name
  #   @name
  # end

  def eat(food)
    eating_str = "You fed #{@name} some #{food}."
    if food == @favorite_food
      eating_str += " They really liked it!"
    end
    puts eating_str
  end
end
```

## Now let's use it!

*(build live)*

```ruby
chairman = Animal.new("cat", "Chairman Meow", 4, "BBQ chips")
trex = Animal.new("dinosaur", "Rex", 2, "people")

dino_name = trex.name
puts trex.number_of_legs

trex.number_of_legs = 4 # NoMethodError

chairman.eat("ham")
chairman.eat("BBQ chips")
chairman.favorite_food = "ham"
chairman.eat("ham")
```

## Inheritance

A cat is an animal.
A dinosaur is an animal.
A octopus is an animal.

An octopus can spray ink. A cat cannot (to the best of my knowledge).

**Inheritance** allows classes to take on the properties of other classes. The class that is being inhertited from is called the **parent class** or **base class**.

Ruby has **single inheritance**, which means a class can only have 1 parent.

*(build live)*

```ruby
class Animal
  def emoji
    "😶"
  end
end

class Octopus < Animal
  def spray_ink
    puts "🐙✒️"
  end

  def emoji
    "🐙"
  end
end

def Cat < Animal
  def emoji
    "😸"
  end
end
```

*To share roles or behavior look into using **modules** in Ruby.*

## Ruby Standard Library Classes

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

  attr_accessor :name, :email, :address, :orders

  def initialize(name, email, address)
    ...
    @orders = []
  end
end

class Order

end
```
