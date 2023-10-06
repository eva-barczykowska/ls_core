
# Given two integers as arguments, create a function that finds the largest prime within the range of the two integers.

# P: 
# - Given 2 integers as arguments, return the largest prime integer within their range
# - prime number is a number that is divisible only by 1 and itself

# - numbers could be ascending or descending
# E:

# fat_prime(2, 10) == 7
# [2..10]
# # range [2, 3, 4, 5, 6, 7, 8, 9, 10] and the largest prime is 7.

# fat_prime(10, 2) == 7
# # [10, 9, 8, 7, 6, 5, 4, 3, 2] and the largest prime is 7.

# fat_prime(4, 24) == 23
# range [4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24] the largest prime is 23.

# Notes:

# - require prime?

# Algorithm
# - require prime

# - account for when the 2nd arg is smaller than the first:
# - swap the numbers

# - create a range from 1st arg integer to the 2nd(including), change it to an array

# - select all the prime numbers

# - return the max number from the array/method

# require 'prime'
#
# def fat_prime(num1, num2)
#   array = []
#
#   if num2 < num1
#     array = (num2..num1).to_a
#   else
#     array = (num1..num2).to_a
#   end
#
#   array.select { |n| n.prime? }.max
# end
#
# p fat_prime(2, 10) == 7
# p fat_prime(10, 2) == 7
# p fat_prime(4, 24) == 23

puts
# how to check if a number is a prime number?
# divide it by all the numbers before it except 1
# if there are no even divisions but the number is divisible by itself, it's a prime number
def fat_prime(num1, num2)
  if num1 < num2
    array = (num1..num2).to_a
  else
    array = (num2..num1).to_a
  end

  array = array.reject { |n| n % 2 == 0 }
  array = array.reject { |n| n % 3 == 0 }
  array = array.reject { |n| n % 5 == 0 }
  array.max

end

p fat_prime(2, 10) == 7
p fat_prime(10, 2) == 7
p fat_prime(4, 24) == 23

puts

def is_prime?(n)
  return false if n < 2
  (2..Math.sqrt(n)).none? { |i| n % i == 0 }
  # (2..Math.sqrt(n)).none? { |i| p n }
end


def fat_prime(n1, n2)
  primes = []

  if n1 < n2
    arr = (n1..n2).to_a
  else
    arr = (n2..n1).to_a
  end

  arr.each do |number|
    if is_prime?(number)
      primes << number
    end
  end

  primes.max
end
p fat_prime(2, 10) == 7
# p fat_prime(10, 2) == 7
# p fat_prime(4, 24) == 23
