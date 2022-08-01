=begin
ASCII String Value
Write a method that determines and returns the ASCII string value of a string
that is passed in as an argument. The ASCII string value is the sum of the ASCII
values of every character in the string.
(You may use String#ord to determine the ASCII value of a character.)

PEDAC
Problem
-write a method that takes a string
-the method returns the sum of ascii string value of all the characters in the string
-Str.ord to get the ascii value

Examples
ascii_value('Four score') == 984
ascii_value('Launch School') == 1251
ascii_value('a') == 97
ascii_value('') == 0
p 'F'.ord
p 'o'.ord
p 'u'.ord
p 'r'.ord
p " ".ord

Data Structures
-input: string
-output: integer

Algorithm
-divide the string into separate characters
-establish what is the value of the characters
-add those values together
-return the resulting integers

Code
=end

def ascii_value(str)
  arr = str.split("").map{ |char| char.ord }.sum
  arr
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

puts ""
#Further exploration
char = 'a'
p char.ord.chr == char
