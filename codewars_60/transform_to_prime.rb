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

puts
=begin
Task :
Given a List [] of n integers , find minimum number to be inserted in a list, so that sum of all elements of list should equal the closest prime number .

Notes
List size is at least 2 .
List's numbers will only positives (n > 0) .
Repetition of numbers in the list could occur .
The newer list's sum should equal the closest prime number .

1- minimumNumber ([3,1,2]) ==> return (1)
Explanation:
Since , the sum of the list's elements equal to (6) , the minimum number to be inserted to transform the sum to prime number is (1) , which will make the sum of the List equal the closest prime number (7) .

2-  minimumNumber ({2,12,8,4,6}) ==> return (5)
Explanation:
Since , the sum of the list's elements equal to (32) , the minimum number to be inserted to transform the sum to prime number is (5) , which will make the sum of the List equal the closest prime number (37) .

3- minimumNumber ({50,39,49,6,17,28}) ==> return (2)
Explanation:
Since , the sum of the list's elements equal to (189) , the minimum number to be inserted to transform the sum to prime number is (2) , which will make the sum of the List equal the closest prime number (191) .

PEDAC
- The question to ask was WHAT IF THE NUMBER COMING OUT OF SUMMING ALL ELEMENTS IN THE ARRAY ALREDY IS A PRIME NUMBER?
- write a method that takes an array of numbers
- array will be on min size 2
- nums in array will be only positive
- nums in array could be repeated

E: analized

DS
input: array of numbers
output: the number to add so that the sum becomes a PRIME NUMBER

A:
- require 'prime'
- sum input array numbers and store result in sum
- create a loop
- keep adding 1 to sum and asking if the number is prime
- if it is, return the difference between initial sum and counter number

- alternative solution: first write a method that establishes if a number is prime

- create 2 counters, 1 to return and onother one to reassign to 0 each time

=end

require 'prime'
def get_minimum_number(arr)
  sum = arr.sum
  return 0 if sum.prime?

  counter_to_return = 1
  loop do
    counter = 1
    new_sum = sum += counter
    # p "new sum is #{new_sum}"
    return counter_to_return if new_sum.prime?
    counter = 0
    counter_to_return += 1
  end

end
p get_minimum_number([3,1,2]) == 1
p get_minimum_number([2,12,8,4,6]) == 5
p get_minimum_number([50,39,49,6,17,28]) == 2
p get_minimum_number([5,2]) == 0
p get_minimum_number([1,1,1]) == 0

puts
puts "with my own prime method"
# - write a method that returns true or false if a number is prime or not
# - ask if a given number is divisible without a change/reszta only by numbers from 2 to itself excluded then the method returns false
# - if it is evenly divisible only by itself, then it is a prime number

# -once I have this is_prime? method
# sum tthe array and save result to `sum`
# - loop from sum to the closest prime number
# - the is_prime method will check if a number is prime
# - I will have 2 counters
# -within the loop create `new_sum` to track the current number after adding 1
#  counter to increase so that another number is produced
# - counter to return so that I know how many numbers I've increased since the num and then I can return thsi counter
# - i can add 1 to sum of the array and track how many times I added 1 in counter_to_return
# - I also have counter

# MISSED: if it already IS a prime number, simply return it

def is_prime?(num)
  (2...num).each do |divisor|
    return false if num % divisor == 0
  end
  true
end
# p is_prime?(1) == false
# p is_prime?(2) == false
# p is_prime?(3) == true


def get_minimum_number(arr)
  sum = arr.sum
  return 0 if is_prime?(sum)

  counter_to_return = 0
  counter = 0

  loop do
    counter += 1
    counter_to_return += 1
    new_sum = sum += counter
    return counter_to_return if is_prime?(new_sum)
    counter = 0
  end
end
p get_minimum_number([3,1,2]) == 1
p get_minimum_number([2,12,8,4,6]) == 5
p get_minimum_number([50,39,49,6,17,28]) == 2
p get_minimum_number([5,2]) == 0
p get_minimum_number([1,1,1]) == 0




