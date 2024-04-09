#   Given a collection of integers, write a method to find the greatest sum that can be obtained by adding consecutive even values or consecutive odd values.
#   consecutive_sum([1, 1, 1, 1, 1]) == 5
#   consecutive_sum([1, 2, 3, 4, 5]) == 5
#   consecutive_sum([88, 54, 67, 56, 36]) == 142
#
# P:
# -method takes an array
# -method returns an integer
#
# -method finds the greatest sum that can be obtained by adding consecutive even values or consecutive odd values
#
# E
# consecutive_sum([1, 1, 1, 1, 1]) == 5
# => odd => 5
#
# consecutive_sum([1, 2, 3, 4, 5]) == 5
# => coz it's the last one
#
# consecutive_sum([88, 54, 67, 56, 36]) == 142
# 88+54 56+36
#
#
# -iterate over the array
# -init even_sum to 0
# -init odd_sum to 0
#
# if even_sum == 0 and odd_sum == 0 ,return max value from array
#
# -iterate with a counter
# -init temp_odd and temp_even where you will add numbers as you go
# -if after a few even numbers, there is odd, save the temp_even to even_sum, if it is bigger than the current value (which is 0 at the start)
#
# -do this until the end of the array
# -return even_sum or odd_sum, depending on which one is bigger
# Given a collection of integers, write a method to find the greatest sum that can be obtained by adding consecutive even values or consecutive odd values.
#
# P
# Input: array of integers
# Output: integer, which is the greatest sum
#
# Rules:
# - find consecutive odd nnumbers
# - find consecutive even numbers
# - find among them the greatest sum
# - if there is no consecutive numbers, return the biggest num
#
# E
# [1, 2, 3, 4, 5] -> 5
# [88, 54, 67, 56, 36] -> 88, 54 = 142  67  56 + 36 = 92
#
# D
# begin: array of nums
# middle: integers, subarrays of consecutive nums, array to store sums
# end: return integer sum
#
# Solve
# A
# - FIND all subarrays starting from 1 element
#   - create a new empty array to store subs
#   - create a nested loop
#   - first loop is #times and block parameter is my start
#   - second loop is #upto from 1 element till the end of array and block parameter is length
# - SELECT subarrays that include only odd or only even values
#   - select loop to select subarrays, that all values are odd or even
# - TRANSFORM selected subarrays into their sums
#   - map to replace subarrays with their sums
# - RETURN the greatest
#   - the max of the Array

# C
def consecutive_sum(array)
  subs = []
  max = array.size # [88, 54, 67, 56, 36] array.size is 5
  array.size.times do |start| # do this 5 times (defining `start` here as well), start will be 0, 1, 2, 3, 4, 5 || GETTING HOLD OF STARTING INDEX
    1.upto(max) do |length| # start from 1 and go until array.size || starting from 1 accounts for 0 also, we don't want lengh 0, right? || GETTING HOLD OF LENGTH
      subs << array[start, length] # retrieve subarrays, start with 1 and finish with array.size(5), then
    end

    max -= 1
  end
  # p subs # e.g. [[1], [1, 2], [1, 2, 3], [1, 2, 3, 4], [1, 2, 3, 4, 5], [2], [2, 3], [2, 3, 4], [2, 3, 4, 5], [3], [3, 4], [3, 4, 5], [4], [4, 5], [5]]

  selected = subs.select do |sub|
    sub.all? { |num| num.even? } || sub.all? { |num| num.odd? }
  end

  # p selected

  selected.map do |sub|
    sub.sum
  end.max
end

p consecutive_sum([1, 1, 1, 1, 1]) == 5
p consecutive_sum([1, 2, 3, 4, 5]) == 5
p consecutive_sum([88, 54, 67, 56, 36]) == 142

# How would I do it?
# Given a collection of integers, write a method to find the greatest sum that can be obtained by adding consecutive even values or consecutive odd values.
# consecutive_sum([1, 1, 1, 1, 1]) == 5
# consecutive_sum([1, 2, 3, 4, 5]) == 5
# consecutive_sum([88, 54, 67, 56, 36]) == 142
#
# Problem:
# - I have an array of integers
# - I need to find the greatest sum of consecutive even or odd integers
#
# Examples:
#
# consecutive_sum([1, 1, 1, 1, 1]) == 5
# => there are 5 consecutive odd integers, they're all 1, when we sum them, result is 5
#
# consecutive_sum([1, 2, 3, 4, 5]) == 5
# => there are no consecutive even/odd integers so in the end we're considering just the even/odd integer and the greater here is 5
#
# consecutive_sum([88, 54, 67, 56, 36]) == 142
# =>88+54 = 142 56+36 = 92
#
# Algorithm:
# - GET an array of all `subarrays`
# --start with int at index 0 and continue to the last element (included), this is our `start` - OUTER LOOP
# ------start with int `start` and continue to the last element (included), this is our `finish` - INNER LOOP
# ------save [start, finish] to `subarrays`
#
# - SELECT arrays that are ONLY even or ONLY odd
# - TRANSFORM these arrays to their sums
#
# -RETURN the largest sum
def consecutive_sum(array)
  subarrays = []

  (0..array.size).each do |start|
    (start...array.size).each do |finish|
      subarrays << array[start..finish]
    end
  end
  subarrays.select! { |s| s.all?(&:even?) || s.all?(&:odd?) }

  subarrays.map { |s| s.sum }.max
end
p consecutive_sum([1, 1, 1, 1, 1]) == 5
p consecutive_sum([1, 2, 3, 4, 5]) == 5
p consecutive_sum([88, 54, 67, 56, 36]) == 142
