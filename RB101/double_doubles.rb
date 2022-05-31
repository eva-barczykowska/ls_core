# A double number is a number with an even number of digits whose left-side digits
# are exactly the same as its right-side digits. For example, 44, 3333, 103103,
# 7676 are all double numbers. 444, 334433, and 107 are not.
#
# Write a method that returns 2 times the number provided as an argument, unless
# the argument is a double number; double numbers should be returned as-is.
#
# Note: underscores are used for clarity above. Ruby lets you use underscores
# when writing long numbers; however, it does not print the underscores when
# printing long numbers. Don't be alarmed if you don't see the underscores when
# running your tests.
#
# PEDAC
# Problem
# -write a method
# -the method takes a number as an argument
# -verify if this number is a double number
#  *what is a double number?
#  *it is a number whose left side digits are same as right side digits
#  *examples 7676, 3333, 103103
#  *so if it is a double number, the method returns double number(the argument)
# -if its not a double number, the method returns double of that number (number * 2)
#
# Examples
# -as below
#
# Data structures
# -input: Integer
# -output: Integer
#
# Algorithm
# -write a method that takes a number as an argument
# -if it is just 1 number, return it as it is
# -if it is more than 1 number, ask if it is even or odd
# -odd numbers will have to be multiplied by 2
# -even numbers, divide them in half
# -verify if both halves are the same
# -if they are, return the number
# -if they are not, return number * 2

# Code

def twice(num)
  if num.digits.size == 1
    num * 2
  elsif num.digits.size > 1
    if num.digits.size.odd?
      num * 2
    else num.digits.size.even?
      half = num.digits.size / 2
      num.digits.first(half) == num.digits.last(half) ? num : (num * 2)
    end
  end
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10

# ls solution
def twice(number)
  string_number = number.to_s
  center = string_number.size / 2
  left_side = center.zero? ? '' : string_number[0..center - 1]
  right_side = string_number[center..-1]

  return number if left_side == right_side
  return number * 2
end

# Once you understand that what you are looking for is the left and right side to
# the number, all you really need to do is to derive those values and then
#   compare them. Now if the logic for getting each side seems complex it is
#   actually probably easier to break it down even further.
#
# First turn the number into a string, then find the center of the string. Next,
# create a variable for the right and left sides. Finally compare and return based upon that.
#
# Note that there is an edge case for single digit numbers; in this case, center
# is calculated as 0. If we don't pay attention to this case, we end up setting
# both left_side and right_side to string_number[0..-1], which, in the case of
# a single character string, is equal to that character.

puts ""

def double_number?(number)
  str = number.to_s
  str[0..(str.size/2 - 1)] == str[(str.size/2)..(str.size - 1)]
end

puts ""
def twice(number)
  return number if number.to_s.length.even? && double_number?(number)
  number * 2
end

puts ""
def twice(number)
  string = number.to_s
  half = string.length / 2

  string[0...half] == string[half..-1] ? string.to_i : string.to_i * 2
end

puts ""
def twice(num)
  double_number?(num) ? num : num * 2
end

def double_number?(num)
  num = num.to_s
  return false if num.size.odd?
  middle_index = num.size / 2
  num[0...middle_index] == num[middle_index..- 1]
end
