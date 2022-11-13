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

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570

# The actual computation of the numeric value of string is mechanical.
# We take each digit and add it to 10 times the previous value,
# which yields the desired result in almost no time.
# For example, if we have 4, 3, and 1, we compute the result as:
# 10 * 0 + 4 -> 4
# 10 * 4 + 3 -> 43
# 10 * 43 + 1 -> 431

puts
# other solutions

def string_to_integer(n)
  integer = 0

  loop do
    break if integer.to_s == n
    integer += 1
  end
  integer
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570

puts

def matcher(input)
  output = nil
  case input
  when '0'
    output = 0
  when '1'
    output = 1
  when '2'
    output = 2
  when '3'
    output = 3
  when '4'
    output = 4
  when '5'
    output = 5
  when '6'
    output = 6
  when '7'
    output = 7
  when '8'
    output = 8
  when '9'
    output = 9
  end
end

def str_to_i_converter(string_num)
  array = string_num.split('')
  integer_array = []

  array.each do |element|
    integer_array << matcher(element)
  end
  p integer_array


  integer_array.inject(0){ |sum,i| sum * 10 + i} # is the default argument of inject 0?
end

p "last one"
p str_to_i_converter('4321') == 4321
p str_to_i_converter('570') == 570

puts

# ls solution

DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_integer(string)
  digits = string.chars.map { |char| DIGITS[char] }

  value = 0
  digits.each { |digit| value = 10 * value + digit }
  value
end

puts "other solutions"

def string_to_integer(num)
  target = 0
  loop do
    target += 1
    break if target.to_s == num
  end
  target
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570

puts
puts "study session with AJ"

NUMBERS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_integer(string)
  sum = 0
  digits = []
  string.each_char { |char| digits << NUMBERS[char] }
  digits.each do |num|
    sum = sum * 10 + num #4, 43, 432, 4321
  end
  sum
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570
