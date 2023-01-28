=begin
Question:
Sequence Count
Create a method that takes two integers as arguments.
The first argument is a count, and the second is the first number of a sequence
that your method will create. The method should return an Array that contains
the same number of elements as the count argument,
while the values of each element will be multiples of the starting number.

You may assume that the count argument will always have a value of 0 or greater,
while the starting number can be any integer value.
If the count is 0, an empty list should be returned.

-----------------------
Questions:

Problem (Rewrite if needed else skip):
- Method takes 2 integers as arguments
  - First argument is a count
  - Second argument is the first number of a sequence the method will create
- Method should return array containing same number of elements as the Count arg
- Values of each element are multiples of the starting number
- Count of 0 returns an empty list

Input: 2 integer arguments.
  - First is the count (number of array elements)
  - Second is the first num of sequence
Output: Array containing the count of elements in the required sequence
based on the second argument

Rules:
  Explicit Requirements
  - First argument is a count (how many elements that will be in the returned array)
  - Second argument is the starting number for the sequence of numbers that will be created
  - Values for each element will be the second argument times itself (incrementally) `count` times
          sequence(5, 1) == [1, 2, 3, 4, 5]
          1 * 1 = 1
          1 * 2 = 2
          1 * 3 = 3

  Implicit Requirements

-----------------------
Examples:
sequence(5, 1) == [1, 2, 3, 4, 5]
sequence(4, -7) == [-7, -14, -21, -28]
sequence(3, 0) == [0, 0, 0]
sequence(0, 1000000) == []

-----------------------
Data Structure:
Algorithm:
- Define `sequence` with params `count` and `multiplier`
- If `count` equals 0, return an empty array
- Initialize `result` to an empty array
- Via iterating, multiply the `multiplier` by the `count` integer incrementally
  from 1 to the `count` integer
  - Each result should be added to the `result` array
- Implicitly return the `result` array

-----------------------
Code:
=end

def sequence(count, multiplier)
  return [] if count.eql?(0)
  result = []
  (1..count).each { |counter| result << multiplier * counter }
  result
end


p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []

puts

def sequence(how_many_times, value_to_multiply)
  (1..how_many_times).each_with_object([]) { |num, arr| arr << value_to_multiply * num }
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []
