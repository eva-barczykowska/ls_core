=begin
Question:
Double Doubles
A double number is a number with an even number of digits whose
left-side digits are exactly the same as its right-side digits.
For example, 44, 3333, 103103, 7676 are all double numbers. 444, 334433, and 107 are not.

Write a method that returns 2 times the number provided as an argument,
unless the argument is a double number; double numbers should be returned as-is.

-----------------------
Questions:

Problem (Rewrite if needed else skip):

Input: Integer
Output: Either double the integer (if the number is not a 'double number') or returning the same integer value if it is a double number
Rules:
  Explicit Requirements
  - Method returns 2 times number input
    - UNLESS the number is a double number. Return the number if it is a double number

  Implicit Requirements

-----------------------
Examples:
twice(37) == 74
twice(44) == 44
twice(334433) == 668866
twice(444) == 888
twice(107) == 214
twice(103103) == 103103
twice(3333) == 3333
twice(7676) == 7676
twice(123_456_789_123_456_789) == 123_456_789_123_456_789
twice(5) == 10

-----------------------
Data Structure:
Algorithm:
- Define the method `twice` with param of `int`
- Initialize `str` to `int` converted to a string
- If the string has an odd number of characters, return the original integer * 2
- IF not continue
- Find the mid-point of the string to split it into two strings
  - Get the length/size of the string and divide it by two
  - Initialize `split_length` - 1 to the result of the above
  - Initialize `str1` to a range from the beginning of the string up to `split_length`
  - Initialize `str2` to a range from `split_length` to `split_length` + 1
- Compare strings, if they are equal, return the original `int` as is
  - If not, return `int` * 2

-----------------------
Code:
=end

def twice(int)
  str = int.to_s
  split_length = str.size / 2 # 1
  str1 = str[0, split_length] # str[0, 1] = "3"
  str2 = str[split_length, split_length] # str[1, 1] = "7"

  return int * 2 if str.size.odd?
  str1.eql?(str2) ? int : int * 2 # "3" == "7"? if yes, return int, if not, return int * 2, in this case not so 37 * 2
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10