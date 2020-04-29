class Balanced
  def self.balanced?(s)
    new(s).balanced?
  end

  BRACKETS = {
    '{' => '}',
    '[' => ']',
    '(' => ')'
  }

  OPENING = BRACKETS.keys
  CLOSING = BRACKETS.values

  attr_reader :expression, :stack

  def initialize(s)
    @stack = []
    @expression = s
  end

  def balanced?
    expression.each_char do |ch|
      if OPENING.include?(ch)
        push(ch)
      elsif CLOSING.include?(ch)
        ### compare 
        return false if BRACKETS[pop] != ch
      end
    end

    return stack.size.zero?
  end

  def pop
    stack.pop
  end

  def push(ch)
    stack.push(ch)
  end
end

examples = [
  '[ 1 + ( 2 + 3 ) ] ',
  '( 1 + 1',
  '[ ( ) { } ( {} ) ] ()'
]

examples.each do |e|
  balanced = Balanced.balanced?(e) ? 'balanced' : 'not balanced'
  puts "#{e} is #{balanced}"
end

