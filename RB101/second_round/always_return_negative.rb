=begin
Always Return Negative
Write a method that takes a number as an argument.
If the argument is a positive number,
return the negative of that number.
If the number is 0 or negative, return the original number.

PEDAC
Problem
-write a method, the method takes a number as an argument
-if the number is positive, the method returns negative version of that number
if the number if 0 or negative, return the original number

Examples
negative(5) == -5
negative(-3) == -3
negative(0) == 0      # There's no such thing as -0 in ruby

Data Structures
input: integer, positive, negative or zero
output: zero or negative integer if argument was 0 or negative integer

Algorithm
check for the absolute value of the passed in argument, e.g.
2.abs == 2 #=> true
if the absolute value is equal to the value or the argument,
return the negative version of the argument
else, return the argument

Code
=end
def negative(num)
  num == num.abs ? -num : num
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0 # There's no such thing as -0 in ruby

puts

# love this simple ls solution
def negative(number)
  number > 0 ? -number : number
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0