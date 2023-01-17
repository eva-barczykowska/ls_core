=begin
Reverse the Digits in a Number
Write a method that takes a positive integer as an argument
and returns that number with its digits reversed.

Examples:
p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1

PEDAC
-write a method that takes a positive integer as an argument
-the method returns that number with its digits reversed
120 -> 21 no leading zeros in return value

Data structures
-input: integer
-output: reversed integer

Algorithm
-convert the integer to string
-reverse the string
-check if there are any zeros at the beginning
-remove leading zeros (if any)

Code
=end

def reversed_number(int)
  # int.to_s.reverse.to_i
  int.digits.join.to_i
end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1

