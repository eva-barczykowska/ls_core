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
