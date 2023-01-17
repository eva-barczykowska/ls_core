# Convert a Number to a String!
# In the previous two exercises, you developed methods that convert simple
# numeric strings to signed Integers. In this exercise and the next, you're
# going to reverse those methods.

# Write a method that takes a positive integer or zero, and converts it to
# a string representation.

# You may not use any of the standard conversion methods available in Ruby,
# such as Integer#to_s, String(), Kernel#format, etc. Your method should do
# this the old-fashioned way and construct the string by analyzing and
# manipulating the number.

# integer_to_string(4321) == '4321'
# integer_to_string(0) == '0'
# integer_to_string(5000) == '5000'

# PEDAC
# Problem
# -write a method that takes an integer argument
# -the method returns a string
# -I'm not allowed to use Integer#to_s, etc.

# Examples
# integer_to_string(4321) == '4321'
# integer_to_string(0) == '0'
# integer_to_string(5000) == '5000'

# Data structures
# input: integer
# middle: array
# output is a string

# Algorithm
# -initialize a str variable to an empty string
# -convert the integer to an array
# -iterate though the array
# -add each element of the array to the string but when adding, change its byte
# representation to an integer and join it
# -return the latest version of the joined string

# Code

require 'pry'

def integer_to_string(int)
  res = ''
  int_array = int.digits.reverse
  int_array.each do |element|
    res << element # += vs << #If object is an Integer, the value is considered a CODEPOINT and converted to a character before concatenation
  end
  # p res # => "\u0004\u0003\u0002\u0001"
  res = res.chars # => ["\u0004", "\u0003", "\u0002", "\u0001"]
  res = res.map(&:bytes) # => [[4], [3], [2], [1]]
  # res = res.map(&:codepoints) # it is also possible to use #codepoints method
  res.flatten.join
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'

puts

# refactored
def integer_to_string(int)
  res = ''
  int_array = int.digits.reverse
  int_array.each do |element|
    res << element
 end
  res.chars.map! do |s|
    s.bytes
  end.flatten.join
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'

puts
# ls solution
DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(number)
  result = ''
  loop do
    # binding.pry
    number, remainder = number.divmod(10) # initializing 2 variables at the same time!
    result.prepend(DIGITS[remainder]) # prepend is a String and Array method!
    break if number == 0
  end
  result
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'

puts

# Amy's solution
def integer_to_string(number)
  number.digits.reverse.join
end
p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'
