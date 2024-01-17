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

puts
# solve it with loop
# -create a hash
# -as you go, create keys and values for the hash
# -while looping over the array of numbers
# -if that number is not already a key, add it as a key with value 1
# -else only increase the value by 1
# -once you have the hash with keys and values,
# -get all the values, divide each by 2 - this is how many pairs we have
# -add these pairs

def pairs(arr)
  hash = {}
  arr.each do |elem|
    if !hash.keys.include?(elem)
      hash[elem] = 1
    else
      hash[elem] += 1
    end
  end
  pairs = hash.transform_values { |v| v / 2 }
  pairs.values.sum
end


p pairs([1, 2, 5, 6, 5, 2]) == 2 # unique elements [1, 2, 5, 6],count 1s, 2s, 5s, 6s => [1, 2, 2, 1]
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4 # unique elements [1, 2, 20, 6], count 1s, 2s, 20s, 6s => [1, 4, 2, 2]
p pairs([0, 0, 0, 0, 0, 0, 0]) == 3
p pairs([1000, 1000]) == 1
p pairs([]) == 0
p pairs([54]) == 0

puts
puts "codewars"
=begin
PEDAC TEMPLATE

************** Problem **************
-write a method that takes an array of integers as an argument
-the method retuns how many pairs of those integers the array argument has
-if the array is empty of has size 1, return 0 (coz there are no pairs)
************** Examples **************
pairs([1, 2, 5, 6, 5, 2]), 2
=> 2 and 5 are present twice

pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]), 4
=> 2 is present 4 times so 2 pairs, then a pair of 20 and 6

pairs([0, 0, 0, 0, 0, 0, 0]), 3
=> 3 pairs of 0

pairs([1000, 1000]), 1
=> just 1 pair of 1000

pairs([]), 0
pairs([54]), 0

************** Data Structures **************
Input: array of integers

Output: integer
************** Algorithm **************
-initialize result

-iterate over the number and count them as you go, e.g.
-how many 1s, 2s, etc.
-store the result in the hash

-now use the values of that hash
-if the value is greater than 1,
-divide each value by 2 and add the result to the `result` variable

return the final result
=end
def pairs(arr)
  result = 0

  number_of_occurrences = arr.tally.values

  number_of_occurrences.each do |number|
    result += number / 2 if number > 1
  end

  result
  end
p pairs([1, 2, 5, 6, 5, 2]) == 2 # unique elements [1, 2, 5, 6],count 1s, 2s, 5s, 6s => [1, 2, 2, 1]
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4 # unique elements [1, 2, 20, 6], count 1s, 2s, 20s, 6s => [1, 4, 2, 2]
p pairs([0, 0, 0, 0, 0, 0, 0]) == 3
p pairs([1000, 1000]) == 1
p pairs([]) == 0
p pairs([54]) == 0

puts

# =begin
# You are given array of integers, your task will be to count all pairs in that array and return their count.

# Notes:

# Array can be empty or contain only one value; in this case return 0
# If there are more pairs of a certain number, count each pair only once. E.g.: for [0, 0, 0, 0] the return value is 2 (= 2 pairs of 0s)
# Random tests: maximum array length is 1000, range of values in array is between 0 and 1000

# [1, 2, 5, 6, 5, 2]  -->  2
# ...because there are 2 pairs: 2 and 5

# [1, 2, 2, 20, 6, 20, 2, 6, 2]  -->  4

# ...because there are 4 pairs: 2, 20, 6 and 2 (again)
# PEDAC
# P:
# - write a method that takes an array of integers as an argument
# - method counts pairs and returns the count
# - if array is empty or only 1 integers, return 0
# - each pair is counted oly once,[0, 0, 0, 0] the return value is 2 (= 2 pairs of 0s)

# E:
# pairs([1, 2, 5, 6, 5, 2]) == 2
# => 2,2,5,5
# pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
# =>2,2,2,2,20,20,6,6

# DS:
# input: array of integers
# output: integer: count of how many pairs we have

# A:
# - initialize result to 0
# - count the integers, how many of each I have, store results in a hash
# - iterate over the hash, if the value for a certain key is even/ divide it by 2 and add the result to `result`
# - return result
# =end

# def pairs(array)
#   result = 0
#   counts = array.tally
#   counts.each do |int, count|
#     if count.even?
#       result += count / 2
#     end
#   end

#   result
# end
# p pairs([1, 2, 5, 6, 5, 2]) == 2
# p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4

# puts

# def pairs(array)
#   result = 0

#   array.tally.each { |int, count| result += count / 2 if count.even? }

#   result
# end
# p pairs([1, 2, 5, 6, 5, 2]) == 2
# p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4

# # without tally
# # initializean empty hash
# # iterate over the array
# # if hash doesn't have the int at the current iteration as a key,
# #   add it as a key and assign value 1
# #   -if it has, add 1 to the value

# def get_counts(array)
#   counts = {}
#   array.each do |int|
#    if !counts.key?(int)
#      counts[int] = 1
#    else
#      counts[int] += 1
#    end
#   end
#   counts
# end

# # p get_counts([1, 2, 5, 6, 5, 2])

# def pairs(array)
#   result = 0

#   counts = get_counts(array)

#  counts.each do |int, count|
#   if count.even?
#     result += count / 2
#   end
# end

# result
# end
# p pairs([1, 2, 5, 6, 5, 2]) == 2
# p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4

puts
#with each_with_object

def pairs(array)
  counts = array.each_with_object({}) { |int, hash| hash[int] = array.count(int) }

  result = 0
  counts.each do |int, count|
    if count.even?
      result += count / 2
    end
  end

  result
end

p pairs([1, 2, 5, 6, 5, 2]) == 2
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4

#error - why does it not allow me to use this object that it returns further but I have to assign it to something?
# And what is this big number? The docs say the method returns the memo object so why can't I use it further?

# def pairs(array)
#   array.each_with_object({}) { |int, hash| hash[int] = array.count(int) }
#
#   result = 0
#   hash.each do |int, count|
#     if count.even?
#       result += count / 2
#     end
#   end
#
#   result
# end
#
# p pairs([1, 2, 5, 6, 5, 2]) == 2
# p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4


puts
#solve using method chaining?

#error - why does it not allow me to use this object that it returns further but I have to assign it to something?
# And what is this big number? The docs say the method returns the memo object so why can't I use it further?

# NO, error is undefined method `each' for 4466104106738790135:Integer

# def pairs(array)
#   result = 0
#   array.each_with_object({}) { |int, hash| hash[int] = array.count(int) }.each do |int, count|
#     result += count / 2 if count.even?
#   end
#
#   result
# end
#
# p pairs([1, 2, 5, 6, 5, 2]) == 2
# p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4

def pairs(array)
  result = 0
  hash = array.each_with_object({}) { |int, hash| hash[int] = array.count(int) }

  hash.each do |int, count|
    result += count / 2 if count.even?
  end

  result
end

p pairs([1, 2, 5, 6, 5, 2]) == 2
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4














