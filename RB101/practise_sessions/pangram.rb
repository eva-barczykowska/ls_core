# A pangram is a sentence that contains every single letter of the alphabet at
# least once. For example, the sentence "The quick brown fox jumps over the
# lazy dog" is a pangram, because it uses the letters A-Z at least once
# (case is irrelevant).
#
# # Given a string, detect whether or not it is a pangram.
# Return True if it is, False if not. Ignore numbers and punctuation.
# #
#
# p panagram?("The quick brown fox jumps over the lazy dog.") == true
# p panagram?("This is not a pangram.") == false
#
# FOLLOW PEDAC STRUCTURE
#
# Problem
# -We get a string. We need to establish if it is a pangram or not.
# -What is a pangram?
# -A pangram is a sentence/string that contains every letter of the alphabet at least
# once
#
# Examples
# p panagram?("The quick brown fox jumps over the lazy dog.") == true
# p panagram?("This is not a pangram.") == false
#
# Data Structures
# -input: String
# -output: true or false (a boolean)
#
# Algorithm
# -define the alphabet
# -write a method that takes 1 argument - the string
# -downcase the string
# -split the string into an array
# -iterate over the array and ask if it contains every letter of the alphabet
# -so basically for every letter in the alpabet ask - is it in the array?
# -if you encounter a letter that is not in the target string passed as an
# argument, you can return false from the method
# -if all letters are there, return true

# Code


# def panagram?(str)
#   alphabet = 'abcdefghijklmnopqrstuvwxyz'
#   alphabet = alphabet.chars
#   str = str.downcase.chars
#   res = alphabet.each do |letter|
#     str.include?(letter)
#   end
#   res
# end
#
# p panagram?("The quick brown fox jumps over the lazy dog.") == true
# p panagram?("This is not a pangram.") == false

#################################################################
# Modify the kebabize function so that it converts a camel case string into a kebab case.

# kebabize('camelsHaveThreeHumps') // camels-have-three-humps
# kebabize('camelsHave3Humps')    // camels-have-humps
# Notes:

# the returned string should only contain lowercase letters
#
# PEDAC
#
# Problem
# -modify the given method
# -the method is supposed to convert camel case into kebab case
# -what is kebab case?
# -kebab case is when the words have to be separated with dashes
# -all characters are lowercase
# Examples
# # kebabize('camelsHaveThreeHumps') // camels-have-three-humps
# # kebabize('camelsHave3Humps')    // camels-have-humps
# Data Structures
# -input: string
# -output: string (Is this a string?)
# Algorithm
# -define a method that takes 1 parameter - the string to check
# -check where are capital letters
# -prepend those capital letters with a dash
# -downcase the string
# -return the string
# Code

def kebabize(str)
  result = []
  str = str.chars
  p str
  str.each do |char|
    if char == char.upcase
      result << "-"
      result << char.downcase
    else
      result << char
    end
  end
    p result.join
end
p kebabize('myCamelCasedString') == 'my-camel-cased-string'
p kebabize('myCamelHas3Humps') == 'my-camel-has-humps'
