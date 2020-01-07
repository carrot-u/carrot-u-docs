# to run this code in the terminal: `ruby show-some-class-live-code.rb`

module Greeter
    def greet 
        puts "hi"
    end
end

class Robot
    include Greeter
end

# class Talker
# end

# class Animal < Talker
# end

# class Robot < Talker
# end

class Animal
    include Greeter

    attr_accessor :number_of_legs, :name
    # def name
    #     @name
    # end

    # def number_of_legs
    #     @number_of_legs
    # end

    # def number_of_legs=(new_num_legs)
    #     @number_of_legs = new_num_legs
    # end

    # def name=(new_name)
    #     @name = name
    # end

    def initialize(name, num_legs, type_of_animal)
        @type = type_of_animal
        @name = name
        @number_of_legs = num_legs
    end

    def self.are_animals_alive?
        puts "yup!"
    end

    def make_sound
        puts @@sounds[@type.to_sym]
    end

end

class Cat < Animal
    def initialize(name)
        @name = name
        @number_of_legs = 4
        @type = "cat"
        @sound = "meow"
    end

    def make_sound
        puts "purrrrr"
    end

    def say_hi
        puts "also, meow"
    end

    def claw_the_couch
        # TODO: write method to claw up couch
        puts "couch clawed"
    end
end

class Dinosaur < Animal

    def initialize(name, number_of_legs)
        @name = name
        @number_of_legs = number_of_legs
        @type = "dinosaur"
        @sound = "rawr"
    end

    def say_hi
        greet
        puts @sound
    end
end




# Cat.are_animals_alive?

# chairman = Cat.new("Chairman")
# # puts chairman
# chairman.say_hi
# trex = Dinosaur.new("Rex", 2)
# trex.say_hi

# puts chairman.number_of_legs

# chairman.make_sound

# trex = Animal.new("Rex", 2, "dinosaur")
# trex.make_sound
# chairman.greet 
# robot = Robot.new
# robot.greet

# chairman.claw_the_couch # Cat
# # trex.claw_the_couch # Dinosaur
# rover = Animal.new("Rover", 4, "dog")
# rover.claw_the_couch # Animal 

class Order
    STATUSES = ["new", "shopping", "complete"]

    def initialize(user)
        @user = user
        @status_index = 0
    end

    def status
        STATUSES[@status_index]
    end

    def advance_status
        @status_index += 1
        # @status_index = @status_index + 1
    end
end

my_order = Order.new
# my_order.status = "shopping"
# my_order.status = "on the moon"
puts my_order.status
my_order.advance_status
puts my_order.status
