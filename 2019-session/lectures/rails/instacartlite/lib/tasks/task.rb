module Tasks

  class Task

  end

  #
  module TaskModule

    # @returns [string] Hello
    def self.my_method1  
      binding.pry  
      puts "hello from my_method1"
      my_method2
    end


    def self.my_method2   
      puts "hello from my_method2"
    end

  end

end
