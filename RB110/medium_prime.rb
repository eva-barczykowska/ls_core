#
# A prime number is a positive number that is evenly divisible only by itself and 1. Thus, 23 is prime since its only divisors are 1 and 23. However, 24 is not prime since it has divisors of 1, 2, 3, 4, 6, 8, 12, and 24. Note that the number 1 is not prime.
#
# Write a method that takes a positive integer as an argument and returns true if the number is prime, false if it is not prime.
#
# You may not use Ruby's Prime class to solve this problem. Your task is to programmatically determine whether a number is prime without relying on any methods that already do that for you.
#
# Problem:
# -write a method that returns true or false
#
# -true if the arg is a prime number / false if it isn't
#
# Examples:
# puts(is_prime(1) == false)              # true
#
# puts(is_prime(2) == true)               # true
#
# puts(is_prime(3) == true)               # true
#
# puts(is_prime(4) == false)              # true
#
# DS:
# input: int
# output: boolean
#
# A:
# - return false if argument is 1
#
# - create a range from 2 to arg integer
# - iterate through this range excluding the argument
# - if for any number from the range, if the argument number MODULO by the number from the range, if the result is 0, this means that this is NOT a prime number
#
# 2,3,4
# 5
#
# 6
# is it leaving a remainder?
# if it's NOT leaving a remainder EVEN ONCE, this means it's a prime number
# --do all numbers from the range leave a remainder, if yes, it's a prime number
#
def is_prime(number)
  return false if number == 1
  return false if (2...number).to_a.any? { |divisor| number % divisor == 0 }

  true
end

puts(is_prime(1) == false)              # true
puts(is_prime(2) == true)               # true
puts(is_prime(3) == true)               # true
puts(is_prime(4) == false)              # true
puts(is_prime(5) == true)               # true
puts(is_prime(6) == false)              # true
puts(is_prime(7) == true)               # true
puts(is_prime(8) == false)              # true
puts(is_prime(9) == false)              # true
puts(is_prime(10) == false)             # true
puts(is_prime(23) == true)              # true
puts(is_prime(24) == false)             # true
puts(is_prime(997) == true)             # true
puts(is_prime(998) == false)            # true
puts(is_prime(3_297_061) == true)       # true
puts(is_prime(23_297_061) == false)     # true
