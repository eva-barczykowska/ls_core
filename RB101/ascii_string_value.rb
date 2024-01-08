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

puts

=begin
Write a method that determines and returns the ASCII string value of a string that is passed in as an argument.
The ASCII string value is the sum of the ASCII values of every character in the string.
(You may use String#ord to determine the ASCII value of a character.)
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

