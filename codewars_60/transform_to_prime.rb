# 43. Transform To Prime
# (https://www.codewars.com/kata/5a946d9fba1bb5135100007c/train/ruby)
# 6 kyu

# Task :
# Given a List [] of n integers , find the minimum number to be inserted in a array, so that the sum of all elements of the array should equal the closest prime number .
# ** given an array of int, sum it.

# Notes
# Array size is at least 2 .

# Array's numbers will only have positives (n > 0) .

# Repetition of numbers in the list could occur .

# The newer list's sum should equal the closest prime number .
# PEDAC TEMPLATE

# ************** Problem **************
# -write a method that takes an array of integers
# -the method finds a minimum number to be inserted in the array so that
# the sum of all elements is equal to the closest prime number

# A PRIME number is a number divisible only by 1 and itself
# Questions:

# ************** Examples **************
# minimum_number([3,1,2]) == 1
# # => the sum is 6, and if I add 1, I'll get 7 which is a prime number
# minimum_number([5,2]) == 0
# # => because it's already a prime number!
# minimum_number([1,1,1]) == 0
# # => because it's already a prime number!
# minimum_number([2,12,8,4,6]) == 5
# # sum is 32, it is not a prime, I need to add 5
# minimum_number([50,39,49,6,17,28]) == 2
# # sum is 189, it is not a prime, I need to add 2

# ************** Data Structures **************
# input: array of numbers
# output: integer
# ************** Algorithm **************
# -sum all elements of the array
# -check if it is a prime number already
# -how? use the gem 'prime' or write your own method
# -if it is not a prime, keep adding one and checking if it is a prime number
# keep track of the number that I'm adding
# once I have the prime number, return the number that I've added to the array

# ************** Code **************
require 'prime'

def minimum_number(array)
  current_sum = array.sum
  return 0 if current_sum.prime?

  # counter = 1
  loop do
    # current_sum += counter #I was adding the counter here, so adding 1, then 2, then 3 while I wanted to add only 1 each time!
    current_sum += 1
    break if current_sum.prime?
    # counter += 1 # so on the 1st loop counter is 1, on the second 2, on the third 3, then 4 so I would NOT just add 1 each time!
  end
  current_sum - array.sum
end

p minimum_number([3,1,2]) == 1
p minimum_number([5,2]) == 0
p minimum_number([1,1,1]) == 0
p minimum_number([2,12,8,4,6]) == 5
p minimum_number([50,39,49,6,17,28]) == 2

def prime?(num)
  (2...num).each do |n|
    return false if num % n == 0
  end
  true
end
