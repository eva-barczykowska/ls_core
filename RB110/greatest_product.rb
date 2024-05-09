# Problem 15
# Create a method that takes a string argument that consists entirely of numeric digits and computes the greatest product of four consecutive digits in the string. The argument will always have more than 4 digits.
# p greatest_product('23456') == 360      # 3 * 4 * 5 * 6
# p greatest_product('3145926') == 540    # 5 * 9 * 2 * 6
# p greatest_product('1828172') == 128    # 1 * 8 * 2 * 8
# p greatest_product('123987654') == 3024 # 9 * 8 * 7 * 6
#
# Problem
# ========
# -method takes a str argument
# --only numbers
# -method returns the greatest product(result from multiplication) of 4 consecutive digits in the string
# -argument will always have more than 4 digits
#
# Examples
# =========
# p greatest_product('23456') == 360      # 3 * 4 * 5 * 6
# 2*3*4*5 => 120
# 3*4*5*6 => 360
# p greatest_product('3145926') == 540    # 5 * 9 * 2 * 6
# p greatest_product('1828172') == 128    # 1 * 8 * 2 * 8
# p greatest_product('123987654') == 3024 # 9 * 8 * 7 * 6
#
# Algorithm
# GET slices from the argument
#
# CHANGE those slices to an integer
# TRANSFORM integer into digits
# MULTIPLY digits in each slice
#
# RETURN the greatest product

def greatest_product(n)
  slices = []

  (0...n.size - 3).each do |start|
    slices << n.slice(start, 4)
  end

  slices.map { |s| s.to_i.digits.inject(:*) }.max
end
p greatest_product('23456') == 360      # 3 * 4 * 5 * 6
p greatest_product('3145926') == 540    # 5 * 9 * 2 * 6
p greatest_product('1828172') == 128    # 1 * 8 * 2 * 8
p greatest_product('123987654') == 3024 # 9 * 8 * 7 * 6
