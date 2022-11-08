# =begin
# Question:
# Convert a String to a Number!
# The String#to_i method converts a string of numeric characters (including an
# optional plus or minus sign) to an Integer. String#to_i and the
# Integer constructor (Integer()) behave similarly.
# In this exercise, you will create a method that does the same thing.
#
# Write a method that takes a String of digits, and returns the appropriate
# number as an integer. You may not use any of the methods mentioned above.
#
# For now, do not worry about leading + or - signs, nor should you worry
#   about invalid characters; assume all characters will be numeric.
#
# You may not use any of the standard conversion methods available in Ruby
# to convert a string to a number, such as String#to_i, Integer(), etc.
# Your method should do this the old-fashioned way and calculate the result by
# analyzing the characters in the string.

# PEDAC
# Problem
# -I am given an string of digits as an argument to the method
# -the method that I write has to convert that string into an integer
# -String#to_i behave similarly  - go the the documentation and check
# -I looked how String#to_i works
# -there is something about base 10, like the last number is ones, then tens,
# then hundreds then thousands then ten-thousands, etc.

# Examples:
# p string_to_integer('4321') == 4321
# p string_to_integer('570') == 570
#
# Data structures:
# input: String
# middle: Hash
# output: Integer
#
# Algorithm
# - create a result variable
# - create a hash with keys that are strings from "0" to "9" and values that are
#   correspnding integers
# - iterate through each character in the string argument
# -see where it exists in the hash as a key and add to the result the correspnding
#  value
# -return the result
#
# Code:

# def string_to_integer(str)
#   str.to_f.round
# end
#
# p string_to_integer('4321') == 4321
# p string_to_integer('570') == 570

puts

def string_to_integer(str)
  result = 0
  strings = %w(0 1 2 3 4 5 6 7 8 9)
  integers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  reference_hash = strings.zip(integers).to_h  # create a hash
  p reference_hash

  digits = str.chars.map { |element| reference_hash[element] } # use map and the reference_hash to transform the array of strings into array of digits
  p digits # here we get an array of integers
  value = 0
  digits.each { |digit| value = 10 * value + digit } # 10*0+4, 10*0+3, 10*0+2, 10*0 + 1 -- do this with pry
  value
end

p string_to_integer('4321') #== 4321
# p string_to_integer('570') == 570
