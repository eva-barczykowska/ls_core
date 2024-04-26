# [Train: Transform To Prime \| Codewars](https://www.codewars.com/kata/5a946d9fba1bb5135100007c/train/ruby)
# 6 kyu
# Task :
# Given a List [] of n integers , find the minimum number to be inserted in a list, so that the sum of all elements of the list should equal the closest prime number .
#
# Notes
# List size is at least 2 .
#
# List's numbers will only have positives (n > 0) .
#
# Repetition of numbers in the list could occur .
#
# The newer list's sum should equal the closest prime number .
#
# Input >> Output Examples
# 1- minimumNumber ([3,1,2]) ==> return (1)
# Explanation:
# Since , the sum of the list's elements equal to (6) , the minimum number to be inserted to transform the sum to prime number is (1) , which will make *the sum of the List** equal the closest prime number (7)* .
# 2-  minimumNumber ([2,12,8,4,6]) ==> return (5)
# Explanation:
# Since , the sum of the list's elements equal to (32) , the minimum number to be inserted to transform the sum to prime number is (5) , which will make *the sum of the List** equal the closest prime number (37)* .
# 3- minimumNumber ([50,39,49,6,17,28]) ==> return (2)
# Explanation:
# Since , the sum of the list's elements equal to (189) , the minimum number to be inserted to transform the sum to prime number is (2) , which will make *the sum of the List** equal the closest prime number (191)* .

#
#
# - PROBLEM
#   - Input: an array that contains integersx
#   - Output: minimum integer to insert into the list
#
#   - Rules:
#     - prime number is number that is divisible by 1 and itself
#     - list size is greater than 2
#     - there could be duplicated numbers
#     - the newer list's sum is close to prime number
#
# - EXAMPLE
#   minimumNumber ([2,12,8,4,6]) ==> return (5)
#   since , the sum of the list's elements equal to (32) , the minimum number to be inserted to transform the sum to prime number is (5) , which will make *the sum of the List** equal the closest prime number (37)* .
#
#   prime number - sum of all of elemetns =  5
#
# - DATA STRUCTURE
#   - array because we need the array to do all of the calculation
#
# - ALGORITHM
#   - write a method that establishes if a number is prime and returns true or false
#  - iterate over all the numbers from 2 to the number(exclusive) and the remainder has to different than 0
# - if it is, then it's a prime number
#
# - then deal with the argument array
# - sum it and in a loop keep adding 1 (counter )and asking if it is a prime number
# - if the number is a prime number, return COUNTER
#

def is_prime?(number)
  res = []
  (2...number).each do |num|
    res << true if number % num != 0
    res << false if number % num == 0
  end
  res.all? { |e| e == true }
end
# p is_prime?(5)
# p is_prime?(6)

def minimum_number(array)
  counter = 0
  sum = array.sum
  return counter if is_prime?(sum)

  loop do
    sum += 1
    counter += 1
    return counter if is_prime?(sum)
  end
end

# ALGORITHM
# - find the sum of all of the elements
# - find the closest prime number
#   - create a list of prime number
#     -
#   - find the prime numbers that is greater than sum
#   - return the prime number
# - find the result of the prime - the sum of all elements
# prime number = [1,3,5,7,11,13,17,19,23]

def create_prime_number(sum)
  prime_number = 0
  counter = 1

  loop do
    prime_number += 6 * counter + 1
    counter += 1
    break if prime_number > sum
  end
  prime_number
end

def minimum_number(integers_array)
  total = integers_array.sum
  create_prime_number(total) - total
end

p minimum_number([3, 1, 2]) # == 1
p minimum_number([5, 2]) #== 0
p minimum_number([1, 1, 1]) #== 0
p minimum_number([2, 12, 8, 4, 6]) #== 5
p minimum_number([50, 39, 49, 6, 17, 28]) #== 2

# ALGORITHM
# =========
#   + create sum of all Input Integers
# + create Prime, intitialize to `nil`
# == find next largest prime number ==
#                              + iterate incrementally from Sum
# + if current number is a prime number
#     + reassign Prime to current number
#
#     + return Prime minus Sum
#
#
def is_prime?(n)
  for divisor in 2..(n - 1)
    return false if (n % divisor) == 0
  end

  true
end

puts 'Uy'
def minimum_number(list)
  sum = list.sum
  prime = nil

  test_num = sum

  until prime
    prime = test_num if is_prime?(test_num)
    test_num += 1
  end
  prime ? prime - sum : 0
end
p minimum_number([3, 1, 2]) == 1
p minimum_number([5, 2]) == 0
p minimum_number([1, 1, 1]) == 0
p minimum_number([2, 12, 8, 4, 6]) == 5
p minimum_number([50, 39, 49, 6, 17, 28]) == 2
