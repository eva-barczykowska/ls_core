=begin
Convert a Signed Number to a String!
In the previous exercise, you developed a method that converts non-negative numbers to strings.
In this exercise, you're going to extend that method by adding the ability to represent negative numbers as well.

Write a method that takes an integer, and converts it to a string representation.

You may not use any of the standard conversion methods available in Ruby,
such as Integer#to_s, String(), Kernel#format, etc. You may, however, use integer_to_string from the previous exercise.


signed_integer_to_string(4321) == '+4321'
signed_integer_to_string(-123) == '-123'
signed_integer_to_string(0) == '0'

Pedac
PROBLEM
-convert a signed number to string, signed means it has a plus, minus at the beginning
-but it could be zero as well

Examples
signed_integer_to_string(4321) == '+4321'
signed_integer_to_string(-123) == '-123'
signed_integer_to_string(0) == '0'

Data Structures
input: integer, negative, positive or zero
output: string representing the given integer

Algorithm
-if it is zero, return zero

Code
=end

DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(number)
  result = ''
  loop do
    number, remainder = number.divmod(10)
    result.prepend(DIGITS[remainder])
    break if number == 0
  end
  result
end

def signed_integer_to_string(number)
  case number <=> 0
  when -1 then "-#{integer_to_string(-number)}"
  when +1 then "+#{integer_to_string(number)}"
  else         integer_to_string(number)
  end
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'

puts ""

# Further Exploration
# Refactor our solution to reduce the 3 integer_to_string calls to just one.

def signed_integer_to_string(number)
  return '0' if number == 0
  output = integer_to_string(number.abs)
  number < 0 ? output.prepend('-') : output.prepend('+')
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'

puts ""
# another solution

INTEGER_STRINGS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(int)
  str_int = ''
  loop do
    int, remainder = int.divmod(10)
    str_int.insert(0, INTEGER_STRINGS[remainder])
    break if int == 0
  end
  str_int
end

def signed_integer_to_string(int)
  return '0' if int == 0
  int < 0 ? sign = '-' : sign = '+'
  unsigned = int.abs
  sign + integer_to_string(unsigned)
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'
