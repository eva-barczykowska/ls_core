=begin
Convert a String to a Signed Number!

In the previous exercise, you developed a method that converts
simple numeric strings to Integers.
In this exercise, you're going to extend that method to work with
signed numbers.

Write a method that takes a String of digits,
and returns the appropriate number as an integer.
The String may have a leading + or - sign;
if the first character is a +, your method should return a positive number;
if it is a -, your method should return a negative number.
If no sign is given, you should return a positive number.

You may assume the string will always contain a valid number.

You may not use any of the standard conversion methods available in Ruby,
such as String#to_i, Integer(), etc.
You may, however, use the string_to_integer method from the previous lesson.

Goal: intake a positive or negative signed string and
return its integer representation with the correct sign.
input: String
output: integer

Rules:
- if '+' in the intake number it outputs a positive number with no Signal
- if '-' in the intake it outputs a neg. number with the '-' Signal
- can't use to_i

E:
# string_to_signed_integer('-570') == -570
' -570'>>  -570
# string_to_signed_integer('+100') == 100
'+100' >> 100

could be one of three ways, where string[0] is '+', '-' or an Integer

D:
input: String
intermediate: saving the string as an integer and then applying the correct symbol as a prefix
output: integer with the correct sign

A:
- use our string_to_integer method to convert the string to an Integer
- based on the str[0]
  - if '-' then return -integer
  - if '+' then return integer as is
  - otherwise just return the integer as well
=end

DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_integer(string)
  digits = string.chars.map { |char| DIGITS[char] }

  value = 0
  digits.each { |digit| value = 10 * value + digit }
  value
end

# ls solution
def string_to_signed_integer(str)
  case str[0]
  when '-' then -(string_to_integer(str[1..-1])) # using previously defined method
  when '+' then string_to_integer(str[1..-1])
  else          string_to_integer(str)
  end
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100

puts
# other solutions
def string_to_signed_integer(str)
  num = string_to_integer(str.delete('^0-9'))
  str[0] == '-' ? -num : num
end
p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100
