# to run this code in the terminal: `ruby show-some-class-code.rb`

class Sound
  attr_accessor :type_of_animal, :sound

  def initialize(type_of_animal, sound)
    @type_of_animal = type_of_animal
    @sound = sound
  end
end

class Animal

  attr_reader :name, :type, :number_of_legs
  attr_accessor :favorite_food

  @@sounds = {
    dinosaur: Sound.new("dinosaur", "rawr"),
    cat: Sound.new("cat", "meow")
  }

  def initialize(type_of_animal, name, number_of_legs, favorite_food)
    @type = type_of_animal
    @name = name
    @number_of_legs = number_of_legs
    @favorite_food = favorite_food
  end

  def eat(food)
    eating_str = "#{name} ate #{food}."
    if food == favorite_food
      eating_str += " They really liked it!"
    end

    puts eating_str
  end

  def make_sound
    puts @@sounds[type.to_sym].sound
  end

  def emoji
    "😶"
  end

  # def name
  #   @name
  # end
end

class Cat < Animal

  def initialize(name, favorite_food = "pizza")
    @type = "cat"
    @number_of_legs = 4
    @name = name
    @favorite_food = favorite_food
  end

  def purr
    puts "prrrrrrrrrrrr"
  end

  def emoji
    "😸"
  end

  def make_sound
    purr
  end
end

module Cleanable
  def clean
    puts "thing cleaned!"
  end
end

class Car
  include Cleanable
end

class Room
  include Cleanable

  def initialize
  end

  # def clean
  #   puts "room cleaned!"
  # end
end

module Moppable
  def mop_floor
    puts "mopping"
  end
end

class Kitchen < Room
  include Moppable

  def clean
    mop_floor
  end
end

class Bathroom < Room
  include Moppable

  def clean
    mop_floor
    puts "toilets scrubbed"
  end
end

# thing = Cleanable.new # BAD!

# CamelCase
# snake_case


# house = [Room.new, Kitchen.new, Bathroom.new, Room.new]
#
# house.each do |room|
#   room.clean
# end


chairman = Cat.new("Chairman Meow")
puts chairman.name
puts chairman.favorite_food



# puts chairman.type
# chairman.purr
# chairman.make_sound
# puts chairman.emoji
# chairman.eat("pizza")

# puts chairman.favorite_food

# chairman.favorite_food = "pizza"

# puts chairman.favorite_food


# chairman.eat("BBQ chips")
# chairman.favorite_food = "BBQ chips"
# chairman.eat("BBQ chips")

# trex = Animal.new("dinosaur", "Rex", 2, "people")
#
# mr_legs = Animal.new("octopus", "Mr. Legs", 8, "I dunno, fish?")
# mr_legs.make_sound
