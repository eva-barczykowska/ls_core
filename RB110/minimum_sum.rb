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

def minimum_sum(arr)
  results = []
  counter = 0

  while counter <= arr.size - 5
    results << arr.take(5)
    arr.shift
  end

  results.each_with_object({}) { |subarr, hash| hash[subarr] = subarr.sum }.values.min

end

p minimum_sum([1, 2, 3, 4]) == nil
# => coz it has 4 elements
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
# => coz 1 + 2 + 3 + 4 + 5 = 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
# => 2 + 6 + 5 + 1 + 2 = 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10
# => -1, -5, -3, 0, -1 = -10

puts
puts "solution with each_cons"
a = [1,2,3,4, 5, 6]
a.each_cons(5) do |group|
  p group
end

def minimum_sum(arr)
  results = []
  arr.each_cons(5) { |group| results << group }
  results.each_with_object({}) { |subarr, hash| hash[subarr] = subarr.sum }.values.min
end

p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10

