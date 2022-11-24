=begin
In the previous exercise, you developed a method that converts non-negative
numbers to strings. In this exercise, you're going to extend that method
by adding the ability to represent negative numbers as well.

Write a method that takes an integer,
and converts it to a string representation.

You may not use any of the standard conversion methods available in Ruby,
such as Integer#to_s, String(), Kernel#format, etc. You may, however,
use integer_to_string from the previous exercise.
signed_integer_to_string(4321) == '+4321'
signed_integer_to_string(-123) == '-123'
signed_integer_to_string(0) == '0'
=end

=begin

pedac

*************Problem***************************
Overall goal: take a signed integer and convert to a string
initial input: integer which may have a + or - sign
overall output: string, include + or - sign if present

explicit requirements:
write a method called signed_integer_to_string that takes one
  parameter-integer
cannot use `Integer#to_s`
can use the method created on prev exercise
if a postive number, include the + sign
if `-` sign is included at the beg of the integer, include tht in String
the only integer that doesnt have a sign is `0`

implicit requirements:

questions:

*************Examples and Test cases************
++restate all test cases given
++add edge cases, 0 and empty:
signed_integer_to_string(4321) == '+4321'
  the positive integer `4321` => +4321
signed_integer_to_string(-123) == '-123'
  the negative integer `-123` => -123
signed_integer_to_string(0) == '0'
  0 is neither postive or negative so returns `0`

*************Data Structure********************
integer > string

************Algorithm*************************
A. High Level Algorithm
  1. given a integer
  2. intialize 2 arrays one with pos integers as strings,
  one with negative integers as strings
  3. take string value and add to return_string
  4. return return_string
B Detailed Algorithm
  1.given integer
  2.init one array of digits containing integers as strings
  3. initialize return_string
  4.  if positive number, loop from yesterday's assignment then prepend a + sign
  5. if negative number, get absolute value of number then loop from yesterdays
     assignment then add `-` sign
=end

DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def signed_integer_to_string(number)
  return_string = ''
  if number > 0
    loop do
      number, remainder = number.divmod(10) # 4321
      return_string.prepend(DIGITS[remainder])
      break if number == 0
    end
    return_string.prepend('+')
  elsif number < 0
    loop do
      number, remainder = number.abs.divmod(10) # 4321
      return_string.prepend(DIGITS[remainder])
      break if number == 0
    end
    return_string.prepend('-')
  else
    number = '0'
  end
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p  signed_integer_to_string(0) == '0'

puts

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

p signed_integer_to_string(4321)# == '+4321'
p signed_integer_to_string(-123) #== '-123'
p  signed_integer_to_string(0)# == #'0'
