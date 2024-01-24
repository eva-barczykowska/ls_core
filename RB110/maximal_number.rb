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

puts

=begin
Given an integer n, find the maximal number you can obtain by deleting exactly one digit of the given number.

PEDAC
Problem:
- write a method that takes an int n as an arg
- the method returns the maximal number you can obtain by deleting 1 digit

Examples:
delete_digit(791983) == 91983
=>
-91983 -deleting at index 0
7 1983 -deleting at index 1
79 983 -deleting at index 2
791 83 -deleting at index 3
7919 3 -deleting at index 4
79198- -deleting at index 5
=> the max num is 91983

delete_digit(152) == 52
=> 52, 15, 12 => max is 52

delete_digit(1001) == 101
=> 001, 101, 101, 100

delete_digit(10) == 1
=> 0, 1

Data Structures:
input: int
output: int

Notes:

Algorithm:
- change input n to s and then to an []

- loop over the array as many times as its size
- each time looping, delete the digit at the counter
- delete_at is destructive so I'd need to make a copy first and then delete num at counter
- and append the copy (without the deleted in the previous step number)
- join array and append it to `result`
- transform `result`, which is an array of strings into an [] of integers
- find and return the max int
=end

def delete_digit(n)
  return n if n.to_s.size == 1
  arr_of_num_strings = n.to_s.chars

  result = []
  counter = 0
  loop do
    break if counter > arr_of_num_strings.size - 1
    copy = arr_of_num_strings.dup
    copy.delete_at(counter)
    result << copy.join
    counter += 1
  end

  result.map(&:to_i).max
end
p delete_digit(791983) == 91983
p delete_digit(152) == 52
p delete_digit(1001) == 101
p delete_digit(10) == 1

