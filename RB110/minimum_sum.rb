# Write a method that takes one argument: an array of integers.
# The method should return the minimum sum of 5 consecutive
# numbers in the array. If the array contains fewer than 5
# elements, the method should return nil.
# Examples:

# p minimum_sum([1, 2, 3, 4]) == nil
# p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
# p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
# p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10
# The tests above should print "true".
# PEDAC TEMPLATE

# ************** Problem **************
# -write a method that takes an array of integers as an argument
# -the method returns the MINIMUM SUM of 5 consecutive numbers
# -if the argument array has less than 5 elements, method returns nil
# ************** Examples **************
# p minimum_sum([1, 2, 3, 4]) == nil
# => coz it has 4 elements
# p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
# => coz 1 + 2 + 3 + 4 + 5 = 15
# p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
# => 2 + 6 + 5 + 1 + 2 = 16
# p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10
# => -1, -5, -3, 0, -1 = -10

# ************** Data Structures **************
# Input: array
# Middle: how I’m going to get from where I am to where I want to be
# Output: nil / min sum of 5 capital integers
# ************** Algorithm **************
# - return nil if the size of the argument array is less than 5
# -create all possible sums of 5 consecutive integers, starting from the number at index 0
# so [1, 2, 3, 4, 5, 6] will give us
# [1, 2, 3, 4, 5] and [2, 3, 4, 5, 6]
# -I have to iterate until array.size - 5
# integers from index 0 and take 5
# then integers from index 1 and take 5
# do this until you reach the last index from which it's possible to take 5 integers
# in case [1, 2, 3, 4, 5, 6], this is number at index 1
# save these arrays in a results array

# now process that array (maybe with each_with_object)
# in the hash, the key will be array of 5 elements and the value will be its sum

# search for the minimum sum and return it
# ************** Code **************

# ************** Refactor **************

# Differentiate between EXPLICIT AND IMPLICIT requirements?
# def minimum_sum(arr)
#   results = []
#   counter = 0
#
#   while counter <= arr.size - 5
#     results << arr.take(5)
#     arr.shift
#   end
#
#   results.each_with_object({}) { |subarr, hash| hash[subarr] = subarr.sum }.values.min
#
# end
#
# p minimum_sum([1, 2, 3, 4]) == nil
# p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
# p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
# p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10
#
# puts
# puts "solution with each_cons"
# a = [1, 2, 3, 4, 5, 6]
# a.each_cons(5) do |group|
#   p group
# end
#
# def minimum_sum(arr)
#   results = []
#   arr.each_cons(5) { |group| results << group }
#   results.each_with_object({}) { |subarr, hash| hash[subarr] = subarr.sum }.values.min
# end
#
# p minimum_sum([1, 2, 3, 4]) == nil
# p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
# p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
# p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10
#
# puts
# puts "sedrick's suggestion"
#
# def mininum_sum(arr)
#   arr = [8,1,2,2,3, 3, 4, 8, 6, 12, 3]
#   take = 3
#   result = []
#
#   until arr.size < take
#     result << arr.take(take) # not this variable name
#     arr.shift
#   end
#
#   result
# end
#
# puts
#
# p minimum_sum([1, 2, 3, 4]) == nil
# p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
# p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
# p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10
puts 'refactor'

def minimum_sum(arr)
  nums_to_extract = 5
  result = []

  until arr.size < nums_to_extract
    result << arr.take(nums_to_extract)
    arr.shift
  end

  result.map { |subarray| subarray.sum }.min
end

p minimum_sum([1, 2, 3, 4]).nil?
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10

puts
puts "sedrick's solution"
def minimum_sum(arr)
  return nil if arr.length < 5

  groups = []
  nums_to_retrieve = 5

  (0...arr.size).each do |idx| # grabbing index to extract numbers from array
    # putting this first so that it doesn't go through all indices but breaks
    break if arr[idx...nums_to_retrieve].length < 5

    groups << arr[idx...nums_to_retrieve] # extracting from arr and storing in groups array
    nums_to_retrieve += 1
  end

  p groups
  groups.min_by { |pair| pair.sum }.sum
