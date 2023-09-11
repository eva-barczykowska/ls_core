=begin
Create a function that takes an array of numbers or strings and returns an array with the items from the original array stored into subarrays. Items of the same value should be in the same subarray.

Problem:
input: an array of integers or strings
return: an array of subarrays - subarrays contain equal items
- subarrays should be in the order of each elements appearance in the input array

Examples:
advanced_sort([2, 1, 2, 1]) ➞ [[2, 2], [1, 1]]

advanced_sort([5, 4, 5, 5, 4, 3]) ➞ [[5, 5, 5], [4, 4], [3]]

advanced_sort(["b", "a", "b", "a", "c"]) ➞ [["b", "b"], ["a", "a"], ["c"]]

Notes:
The subarrays should be returned in the order of each element's first appearance in the given array.

DS:
- subarrays...
- an output array with a subarray

Questions:
- how to create subarrays based on equality and not knowing how many subarrays I'd need
-
Algo:
- initialize a hash
- tally up the count of different elements in the hash
- initialize an output array
- iterate through the hash
  - add this to the output array: [key] * value
- return the output array
=end

def advanced_sort(input)
  hash = input.tally
  output = []

  hash.each do |key, value|
    output << [key] * value
  end
  output
end

p advanced_sort([2, 1, 2, 1]) == [[2, 2], [1, 1]]

p advanced_sort([5, 4, 5, 5, 4, 3]) == [[5, 5, 5], [4, 4], [3]]

p advanced_sort(["b", "a", "b", "a", "c"]) == [["b", "b"], ["a", "a"], ["c"]]




