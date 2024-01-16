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
-write a method that takes an integer n
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
-iterate over the digits of the number and remove each consecutive digit
-store resulting number in a `numbers` array

- initialize `counter`
- iterate over the `copy_of_numbers` array and delete the number at the current `counter`
- after deletion, join, convert to integer and store the resulting number to the `possible_numbers` arrays
- increase the counter
- REASSIGN `copy_of_numbers` to numbers, to have the intact `numbers` array back to work with

- retrieve the maximal number from the results array
152 = > 52 12, 15
=end

def maximal_number(number)
  possible_numbers = []
  numbers = number.digits.reverse

  copy_of_numbers = numbers.dup

  counter = 0
  while counter < numbers.size
    copy_of_numbers.delete_at(counter)
    possible_numbers << copy_of_numbers.join.to_i
    counter += 1

    copy_of_numbers = numbers
  end

  possible_numbers.max
end
p maximal_number(152) == 52
p maximal_number(1001) == 101