end
# Returns the elements for which the block returns the minimum values
# groups are [[55, 2, 6, 5, 1], [2, 6, 5, 1, 2], [6, 5, 1, 2, 9], [5, 1, 2, 9, 3], [1, 2, 9, 3, 5], [2, 9, 3, 5, 100]]
# groups.min_by { |pair| pair.sum } returns the subarray, which produces the smallest sum [2, 6, 5, 1, 2]
# adding .sum returns the sum of that array
#
#
# --0--1--2--3--4--5--6--7--8--9 #all indices
# --0--1--2--3--4--5 #indices to start from and take 5 numbers, after this index arr.length < 5 so we'll break and arr will have indices 1-5
#
# [55, 2, 6, 5, 1, 2, 9, 3, 5, 100] #argument array
# [55, 2, 6, 5, 1]
#     [2, 6, 5, 1, 2]
#        [6, 5, 1, 2, 9]
#           [5, 1, 2, 9, 3]
#               [1, 2, 9, 3, 5]
#                  [2, 9, 3, 5, 100]

# p minimum_sum([1, 2, 3, 4]) == nil
# p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) #== 16
# p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10

puts
# # Write a method that takes one argument: an array of integers.
# The method should return the minimum sum of 5 consecutive
# numbers in the array. If the array contains fewer than 5
# elements, the method should return nil.
#
# PEDAC
# P:
# - write a method that takes an array of integers as an argumetn
# - method returns minimum sum of 5 consecutive integers in this argument array
# - if array has fewer than 5 integers, return nil
# = nums can be negative
#
# Examples:
# p minimum_sum([1, 2, 3, 4]) == nil
# => fewer than 5
#
# p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
# 1+2+3+4+5=15
# 2+3+4+5+6=20 => minimum sum is 18
#
# p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
#
# p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10
#
# The tests above should print "true".
#
# DS:
# input: array of integers
# output: nil or minimum sum, an integer
#
# A:
#
# - return nil if arr has less than 5 elements
#
# - initialize `sums`
#
# - populate `sums` with all possible sums of consecutive 5 integers
#
# - select min sum from this array and return it

def minimum_sum(arr)
  return nil if arr.size < 5

  sums = []

  (0..arr.size - 5).each do |index|
    sums << arr.slice(index, 5)
  end

  sums.map { |a| a.sum }.min
end

p minimum_sum([1, 2, 3, 4]).nil?
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10

puts
#  Write a method that takes one argument: an array of integers.
# The method should return the minimum sum of 5 consecutive
# numbers in the array. If the array contains fewer than 5
# elements, the method should return nil.
#
# problem
# =======
# -method takes an array of integers
# -method returns the MIN SUM of 5 consecutive integers in the array
# -if there are fewer than 5 numbers, return nil
# - numbers can be negative
#
#
# Examples:
# p minimum_sum([1, 2, 3, 4]) == nil
# => fewer than 5 nums
#
# p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
# => [1, 2, 3, 4, 5] => 14
# => [2, 3, 4, 5, 6] => 15
#
# p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
# p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10
# The tests above should print "true".
#
#
# Allgorith
# =========
# -RETURN nil if arr size is elss than 5
# -create slices array 5 elements each
# --start with 1st ellement at index 0 and finish at 5 from the end
# --sllice 5 ellements from the starting index and move on by 1
# --store sliced of 5 in the slices array
#
# -ITERATE over the sllices and sum them
# -sort sums and return first, it will be the smallest
def minimum_sum(arr)
  return nil if arr.size < 5

  slices = []

  (0..arr.size - 5).each do |start|
    slices << arr.slice(start, 5)
  end

  slices.map(&:sum).sort.first
end
p minimum_sum([1, 2, 3, 4]).nil?
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10
