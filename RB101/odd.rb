# Write a method that takes one integer argument, which may be positive, negative, or zero.
# This method returns true if the number's absolute value is odd. You may assume that the argument is a valid integer value.

# Example:
# puts is_odd?(2)    # => false
# puts is_odd?(5)    # => true
# puts is_odd?(-17)  # => true
# puts is_odd?(-8)   # => false
# puts is_odd?(0)    # => false
# puts is_odd?(7)    # => true
#
# Problem solving steps:
# inputs:
#   integer, negative, positive or zero

# outputs:
#   true if the number's absolute value is odd

# clarifying questions:
# which are odd numbers?
# what will happen if the input is 0

# data structures:
#   input is integer
#   output is a boolean

# algorithm
# read input, verify if it has a remainder while divided by 2
# if it does, it means it's an odd number
# in that case, return true

# example
# puts is_odd?(2)    # => false
# puts is_odd?(3)    # => true

def is_odd?(integer)
  integer % 2 != 0 ? true : false
end
# test cases
puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true
puts is_odd?(10)    # => true
