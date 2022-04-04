# The String#to_i method converts a string of numeric characters
# (including an optional plus or minus sign) to an Integer.
# String#to_i and the Integer constructor (Integer()) behave similarly.
# In this exercise, you will create a method that does the same thing.
#
# Write a method that takes a String of digits, and returns the appropriate
# number as an integer. You may not use any of the methods mentioned above.
#
# For now, do not worry about leading + or - signs, nor should you worry about
# invalid characters; assume all characters will be numeric.
#
# You may not use any of the standard conversion methods available in Ruby to
# convert a string to a number, such as String#to_i, Integer(), etc. Your method
# should do this the old-fashioned way and calculate the result by analyzing
# the characters in the string.
#
#
# Requirements:
# -this will be a method
# -the method will take a string of digits
# -the method will return appropriate character
# -no ready methods will be used
# -calculate the result by analyzing characters in the string
# - no need to worry about leading + or - signs or invalid characters
#
# Data structures:
# -input: string
# -output: integer
#
# Algorithm:
# -we will define a hash where our symbol will be the string representation
#  of the digit and our key will be the actual digit/number
# -we will now take the string, convert it to an array and, using our hash,
#  we will transform our array of strings into corresponding digits
#  so after converting str to array we have ["4", "3", "2", "1"] and ["5", "7", "0"]
# and after subsequent mapping it to our hash values, we get [4, 3, 2, 1] and [5, 7, 0]
# this is already a transformed array ,an array of INTEGERS
# -now we need to compute their numeric value
# -so we initialize a value variable and set it to reference an intiger 0
# -then we take each value and we multiply it by 10

DIGITS = { "0" => 0, "1" => 1, "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9}

def string_to_integer(str)
  digits = str.chars.map { |char| DIGITS[char] } # at this point I have: [5, 7, 0] or [4, 3, 2, 1]

  value = 0
  digits.each { |digit| value = 10 * value + digit }
  value
end

p string_to_integer('4321') == 4321
p string_to_integer('570')  == 570

# Notes:
# We are using DIGITS hash to convert string digits to their numeric values.
# The actual computation of the numeric value of string is mechanical.
# We take each digit and add it to 10 times the previous value, which yields
# the desired result in almost no time. For example, if we have 4, 3, and 1,
# we compute the result as:
# 10 * 0 + 4 -> 4
# 10 * 4 + 3 -> 43
# 10 * 43 + 1 -> 431

puts ""
#other solutions

def string_to_integer(str)
  ('1'..str).to_a.length
end

p string_to_integer('4321') == 4321
p string_to_integer('570')  == 570

puts ""

# Further Exploration
# Write a hexadecimal_to_integer method that converts a string representing
# a hexadecimal number to its integer value.

HEX_DIGITS = {
  "0" => 0, "1" => 1, "2" => 2, "3" => 3, "4" => 4,
  "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9,
  "A" => 10, "B" => 11, "C" => 12, "D" => 13, "E" => 14, "F" => 15
}

def hexadecimal_to_integer(string)
  digits = string.upcase.chars.map { |char| HEX_DIGITS[char] }
  digits.inject { |value, digit| value * 16 + digit }
end

p hexadecimal_to_integer('4D9f') == 19871
