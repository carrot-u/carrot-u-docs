loop do
  puts "Welcome to the guessing game! Press ctrl+c at any time to quit."
  random_number = rand(100)
  puts "Pick any number between 0 and 100:"
  guess = gets.chomp.to_i

  until guess == random_number
    if  guess > 100 || guess < 0
      puts "Out of range. Number is between 0 and 100!"
    elsif guess < random_number
      puts "Too Low"
    elsif guess > random_number
      puts "Too High"
    else
      puts "Invalid guess."
    end
    guess = gets.chomp.to_i
  end

  puts "That's right! Play again? y/n"
  response = gets.chomp

  if response == "n"
    puts "#kthxbai"
    break
  end
end
