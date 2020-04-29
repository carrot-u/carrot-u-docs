# change 10
# coins [ 1, 5 ]
# 5 , 5 => 2 coins

# change 7
# coins [ 1, 5]
# 5 , 1 ,1 => 3 coins
# 1,1,1,1,1,1,1 => 7 coins 
# 3 coins

class Coins
  # it is possible to give amount with coins 
  # at least some coins has smaller value than amount
  def self.minimal_change(amount, coins)
    new(coins).subproblem(amount)
  end

  attr_reader :amount, :coins, :memo

  def initialize(coins)
    @memo = {}   
    @coins = coins.sort.reverse # 5, 1
  end

  def subproblem(amount) # 5
    minimum_number_of_coins = Float::INFINITY
    return -1 if amount.negative?
    return 0 if amount.zero?
    return memo[amount] if memo.key?(amount)

    coins.each do |coin| 
      remaining_amount = amount - coin
      remaining_number_of_coins = subproblem(remaining_amount)
      next if remaining_number_of_coins == -1      
      if minimum_number_of_coins > 1 + remaining_number_of_coins
        minimum_number_of_coins = 1 + remaining_number_of_coins
      end
    end

    if minimum_number_of_coins != Float::INFINITY
      memo[amount] = minimum_number_of_coins 
    else
      memo[amount] = -1
    end
    
    memo[amount]
  end
end

puts "5, [1,5] => #{Coins.minimal_change(5, [1,5])} coins"

puts "10, [1,5] => #{Coins.minimal_change(10, [1,5])} coins"

puts "17, [1, 3, 5] => #{Coins.minimal_change(17, [1, 3, 5])} coins"




fib(n) = fib(n-1) + fib(n-2)
fib(15) = fib(14) + fib(13)
= fib(13) + fib(12) + fib(13)
= fib(12) + fib(11) + fib(12) + fib(12) + fib(11)