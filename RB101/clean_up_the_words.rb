=begin
Clean up the words
Given a string that consists of some words (all lowercased) and an assortment
of non-alphabetic characters, write a method that returns that string with all of
the non-alphabetic characters replaced by spaces. If one or more
non-alphabetic characters occur in a row, you should only have one space in
the result (the result should never have consecutive spaces).

PEDAC
Problem
-write a method that takes a string
-the string is all lowercased letters and non-alphabetic characters
-all of the non-alphabetic characters should be replaced by spaces
-if one or more non-alphabetic characters occur in a row, you should have only one space
-(we should not have consecutive spaces)

Examples
cleanup("---what's my +*& line?") == ' what s my line '

Data Structures
-input: string
-output: string

Algorithm
-delete all non-alphabetic characters except spaces
-remove extra spaces, leaving always 1

Code
=end
def cleanup(str)
  str = str.gsub(/[^A-Za-z]/, " ")
  p str
  str.squeeze
end

p cleanup("---what's my +*& line?") == ' what s my line '

puts ""

def cleanup(str)
  str.gsub(/[^A-Za-z]/, " ").squeeze
end

p cleanup("---what's my +*& line?") == ' what s my line '
