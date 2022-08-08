=begin
Always Return Negative
Write a method that takes a number as an argument.
If the argument is a positive number, return the negative of that number.
If the number is 0 or negative, return the original number.

PEDAC
Problem
-write a method that takes a number as an argument
-if it is a positive number, return the negative of that number
-if the number is 0 or negative, return the original number

Examples
negative(5) == -5
negative(-3) == -3
negative(0) == 0      # There's no such thing as -0 in ruby

Data Structure
input: integer
output: integer

Algorithm
-verify if the number is negative and if so, return it
-if the number is zero, return zero
-if the number is positive, return the negative

Code
=end

def negative(number)
  if number.positive?
    return -number
  else
    return number
  end
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0      # There's no such thing as -0 in ruby

puts ""

#ls solution
def negative(number)
  number > 0 ? -number : number
end
p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0

puts ""

# Further exploration:
def negative(number)
  -number.abs
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0

# abs returns the absolute value of a number (the non-negative value of a number without regard to its sign)

#Other solutions:
def negative(int)
  int.negative? ? int : -int
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0

puts ""

def negative(int)
  int <= 0  ? int : -int
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0

puts ""

def negative(num)
  num.positive? ? -num : num
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0
