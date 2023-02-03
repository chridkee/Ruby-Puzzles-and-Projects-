# Write a method, coprime?(num_1, num_2), that accepts two numbers as args.
# The method should return true if the only common divisor between the two numbers is 1.
# The method should return false otherwise. For example coprime?(25, 12) is true because
# 1 is the only number that divides both 25 and 12.

def coprime?(num1, num2)
  facts1 = []
  facts2 = []
  (2..num1).each do |fact|
    if num1 % fact == 0 
      facts1 << fact 
    end 
  end 
  (2..num2).each do |fact2|
    if num2 % fact2 == 0 
      facts2 << fact2 
    end 
  end 
  return false if facts1.any?{|factor| facts2.include?(factor)}
  return false if facts2.any?{|factor2| facts1.include?(factor2)}
  return true 
end 

 

p coprime?(25, 12)    # => true
p coprime?(7, 11)     # => true
p coprime?(30, 9)     # => false
p coprime?(6, 24)     # => false
