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
p delete_digit(199) == 99
p delete_digit(9) == 9

puts

def delete_digit(number)
  # Return number if number is 1 digit
  return number if number.to_s.size == 1

  # Convert number to string then to an array of characters

  numbers = number.to_s.chars

  # Iterate through the index of numbers
  # Create new string from
  # index 0 -> index before current index + index after current index -> last index
  # Join each characters
  # Convert to integer
  # Push each sub-number to the temp Array
  # Return max integer from temp Array
  # --------6  times.with_object([]) never used it like this!-----------------------------------------
  numbers.size.times.with_object([]) do |index, temp|
    temp << (numbers[0...index] + numbers[index + 1..-1]).join.to_i
    p temp
  end.max
end
=begin
 .with_object - is useful when you want to accumulate values into a specific object during iteration,
 and you want to return that object at the end of the iteration.

numbers.size.times: This iterates numbers.size times, where numbers is assumed to be an array.
It iterates over the indices of the array, from 0 to numbers.size - 1.

.with_object([]): This method is used to create an object to be passed as an argument to the block,
which in this case is an empty array []. This array is referred to as temp within the block.

do |index, temp|: The block takes two parameters - index and temp. index represents the current iteration index,
and temp is the array being constructed.

temp << (numbers[0...index] + numbers[index + 1..-1]).join.to_i: In each iteration, it constructs a new array by
excluding the element at the current index (numbers[0...index] + numbers[index + 1..-1]), then joins the array elements
into a string (join) and converts that string to an integer (to_i). This integer is then appended to the temp array.

p temp: This prints the current state of the temp array.

.max: Finally, after the loop, it returns the maximum value from the temp array.
This is essentially finding the maximum integer obtained by excluding one element at a time from the original
array numbers.

In summary, the code is generating an array (temp) of integers, where each integer is obtained by removing one element
at a time from the original array numbers. The result is the maximum integer from this set.
=end
def delete_digit(number)
  return number if number.to_s.size == 1
  numbers = number.to_s.chars # ["7", "9", "1", "9", "8", "3"] in case of the fist test case

  numbers.size.times.with_object([]) do |index, temp| # creating access to index and to temp array that we will use later
    temp << (numbers[0...index] + numbers[index + 1..-1]).join.to_i
    # .with_object - is useful when you want to accumulate values into a specific object during iteration,
    # and you want to return that object at the end of the iteration.
    # WE ARE RETURNING AS MANY VALUES AS THE ARRAY MINUS THE INDEX WE SKIP - PERFECT!
  end.max

end
# .with_object - is useful when you want to accumulate values into a specific object during iteration,
# and you want to return that object at the end of the iteration.
p delete_digit(791983) == 91983
p delete_digit(152) == 52
p delete_digit(1001) == 101
p delete_digit(10) == 1
p delete_digit(2) == 2

puts
# another solution from Nina
=begin
Given an integer n, find the maximal number you can obtain by deleting
exactly one digit of the given number.

delete_digit(791983) == 91983
delete_digit(152) == 52
delete_digit(1001) == 101
delete_digit(10) == 1

P:
Input: integer n
output: integer
given an integer you need to delete one num character. delete the num that would leave you
with the largest number possible with one only one character deleted.
- the numbers have to be in same order as original integer with the missing character

E:
delete_digit(791983) == 91983
91983
71983
79983
79183
79193
79198
delete_digit(152) == 52
52
12
15
delete_digit(1001) == 101
101
01
11
10
delete_digit(10) == 1
1
0

D: Array with indices to compare
Notes:
- could also start at the largest number in the array
- create sub-arrays from there

A:
- Return the original_int if the length in characters is equal to 1
- Convert original_int to an array with each number split up into characters
  - Make sure original_int order is maintained
- Find all possible subarray combinations with a length 1 less than original_int
  - should then have an array of sub_array combos
- Transform subarrays of characters back to whole numbers
  - should then have an array of integers
- sort the array from largest to smallest
- return first integer from sorted array

=end

# def delete_digit(original_num)
#   return original_num if original_num.to_s.length == 1
#
#   original_num
#     .digits
#     .reverse
#     .combination(original_num.to_s.length - 1)
#     .map { |num_arr| num_arr.join.to_i }
#     .sort { |a, b| b <=> a }
#     .first
# end
#
# p delete_digit(791983) == 91983
# p delete_digit(152) == 52
# p delete_digit(1001) == 101
# p delete_digit(10) == 1
# p delete_digit(2) == 2