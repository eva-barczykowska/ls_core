# Reverse It (Part 1)
# Write a method that takes one argument, a string,
# and returns a new string with the words in reverse order.

# PEDAC
# Problem
# -write a method that takes a str an an argument
# -the method returns a NEW string
# -the words in the new string are in reverse order

# Examples
# puts reverse_sentence('Hello World') == 'World Hello'
# puts reverse_sentence('Reverse these words') == 'words these Reverse'
# puts reverse_sentence('') == ''
# puts reverse_sentence('    ') == '' # Any number of spaces results in ''

# Data structures
# input: string
# middle: array
# output: string

# Algorithm
# -initialize `new_str`
# -if a string is empty or has just spaces, return an empty string
# -split str into separate words
# -access the index of each word
# -iterate over the array of words
# -start from the end and append words into the new string until there are
# no more words left in the array

# Code

def reverse_sentence(str)
  return '' if str.empty?
  return '' if str.chars.all? { |char| char == ' ' }

  str.split.reverse.join(" ")
end
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''

puts

def reverse_sentence(str)
  str.split.reverse.join(" ")
end
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''