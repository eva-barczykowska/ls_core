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
# Now write a method that determines whether an array or a string
# is palindromic; that is, write a method that can take either an array or a
# string argument, and determines whether that argument is a palindrome.
# You may not use an if, unless, or case statement or modifier.

  def palindrome?(arr)
  end
