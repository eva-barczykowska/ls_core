=begin
In the previous exercise, you developed a method that converts simple numeric strings to Integers.
In this exercise, you're going to extend that method to work with signed numbers.

Write a method that takes a String of digits, and returns the appropriate number as an integer.
The String may have a leading + or - sign; if the first character is a +, your method should return a positive number;
if it is a -, your method should return a negative number. If no sign is given, you should return a positive number.

You may assume the string will always contain a valid number.

You may not use any of the standard conversion methods available in Ruby, such as String#to_i, Integer(), etc.
You may, however, use the string_to_integer method from the previous lesson.
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
-in the end, if the original number had a - in front, add - to the result
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

puts

# Convert a String to a Signed Number!
# In the previous exercise, you developed a method that converts simple numeric strings to Integers. In this exercise, you're going to extend that method to work with signed numbers.

# Write a method that takes a String of digits, and returns the appropriate number as an integer. The String may have a leading + or - sign; if the first character is a +, your method should return a positive number; if it is a -, your method should return a negative number. If no sign is given, you should return a positive number.

# You may assume the string will always contain a valid number.

# You may not use any of the standard conversion methods available in Ruby, such as String#to_i, Integer(), etc. You may, however, use the string_to_integer method from the previous lesson.


DIGITS = {"0" => 0, "1" => 1, "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6"=> 6, "7" => 7, "8" => 8, "9" => 9, "10" => 10 }

def string_to_integer(str)
  integers_array = str.chars.map { |char| DIGITS[char] }

  res = 0
  multiplier = 1
  loop do
    break if integers_array.empty?
    res += integers_array.pop * multiplier
    multiplier *= 10
  end
  res
end

# p string_to_integer('4321') == 4321
# p string_to_integer('570') == 570

=begin
 PEDAC:
 -write a method that takes a string that may have - or + as the first character and convert it
 to a signed Integer
 -if the str argument has + as the first character, return just the integer
 -if the string argument has no +/- as the first character, return just the integer
 -if it has -, the method returns integer with the - sign at the beginning
- not allowed to use any of the methods like to_i, Integer().

E: analyzed

DS:
input is a string with
output is an signed integer

Algorithm
-check for the first character of the string
-if the first charater is a -, delete it, use my method
 and append it at the end when returning the number

-otherwise just use my method from the previous exercise
=end

def string_to_signed_integer(str)
  if str[0] == "-"
    str = str.delete("-")
    -string_to_integer(str)
  elsif str[0] == "+"
    str = str.delete("+")
    string_to_integer(str)
  else
    string_to_integer(str)
  end
end


p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100

def string_to_signed_integer(str)
  case str[0]
  when "-"
    str = str.delete("-")
    -string_to_integer(str)
  when "+"
    str = str.delete("+")
    string_to_integer(str)
  else
    string_to_integer(str)
  end
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100

puts
# ls solutions
def string_to_signed_integer(string)
  case string[0]
  when '-' then -string_to_integer(string[1..-1])
  when '+' then string_to_integer(string[1..-1])
  else          string_to_integer(string)
  end
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100


