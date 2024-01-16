=begin
# For "x", determine how many positive integers less than or equal to "x" are odd but not prime. Assume "x" is an integer between 1 and 10000.

# Example: 5 has three odd numbers (1,3,5) and only the number 1 is not prime, so the answer is 1
# Example: 10 has five odd numbers (1,3,5,7,9) and only 1 and 9 are not prime, so the answer is 2

# A prime number (or a prime) is a natural number greater than 1 that has no positive divisors other than 1 and itself.

P:
-write a method that takes an integer as as argument
-the integer has to be between 1 and 10_000
-argument is going to be always positive

E:
p odd_not_prime(15) == 3
1, 3, 5, 7, 9, 11, 13, 15 => 3, 5, 7, 11 => 1, 9, 15

p odd_not_prime(48) == 10
=>
p odd_not_prime(82) == 20

DS:
input: Integer
middle: Array
output: Int

Notes:
-select
-count

A:
-write a helper method prime?
-this method returns false if the number is 1 or if the number is can be divided by other numbers
 any of the numbers up to the number

-the prime number is divisible only by itself and 1

-count from 1 to the argument and store the number in the array if they're odd

-in this array of odd numbers, count the ones that are not prime
=end

def my_prime?(num)
  return false if num == 1

  result = []
  (2...num).each do |divisor|
    result << (num % divisor != 0)
  end
  result.all?{ |element| element == true }
end

# p my_prime?(1)


def odd_not_prime(int)
  numbers = []

  1.upto(int) do |number|
    numbers << number if number.odd?
  end

  # p numbers
  numbers.count { |element| !my_prime?(element) }
end

p odd_not_prime(15) == 3
p odd_not_prime(48) == 10
p odd_not_prime(82) == 20
