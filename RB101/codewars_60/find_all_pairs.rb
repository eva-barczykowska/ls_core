=begin

2.Find all pairs
(https://www.codewars.com/kata/5c55ad8c9d76d41a62b4ede3/train/ruby)
7 kyu

Find all pairs
You are given array of integers, your task will be to count all pairs in that array and return their count.
Notes:
Array can be empty or contain only one value; in this case return 0
If there are more pairs of a certain number, count each pair only once.
E.g.: for [0, 0, 0, 0] the return value is 2 (= 2 pairs of 0s)

Random tests: maximum array length is 1000, range of values in array is between 0 and 1000

Examples
[1, 2, 5, 6, 5, 2] --> 2
...because there are 2 pairs: 2 and 5
[1, 2, 2, 20, 6, 20, 2, 6, 2] --> 4
...because there are 4 pairs: 2, 20, 6 and 2 (again)


PEDAC TEMPLATE

************** Problem **************
-write a method that takes an array of integers as an argument
-the array will have some pairs of numbers
-count how many pairs (consider all numbers):
2 pairs of int 2 + 3 pairs of integer 5 == 5 paris in total
-if the array contains more pairs of the same number, count each pair only once
-if the argument array is empty or contains only 1 value, then return 0

Questions:

************** Examples **************
p pairs([1, 2, 5, 6, 5, 2]) == 2
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
p pairs([0, 0, 0, 0, 0, 0, 0]) == 3
p pairs([1000, 1000]) == 1
p pairs([]) == 0
p pairs([54]) == 0

************** Data Structures **************
input: an array
output: an integer

************** Algorithm **************
-initialize `result` variable
-iterate through the array and tally elements
-this will give me a hash
-the key is the number, the value is how many times it will occur
-next if I divide the value by 2, I will get the pair of each number
-count first the pairs of each number
-return the result

************** Code **************
=end
def pairs(arr)
  h = arr.tally.transform_values { |v| v/2 }
  h.values.sum
end

p pairs([1, 2, 5, 6, 5, 2]) == 2
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
p pairs([0, 0, 0, 0, 0, 0, 0]) == 3
p pairs([1000, 1000]) == 1
p pairs([]) == 0
p pairs([54]) == 0

#solve it with loop
# -define result
# -loop over the array
# -if
# p pairs([1, 2, 5, 6, 5, 2]) == 2
# p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
# p pairs([0, 0, 0, 0, 0, 0, 0]) == 3
# p pairs([1000, 1000]) == 1
# p pairs([]) == 0
# p pairs([54]) == 0
