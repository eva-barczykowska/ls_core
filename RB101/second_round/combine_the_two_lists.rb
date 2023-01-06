=begin
Question:
Combine Two Lists
Write a method that combines two Arrays passed in as arguments,
and returns a new Array that contains all elements from both Array arguments,
with the elements taken in alternation.

You may assume that both input Arrays are non-empty,
and that they have the same number of elements.

-----------------------
Questions:

Problem (Rewrite if needed else skip):
- Create an method that takes in two arrays as arguments
- Return value should be one single array with elements interweaved together
- Assume arrays will not be empty and will same number of elements

Input: Two arrays
Output: Single NEW array
Rules:
  Explicit Requirements
  - Method returns a new Array
  - Arrays passed in will be combined (alternating arr1[0], arr2[0], arr1[1], arr2[1], etc)
  - Input arrays will not be empty, and will always be the same size

  Implicit Requirements

-----------------------
Examples:
interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

-----------------------
Data Structure: Array
Algorithm:
- Create method `interleave` with two parameters `arr1` `arr2`
- Create a counter for index positions during iteration
- Initialize `combined_arr` to empty array
- Iterate through both arrays via a loop to push each index into a new array
  - Create break condition based off of either array size

-----------------------
Code:
=end


def interleave(arr1, arr2)
  idx_counter = 0
  combined_arr = []
  loop do
    break if arr1.size.eql?(idx_counter)

    combined_arr << arr1[idx_counter]
    combined_arr << arr2[idx_counter]
    idx_counter += 1
  end
  combined_arr
end

p interleave([1, 2, 3], ['a','b','c']) == [1, 'a', 2, 'b', 3, 'c']

puts

# my algorithm
# -initialize the result array
# -take element at index 0 from first array and put it in the result array
# -then do the same with the element at index 0 from the second array
# -finally return the result array


def interleave(arr1, arr2)
  res = []
  res << arr1.shift << arr2.shift until arr2.empty?
  res
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

puts

# LS solution
def interleave(array1, array2)
  result = []
  array1.each_with_index do |element, index|
    result << element << array2[index]
  end
  result
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']


