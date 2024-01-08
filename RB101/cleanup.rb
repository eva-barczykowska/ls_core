# Given a string that consists of some words (all lower cased) and an assortment of non-alphabetic characters,
# write a method that returns that string with all of the non-alphabetic characters replaced by spaces.
# If one or more non-alphabetic characters occur in a row, you should only have one space in the result (the result should never have consecutive spaces).

# cleanup("---what's my +*& line?") == ' what s my line '
# PEDAC

# Problem
# -i have a string of a few words and non-alphabetic characters
# -i have to write a method
# -the method replaces non-alphabetic chars by spaces
# -BUT if 1 or more non-alphabetic chars occur in a row, i should hve only
# 1 space in the returned result

# Examples
# cleanup("---what's my +*& line?") == ' what s my line '

# Data Structures
# input, output: String

# Algorithm

# -check for non-alphabetic characters in the string
# -define an alphabet
# loop over the str and chheck if a char is non-alphhabetic
# it is is aphabetic, add it to the result array
# -if 1 non-alpha character- replace with 1 space
# - if more -- repalace all of them with 1 space

# Code

def cleanup(str)
  res = []
  alphabet = 'abcdefghijklmnopqrstuvwxyz'.chars
  str = str.chars
  counter = 0
  while counter < str.size
    if alphabet.include?(str[counter])
    res << str[counter]
    counter += 1
    else
      res << " "
      counter += 1
    end
  end
  res.join.squeeze
end

p "E"
p cleanup("---what's my +*& line?") == ' what s my line '
p cleanup("---what's mmy +*& line?") == ' what s mmy line '
p "E"

puts
###############################
=begin
Problem
Write a method that given a string with non-alphabetic characters and some words will return the letters normally but
non-alphabetic characters as a space. consecutive non-alphabetic characters will only output one space.

Examples/Test Cases
cleanup("---what's my +*& line?") == ' what s my line '

Data Structures
Input: String with words and non-alphabetic characters
Output: String with words and spaces

Algorithm
- Initialize a variable as an array containing every letter of the alphabet
- Initialize a variable within the method to an empty string
- Transform non-alphabetic characters into spaces ignoring consecutive non-alphabetic characters and add them into
  the empty string
- Add alphabetic characters into the empty string without altering them
- Squeeze spaces so that there aren't any consecutive spaces at a time
- return the new string

Code
=end

def cleanup(string)
  letters = ('a'..'z').to_a + ('A'..'Z').to_a
  new_str = ''

  string.chars do |char|
    if letters.include?(char)
      new_str << char
    else
      new_str << ' '
    end
  end
  new_str.squeeze(' ')
end


p cleanup("---what's my +*& line?") == ' what s my line '
p cleanup("*** Hello#!%World(*&") == ' Hello World '
p cleanup("This##is!@%#$%!#an&!!!!!*^&example") == 'This is an example'
p cleanup("Consecuutiive!!letteeers@!#aree&%^okay") =="Consecuutiive letteeers aree okay"
