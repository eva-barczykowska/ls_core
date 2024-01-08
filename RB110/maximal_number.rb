=begin
Given an integer n, find the maximal number you can obtain by deleting exactly one digit of the given number.
Example
For n = 152, the output should be 52;
For n = 1001, the output should be 101.
Input/Output

    [input] integer n

    Constraints: 10 ≤ n ≤ 1000000.

    [output] an integer

PEDAC:
P:
- write a method that takes an integer n
- if we remove any of the digits from this integer, what is the maximal_number that we can get?

-return that number

E:
maximal_number(152) == 52
52, 15, 12 => 52
maximal_number(1001) == 101
001, 101, 101, 100 => 101

DS:
input: int
medium: array
output:integer

Notes:
-digit

A:
-initialize `possible_numbers` array where I will store target numbers to choose from

- Convert input integer into an array of separate integers

- initialize a while loop and iterate while counter < array.size
- inside the loop create a duplicate of the `numbers_array`, this will be always a starting point

- iterate over the digits of the number and remove each consecutive digit:

- take copy array - remove digit at index 0, -> store copy without the num at index in `possible_numbers` array
- take copy array - remove digit at index 1, -> store copy without the num at index in `possible_numbers` array
- take copy array - remove digit at index 2, -> store copy without the num at index in `possible_numbers` array
etc.

- iterate over `possible_numbers` and select this array, whose sum is the biggest
- return that number
152 = > 52 12, 15
=end

def maximal_number(number)
  possible_numbers = []

  numbers_array = number.digits.reverse
  copy = numbers_array.dup # making a copy of the object

  counter = 0

  while counter < numbers_array.size
    copy = numbers_array.dup
    copy.delete_at(counter)  #working on the copy object, not on the elements that the copy contains
    possible_numbers << copy
    counter += 1
  end

  possible_numbers.map { |array| array.join.to_i }.max
end
p maximal_number(152) == 52
p maximal_number(1001) == 101

