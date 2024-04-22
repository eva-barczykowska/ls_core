# You are given array of integers, your task will be to count all pairs in that
# array and return their count.
#
# Array can be empty or contain only one value; in this case return 0
# If there are more pairs of a certain number, count each pair only once. E.g.: for [0, 0, 0, 0] the return value is 2 (= 2 pairs of 0s)
# Random tests: maximum array length is 1000, range of values in array is between 0 and 1000
#
# P:
# -method returns count of all pairs
# -if arr empty or contains 1 value, return 0
# - if there are more pairs of each number, count each pair only once: [0, 0, 0, 0] returns 2
#
# E:
# p pairs([1, 2, 5, 6, 5, 2]) == 2
# => 2 and 5
#
# p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
# 2 pairs of 2, 20, 6 => 4
#
# p pairs([0, 0, 0, 0, 0, 0, 0]) == 3
#
# p pairs([1000, 1000]) == 1
#
# p pairs([1, 1, 1, 1, 1]) == 2
#
# p pairs([]) == 0
#
# A:
# -GET uniq numbers as keys for my hash
#
# -INIT a hash where the keys are uniq values from the array
#
# -ITERATE over the array and count the keys, divide count by 2 and store as a value for the corresponding key
#
# -SUM the values from the hash and RETURN the sum
def pairs(arr)
  unique_numbers = arr.uniq

  hash = arr.each_with_object({}) { |num, hash| hash[num] = 0 }

  arr.each do |num|
    hash[num] = arr.count(num) / 2
  end

  hash.values.sum
end

p pairs([1, 2, 5, 6, 5, 2]) == 2
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
p pairs([0, 0, 0, 0, 0, 0, 0]) == 3
p pairs([1000, 1000]) == 1
p pairs([1, 1, 1, 1, 1]) == 2

p pairs([]) == 0

puts

def pairs(arr)
  hash = arr.uniq.each_with_object({}) { |num, hash| hash[num] = 0 }

  arr.each do |num|
    hash[num] = arr.count(num) / 2
  end

  hash.values.sum
end

p pairs([1, 2, 5, 6, 5, 2]) == 2
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
p pairs([0, 0, 0, 0, 0, 0, 0]) == 3
p pairs([1000, 1000]) == 1
p pairs([1, 1, 1, 1, 1]) == 2

p pairs([]) == 0

puts
def pairs(arr)
  hash = arr.uniq.each_with_object({}) { |num, hash| hash[num] = arr.count(num) / 2 }

  hash.values.sum
end

p pairs([1, 2, 5, 6, 5, 2]) == 2
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
p pairs([0, 0, 0, 0, 0, 0, 0]) == 3
p pairs([1000, 1000]) == 1
p pairs([1, 1, 1, 1, 1]) == 2

p pairs([]) == 0

puts

def pairs(arr)
  hash = arr.uniq.each_with_object({}) { |num, hash| hash[num] = arr.count(num) / 2 }.values.sum
end

p pairs([1, 2, 5, 6, 5, 2]) == 2
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
p pairs([0, 0, 0, 0, 0, 0, 0]) == 3
p pairs([1000, 1000]) == 1
p pairs([1, 1, 1, 1, 1]) == 2

p pairs([]) == 0

puts

# You are given array of integers, your task will be to count all pairs in that
# array and return their count.
# Notes:
#
# Array can be empty or contain only one value; in this case return 0
# If there are more pairs of a certain number, count each pair only once. E.g.: for [0, 0, 0, 0] the return value is 2 (= 2 pairs of 0s)
# Random tests: maximum array length is 1000, range of values in array is between 0 and 1000
# Examples
# [1, 2, 5, 6, 5, 2]  == 2
# ...because there are 2 pairs: 2 and 5
#
# [1, 2, 2, 20, 6, 20, 2, 6, 2]  -->  4
# ...because there are 4 pairs: 2, 20, 6 and 2 (again)
#
# 5 1s --> 2 pairs of 1s
#
# pairs([0, 0, 0, 0, 0, 0, 0]) == 3
# 7/2 = 3
#
# pairs([1, 1, 1, 1, 1]) == 2
# => 5/2 = 2
#
# PEDAC
# P:
# - method takes an array of integers
# - we have to count all paris and return their count
# - arr argument can be empty or contain 1 value -return 0
#
# DS:
# input: array
# output: int
#
# N: tally
#
# A:
# - create a hash with numbers and their counts
#
# - initialize `result`` to 0
#
# - iterate over the hash:
#  - if the value for the given key is 2, add 1 to result
#  -if the value for the given key is >2, divide this value by 2 and add the result of division to `result`
#
#  -return `result`

def pairs(array)
  hash = array.tally

  result = 0

  hash.each do |_, v|
    if v == 2
      result += 1
    elsif v > 2
      result += (v / 2)
    end
  end

  result
end
p pairs([1, 2, 5, 6, 5, 2]) == 2
pairs([1, 2, 2, 20, 6, 20, 2, 6, 2])
pairs([0, 0, 0, 0, 0, 0, 0])
pairs([1000, 1000])
pairs([1, 1, 1, 1, 1])

p pairs([]) == 0
p pairs([54]) == 0

# A
# - RETURN 0 if size is 1 or less
# - CREATE a duplicate of input with unique values
#   - #uniq [1, 2, 5, 6, 5, 2] -> [1, 2, 5, 6]
# - FIND count of every unique values
#   - iterate over uniq arr [1, 2, 5, 6] and use the method count to count every num in original array:
#     1.count in arr input = 1
#     2 = 2
#     5 = 2
#     6 = 1
# - CREATE  a variable to count every pair
#   - variable initially assigned to 0
#   - if count is equal to 1, then go to next
#   - if count is more than 1, then divide it by 2 ( if 4 i will have 2)
#   - add this result to count +=
# - RETURN the value of this counter

def pairs(arr)
  return 0 if arr.size <= 1

  unique_arr = arr.uniq
  counter = 0
  unique_arr.each do |num|
    if arr.count(num) > 1
      result = arr.count(num) / 2
      counter += result
    end
  end
  counter
end

p pairs([1, 2, 5, 6, 5, 2]) == 2
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
p pairs([0, 0, 0, 0, 0, 0, 0]) == 3
p pairs([1000, 1000]) == 1
p pairs([1, 1, 1, 1, 1]) == 2
p pairs([]) == 0
