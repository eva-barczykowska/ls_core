=begin
In the previous exercise, you developed a method that converts simple numeric strings to Integers. In this exercise, you're going to extend that method to work with signed numbers.

Write a method that takes a String of digits, and returns the appropriate number as an integer. The String may have a leading + or - sign; if the first character is a +, your method should return a positive number; if it is a -, your method should return a negative number. If no sign is given, you should return a positive number.

You may assume the string will always contain a valid number.

You may not use any of the standard conversion methods available in Ruby, such as String#to_i, Integer(), etc. You may, however, use the string_to_integer method from the previous lesson.
=end

=begin
PEDAC
Problem
-a method that takes a string
-the method returns the appropriate nuber as an integer
-the string may have a leading + or -
-if the leadng char is a +, the method should return a positive number
-otherwise a negative
-if no leading sign is given, the number should be positive

Examples

Data Structures
-input: String
-output: Integer

Algorithm
-loop throughh this string
-initialize an result
-add digits to the result
-something about x 10, x 100 etc.
-in the end, if the original nuber had a - in front, add - to the result
how to build an integer???
Code
=end

# def string_to_signed_integer(str)
# int = []
# counter = 0
# while counter < str.size
#   int << str[counter]
#   counter += 1
# end
# int.join
# end

# p string_to_signed_integer('4321')# == 4321
# p string_to_signed_integer('-570')# == -570
# p string_to_signed_integer('+100')# == 100



################################################
=begin
Problem
Write a method that takes a string of digits and returns in as an integer.
The number will always be valid. Do not use to_i, ().

Examples/Test Cases
string_to_signed_integer('4321') == 4321
string_to_signed_integer('-570') == -570
string_to_signed_integer('+100') == 100

Data Structures
input: String of digits
Outputs: Integer

Algorithm
-Initialize a hash constant with keys being the string value of
 every number and the values being the numbers themselves, turn both signs into '0's
- Initialize a variable `value` to 0
- turn the input number into an array of digits
- if the array had a sign before it it index 0 will have a '0'
- remove the 0 at the start of the array
- if the original string started with '-' make the value negative
- else if it started with a '+' just ignore the sign
- return the value


=end

# NUMBERS = {
#   '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
#   '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
#   '+' => 0, '-' => 0
# }

# def string_to_signed_integer(string)
# value = 0

# numbers = string.chars.map {|char|  NUMBERS[char]}

# if numbers[0] == 0
#   numbers.shift
# end

# numbers.each do |number|
#   if string.start_with?('-')
#     value = 10 * value + -number
#   else
#     value = 10 * value + number
#   end
# end

# value
# end



# p string_to_signed_integer('4321') == 4321
# p string_to_signed_integer('-570') == -570
# p string_to_signed_integer('+100') == 100


# Given a string that consists of some words (all lowercased) and an assortment of non-alphabetic characters, write a method that returns that string with all of the non-alphabetic characters replaced by spaces. If one or more non-alphabetic characters occur in a row, you should only have one space in the result (the result should never have consecutive spaces).

# cleanup("---what's my +*& line?") == ' what s my line '
# PEDAC

# Problem
# -i have a string of a few words and non-alphabetic characters
# -i have to write a method
# -the mmethod replaces non-alphabetic chars by spaces
# -BUT if 1 or more non-alphabetic chars occur in a row, i shoudl hve only
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

# def cleanup(str)
#   res = []
#   alphabet = 'abcdefghijklmnopqrstuvwxyz'.chars
#   str = str.chars
#   counter = 0
#   while counter < str.size
#     if alphabet.include?(str[counter])
#     res << str[counter]
#     counter += 1
#     else
#       res << " "
#       counter += 1
#     end
#   end
#   res.join.squeeze
# end

# p "E"
# p cleanup("---what's my +*& line?") == ' what s my line '
# p cleanup("---what's mmy +*& line?") == ' what s mmy line '
# p "E"


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
- Transform non-alphabetic characters into spaces ignoring consecutive non-alphabetic characters and add them into the empty string
- Add alphabetic characters into the empty string without altering them
- Squeeze spaces so that there aren't any consecutive spaces at a time
- return the new string

Code
=end

# def cleanup(string)
#   letters = ('a'..'z').to_a + ('A'..'Z').to_a
#   new_str = ''

#   string.chars do |char|
#     if letters.include?(char)
#       new_str << char
#     else
#       new_str << ' '
#     end
#   end
#   new_str.squeeze(' ')
# end


# p cleanup("---what's my +*& line?") == ' what s my line '
# p cleanup("*** Hello#!%World(*&") == ' Hello World '
# p cleanup("This##is!@%#$%!#an&!!!!!*^&example") == 'This is an example'
# p cleanup("Consecuutiive!!letteeers@!#aree&%^okay") =="Consecuutiive letteeers aree okay"

=begin
Write a method that determines and returns the ASCII string value of a string that is passed in as an argument. The ASCII string value is the sum of the ASCII values of every character in the string. (You may use String#ord to determine the ASCII value of a character.)
=end
# PEDAC

# Problem
# -write a method that determines and returns ASCII string value
# of a string that is passed as an argument
# -ASCI string vallue is the sum of all ACII values of every character in the string
# -we can use String#ord method to determine the ASCI value of a character

# Examples
# ascii_value('Four score') == 984
# ascii_value('Launch School') == 1251
# ascii_value('a') == 97
# ascii_value('') == 0

# Data Structures
# input: String
# output: Integer

# Algorithm
# - iterate over the string
# - add the ASCII vallue of each character to the resultl array
# -sum all  elemments (integers/ ASCII values) in the array
# -return the sum
#-- account for the empty string

# Code

def ascii_value(str)
  if str == ""
    return 0
  else
    res = []
    str = str.chars
    str.each do |char|
      res << char.ord
    end
  end
  res.inject(:+)
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0


###################################
=begin
Problem
Write a method that returns the ASCII string value of the input string. ASCII string values is the
value of every character in the string. Use String#ord to determine the value of a character.

Examples/Test Cases
ascii_value('Four score') == 984
ascii_value('Launch School') == 1251
ascii_value('a') == 97
ascii_value('') == 0

Data Structures
Input: String
Output: Integer (ASCII string value)

Algorithm
- Inside the method initialize a variable to an array containing the characters in the string.
- initialize a `string_value` variable to `0`
- Iterate over each element within str_arr adding its ASCII value to `string_value`
- Return `string_value`

Code
=end

def ascii_value(string)
  str_arr = string.chars
  string_value = 0

  str_arr.each { |char| string_value += char.ord }
  string_value
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

# ls solutionsdef string_to_signed_integer(string)

def string_to_signed_integer(string)
  case string[0]
  when '-' then -string_to_integer(string[1..-1])
  when '+' then string_to_integer(string[1..-1])
  else          string_to_integer(string)
  end
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0
