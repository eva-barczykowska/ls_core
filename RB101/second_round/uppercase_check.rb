# Uppercase Check
# Write a method that takes a string argument, and returns true if
# all of the alphabetic characters inside the string are uppercase,
# false otherwise. Characters that are not alphabetic should be ignored.

# uppercase?('t') == false
# uppercase?('T') == true
# uppercase?('Four Score') == false
# uppercase?('FOUR SCORE') == true
# uppercase?('4SCORE!') == true
# uppercase?('') == true
#
# PEDAC
#
# Problem
# -write a method that takes a string argument
# -the method returns true if all alphabetic characters in the string
# are uppercase, false otherwise
#
# Data Structures
# input: string
# output: string
#
# Algorithm
# return true if str is empty
# -define uppercase alphabet, lowercase alphabet and alphabet constants
# -split the string argument into single characters
# -remove the non-alphabetic characters from the alphabet
# -check if the remaining characters are all uppercase
#
# Code

UPPERCASE = ('A'..'Z').to_a
LOWERCASE = ('a'..'z').to_a
ALPHABET = UPPERCASE + LOWERCASE

def uppercase?(str)
  # return true if str.empty?
  array = str.split("")
  array.reject! { |char| !ALPHABET.include?(char) }
  array.all? { |letter| UPPERCASE.include?(letter) }
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true # all? returns true if none of the elements from the block returned false

puts
# LS solution
def uppercase?(string)
  string == string.upcase
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true

# Further Exploration
# Food for thought: in our examples, we show that uppercase? should
# return true if the argument is an empty string.
# Would it make sense to return false instead? Why or why not?

puts

def uppercase?(string)
  string.chars.all? { |char| char =~ /[^a-z]/ }
end
# =~ is checking for each char separately, one by one to establish
# that all of them are uppercase (so not lowercase)
#
# The =~ operator matches the regular expression against a string,
# (in this case just a single character),
# and it returns either the index of the match from the string
# or nil, depending if the match is found or not

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true
