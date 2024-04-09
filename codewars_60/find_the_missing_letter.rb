# (https://www.codewars.com/kata/5839edaa6754d6fec10000a2)
# 6 kyu
# Find the missing letter
# Write a method that takes an array of consecutive (increasing) letters as input and that returns the missing letter
# in the array.
# You will always get a valid array. And it will be always exactly one letter missing.
# The length of the array will always be at least 2.
# The array will always contain letters in only one case.
#
# Example:
# ['a','b','c','d','f'] -> 'e' ['O','Q','R','S'] -> 'P'
# ["a","b","c","d","f"] -> "e"
# ["O","Q","R","S"] -> "P"
# (Use the English alphabet with 26 letters!)
# Have fun coding it and please don't forget to vote and rank this kata! :-)
#
# PEDAC:
# P:
# - write a method that takes an array of letters as an arg
# - those letters will always be in 1 case
# - the letters are ascending
# - the letters are missing 1 letter and the method needs to find it and return it
# - array will always have at least 2 letters
#
# E:
# ['a','b','c','d','f'] == 'e'
# => 'e' is missing
#
# ['O','Q','R','S'] -> 'P'
# => 'P' is missing
#
# DS:
# input: array of letters, lowercase or uppercase
# output: missing letter in the form of a String
#
# N:
# - range
# A:
# - initialize 2 alphabets, lowercase and uppercase
# - verify if first letter of the argument is uppercase or lowercase
#
# - cut the corresponding range of the alphabet, starting from the input first letter and ending on input last letter ('Q'..'S')
# - convert the range to array so that next step is easier because you have 2 same objects
# - find out the difference between the range you've just created and the input argument
#
# - return that difference
#
def find_missing_letter(array)
  alphabet = ('a'..'z').to_a

  downcased_input_array = array.map(&:downcase)

  start_index = alphabet.index(downcased_input_array.first)
  end_index = alphabet.index(downcased_input_array.last)

  should_have_lower = alphabet[start_index..end_index] # ['a','b','c','d','e', f']

  result = if array.first == array.first.downcase
             should_have_lower - array
           else
             should_have_lower.map(&:upcase) - array
           end

  result.join
end
p find_missing_letter(%w[a b c d f]) == 'e'
p find_missing_letter(%w[O Q R S]) == 'P'

# solutions from codewars
def find_missing_letter(arr)
  ((arr.first..arr.last).to_a - arr).first # # (arr.first..arr.last).to_a -- # whaaaaaaaaaaaaaaaaat?! # didn't think you could do this!
end

p find_missing_letter(%w[a b c d f]) #== 'e'
p find_missing_letter(%w[O Q R S]) == 'P'

range = ('A'..'f').to_a
p range

puts

#  Find the missing letter
# Write a method that takes an array of consecutive (increasing) letters as input and that returns the missing letter in the array.
#
# You will always get an valid array. And it will be always exactly one letter be missing. The length of the array will always be at least 2.
#
# The array will always contain letters in only one case.
# P:
# - method takes an array of lowercase letters, always in 1 case, upper or lower
# - characters are ascending
# - array argument will have at least 2 letters
# - find the missing letter
#
# E:
# p find_missing_letter(["a","b","c","d","f"]) == "e"
# => "e"
#
# p find_missing_letter(["O","Q","R","S"]) == "P"
# => "P" uppercase
#
# p find_missing_letter(["b","d"]) == "c"
# => "c"
#
# p find_missing_letter(["a","b","d"]) == "c"
# => "c"
#
# p find_missing_letter(["b","d","e"]) == "c"
# =>"c"
#
# N:
# find out if uppercase, lowercase
#
# DS:
# input: array
# middle: range
# output: string
#
# A:
#
# -extract a range from the alphabet reference, starting from the first elemnet of the string array argument and finishing with the last element of the array argument
#
# -change range to array
#
# -subtract the the array arguemnt that I have from the range changed into array(line before)
#
# - covert the resulting array to a string and return the string
# ["a","b","c","d","e", "f"] - ["a","b","c","d","f"]
# ["a","b","c","d","f"].first == ["a","b","c","d","f"].first.downcase
#
#
# -- discipline
def find_missing_letter(array)
  required_range = (array[0]..array[-1]).to_a

  (required_range - array).join
end

p find_missing_letter(%w[a b c d f]) == 'e'
p find_missing_letter(%w[O Q R S]) == 'P'
p find_missing_letter(%w[b d]) == 'c'
p find_missing_letter(%w[a b d]) == 'c'
p find_missing_letter(%w[b d e]) == 'c'
