# Write a method that returns true if the string passed as an argument is a
# palindrome, false otherwise. A palindrome reads the same forward and backward.
# For this exercise, case matters as does punctuation and spaces.
#
#   Explicit requirement:
#   - a method
#   - 1 argument
#   - return true if argument is a palindrome
#   - case, punctuation and spaces matters
#
# Data structure:
# Input: string
# Output: boolean, true or false
#
# Algorithm:
# - define a method that takes a string argument
# - check if argument reads same forward and backward
# - if it does, return true, otherwise return false

  def palindrome?(str)
    str == str.reverse ? true : false
  end

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true

# Further Exploration
# Write a method that determines whether an array is palindromic; that is,
# the element values appear in the same sequence both forwards and backwards
# in the array.

#   Explicit requirement:
#   - a method
#   - 1 argument, an array
#   - return true if array is a palindromic
#
# Data structure:
# Input: array
# Output: boolean, true or false
#
# Algorithm:
# - define a method that takes an array
# - check if argument reads same forward and backward
# - if it does, return true, otherwise return false
p "Further exploration"
def palindrome?(arg)
  arg == arg.reverse
end

p palindrome?([3, 9, 0, 0, 9, 3]) == true
p palindrome?([3, 9, 0, 0, 8, 3]) == false
p palindrome?([3, 9, 0, 8, 3]) == false
p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true
# Now write a method that determines whether an array or a string
# is palindromic; that is, write a method that can take either an array or a
# string argument, and determines whether that argument is a palindrome.
# You may not use an if, unless, or case statement or modifier.

# - the same method as above will work because both strings and arrays have
# the reverse method
