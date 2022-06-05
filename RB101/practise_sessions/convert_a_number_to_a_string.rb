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
# -divmod to get single digits from the number
#
# Code

# def integer_to_string(integer)
#   str = ''
#   counter = 0
#   array = integer.digits
#   while counter < array.size
#   array.each do |number|
#     str << number
#   end
#       counter += 1
# end
#     str
# end
#
# p integer_to_string(4321) #== '4321'
# integer_to_string(0) == '0'
# integer_to_string(5000) == '5000'


def encode(number)
  number.encode(utf-8)
end
def integer_to_string(integer)
  str = ''
  counter = 0
  array = integer.digits.reverse
  while counter < array.size
    str << array[counter]
          counter += 1
  end

    encode(str)
end

# p ''
# p 1.chr(Encoding::UTF_8).class


p integer_to_string(4321) #== '4321'
# integer_to_string(0) == '0'
# integer_to_string(5000) == '5000'
