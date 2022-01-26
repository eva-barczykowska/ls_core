# Write a method that returns true if its integer argument is palindromic,
# false otherwise. A palindromic number reads the same forwards and backwards.

# Explicit requirement:
# -a method that takes an ingeter
# -returns a boolean
#
# Data structure:
# -integer
# -string
# -boolean
#
# Algorithm:
# -change the integer to string
# -check if the string reads same forward and backwards

def palindromic_number?(number)
  number.to_s == number.to_s.reverse
end

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true

# ls solution:

# def palindromic_number?(number)
#   palindrome?(number.to_s)
# end

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true

puts

# Further Exploration
# Suppose your number begins with one or more 0s. Will your method still work?
# Why or why not? Is there any way to address this?
def palindromic_number?(number)
  number = number.to_f
  number
  # number == number.to_s.reverse
end

p palindromic_number?(034543) #== true
p palindromic_number?(00123210)# == false
p palindromic_number?(00022) #== true
p palindromic_number?(00005) #== true

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true

# If the number begins with one or more 0s? First, if any number between 0..7
# begins with zeros Ruby will return that number.
# example 006 # => 6
# 00000000007 # => 7
# Second, numbers between 0..9 that begin with zeros - Ruby will consider them
# as an octal numbers Base 8 and convert them to decimal Base 10.
# So the only way to avoid doing this is to pass the numbers as a string object.
# example 000000075 # => 61

# *****

# Ruby seems to do 1 of 2 things when leading numbers with 0.
#
# If a single digit(0-9) is lead by any number of 0s, it will flat out remove
# the leading 0s, leaving you with the final digit.
# Examples:
# 0000000 becomes 0
# 0000005 becomes 5
# If multiple digits(0-9) are lead by any number of 0s, it will assume
# the number is Octal(Base 8) and convert it to Decimal(Base 10).
# Examples:
# 00050 becomes 40
# 0005000 becomes 2560
# 000000005000 becomes 2560
