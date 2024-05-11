# PERCENTAGE OF EVENS 2
# Given an array of integers, consider the "running sum" of each element: the sum of all the elements up to and including that element. For instance:
# [1, 5, 3]
# the running sum of 1 is 1
# the running sum of 5 is (1 + 5) = 6
# the running sum of 3 is (1 + 5 + 3) = 9
#
# Return the percentage of running sums in the array that are even, rounded to two decimal places. You can use `Array#round` with `2` as an argument to perform this rounding.
#
# p evenPercent([1, 2, 4]) == 0
# p evenPercent([1, 3]) == 0.50
# p evenPercent([1, 5, 3]) == 0.33
# p evenPercent([2, 4, 6]) == 1.00
# p evenPercent([12]) == 1.00
# p evenPercent([13]) == 0.00
# p evenPercent([]) == 1.00
#
# Problem
# =======
# -method takes an array of integers
# -array can be empty
# -method calculates RUNNING SUM
# -RUNNING SUM is a sum of all elements including the current element
#
# method returns the percentage of running sums that are even, rounded to 2 decimal places
#
# Examples
# ========
# p evenPercent([1, 2, 4]) == 0
# =>sum is odd, => 0
#
# p evenPercent([1, 3]) == 0.50
# => 2 running sums: 1, 4
# => calculate all running sums
# => 4 is even, we have 2 sums, 1 is even therefore is 0.50
#
# p evenPercent([1, 5, 3]) == 0.33
# => 1, 6, 9
# => 1 running sum / how many sums we have
#
# p evenPercent([2, 4, 6]) == 1.0
# => 2, 6, 12
# => all even, 3 even runnin sums / 3 => 1
#
# p evenPercent([12]) == 1.0
# =>=> all even, 1 even runnin sums / 1 => 1
#
# p evenPercent([13]) == 0.0
# => No running sums => 0
#
# p evenPercent([]) == 1.0
# => Empty array => 1
#
# Algorithm
# =========
# return 1.00 if argument array is empty
#
# ITERATE over the argument array and at each point calculate the sum of all previous elements including the current element
# [2, 6, 12]
# INIT `result`
# INIT `counter`
# -start from counter 0 and continue until arr.size - 1
# -for each element, I calculate the sum of all the previous elements
#
# SELECT even elements
# DIVIDE by all elements
#
# ROUND the result to 2 places
def even_percent(arr)
  return 1.0 if arr.empty?

  counter = 0
  result = []

  while counter < arr.size
    result << arr[0..counter].sum
    counter += 1
  end

  (result.select { |n| n.even? }.size / result.size.to_f).round(2)
end

p even_percent([1, 2, 4]) == 0
p even_percent([1, 3]) == 0.50
p even_percent([1, 5, 3]) == 0.33
p even_percent([2, 4, 6]) == 1.00
p even_percent([12]) == 1.00
p even_percent([13]) == 0.00
p even_percent([]) == 1.00

puts

def even_percent(arr)
  return 1.0 if arr.empty?

  counter = 0
  result = []

  while counter < arr.size
    result << arr[0..counter].sum
    counter += 1
  end

  even_sums = result.select { |n| n.even? }
  (even_sums.size.to_f / result.size).round(2)
end

p even_percent([1, 2, 4]) == 0
p even_percent([1, 3]) == 0.50
p even_percent([1, 5, 3]) == 0.33
p even_percent([2, 4, 6]) == 1.00
p even_percent([12]) == 1.00
p even_percent([13]) == 0.00
p even_percent([]) == 1.00

puts

# Input : Array (of nums)
# Output: Float (the percentage of running sums that are even in the input)
#
# Rules:
#   **"Running sum"
#     - Is the sum of the nums from the starting num in an Array to the current num
#
#   - Answer must be rounded to 2 decimals
#   - "percent" is in decimal format
#   - IF input is empty RETURN 1.00
#
# DS
#   input Array --> Array (of running sums) --> Float (the percentage)
#
# ALGO:
#   1. RETURN 1.00 IF input is empty (could be done/evaluated at the end as well)
#
#   2. CONVERT input to an Array of running sums
#     -- GO OVER each index in the input
#       a) GET slice from 0th element to current index
#       b) STORE the sum of that slice
#
#   3. RETURN the percentage (as a decimal) of running sums that are even
#     a) GET the size of the input
#     b) GET the number of even nums
#     c) RETURN even nums divided by size of input (rounded to 2 decimals)

def evenPercent(nums)
  running_sums = nums.map.with_index { |_, ind| nums[0..ind].sum }
  even_nums    = running_sums.count  { |num| num.even? }

  nums.empty? ? 1.00 : (even_nums.to_f / nums.size).round(2)
end
p even_percent([1, 2, 4]) == 0
p even_percent([1, 3]) == 0.50
p even_percent([1, 5, 3]) == 0.33
p even_percent([2, 4, 6]) == 1.00
p even_percent([12]) == 1.00
p even_percent([13]) == 0.00
p even_percent([]) == 1.00

puts

# PERCENTAGE OF EVENS 2

#
# Given an array of integers, consider the "running sum" of each element: the sum of all the elements up to and including that element.
#
# For instance: [1, 5, 3]
#
# the running sum of 1 is 1
# the running sum of 5 is (1 + 5) = 6
# the running sum of 3 is (1 + 5 + 3) = 9
#
# Return the percentage of running sums in the array that are even, rounded to two decimal places. You can use `Array#round` with `2` as an argument to perform this rounding.
#

# PROBLEM

# return the % of running sums in the array that are even, rounded to two decimenals places

# input: array
# output: float (repesenting fraction of running sums that are even)
# rules:
# return 1.00 if given an empty array
# size of given array == size of array of running sums

# example:

# [1,5,3]
# 1
# 1
# 1, 5
# 6
# 1, 5, 3
# 9

# [1,6 9]
# 1
# odd
# 0
# 6
# even
# 1
# 9
# odd
# 1

# 1 / 3
# 0.33

# DSA

# array of given ints --> array of given sum ints --> float

# HELPER -- get all running sums

# define an array RUNNING_SUMS
# loop over array of given ints
# sum from 0th element to current element
# append to array RUNNING_SUMS

# SOLVER -- calculate % of running sums in collection are even

# pass RUNNING_SUMS as argument
# define counter EVENS = 0.0
# loop over running_sums
# EVENS +=1 if current element is even
# calculate fraction of even sums in running sums array
# EVENS / RUNNING_SUMS.size
# .round(2)

# CODE
puts 'Zach'
def runningSums(arr)
  running_sums = []

  arr.each_with_index do |_, idx|
    running_sums << arr[0..idx].sum
  end

  running_sums
end

def evenPercent(arr)
  return 1.0 if arr.empty?

  evens = 0.0

  runningSums(arr).each do |sum|
    evens += 1 if sum.even?
  end

  (evens / runningSums(arr).size).round(2)
end

# TEST CASES
p evenPercent([1, 2, 4]) == 0
p evenPercent([1, 3]) == 0.50
p evenPercent([1, 5, 3]) == 0.33
p evenPercent([2, 4, 6]) == 1.00
p evenPercent([12]) == 1.00
p evenPercent([13]) == 0.00
p evenPercent([]) == 1.00
