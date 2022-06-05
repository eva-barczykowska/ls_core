# # In the previous two exercises, you developed methods that convert simple
# numeric strings to signed Integers. In this exercise and the next, you're going
# to reverse those methods.
#
# # Write a method that takes a positive integer or zero, and converts it to a
# string representation.
#
# # You may not use any of the standard conversion methods available in Ruby,
# such as Integer#to_s, String(), Kernel#format, etc. Your method should do this
# the old-fashioned way and construct the string by analyzing and manipulating
# the number.

# PEDAC
# Problem
# -write a method
# -method takes a positve integer or zero as an argument
# -method converts it to a string
# -do it by analyzing and manipulating the number
#
# Examples
# integer_to_string(4321) == '4321'
# integer_to_string(0) == '0'
# integer_to_string(5000) == '5000'
#
# Data Structures
# input: integer
# output: string
#
# Algorithm
# -define a variable and point it to an empty str, this will be my result
# - initialize a counter
# - change the integer into an array of numbers
# -add in turn those numbers to the result string
# -well, the numbers are being added as a utf-encoded elemenst like "\u0004\u0003\u0002\u0001"
# -I need to decode those to be numbers again and add them to the string
# -I will create an additional variable, an array
# -I will decode each of those numbers and push them onto the final result array
# -I will join that array, so that it becomes a string
# -done!
#
# Code

def integer_to_string(integer)
  final_result = []
  str = ''
  counter = 0
  array = integer.digits.reverse
  while counter < array.size
    str << array[counter]
    counter += 1
  end
   str.each_codepoint {|c| final_result <<  c }
  final_result.join
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'
