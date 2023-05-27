=begin
For "x", determine how many positive integers less than or equal to "x" are odd but not prime.
Assume "x" is an integer between 1 and 10000.

Example: 5 has three odd numbers (1,3,5) and only the number 1 is not prime, so the answer is 1
Example: 10 has five odd numbers (1,3,5,7,9) and only 1 and 9 are not prime, so the answer is 2

A prime number (or a prime) is a natural number greater than 1 that has no positive divisors other than 1 and itself.
PEDAC TEMPLATE

************** Problem **************
-write a method, which takes 1 argument, an integer
-for that integer, i.e. from 1 to that integer determine
-how many positive integers are odd but not prime
************** Examples **************
Example: 5 has three odd numbers (1,3,5) and only the number 1 is not prime, so the answer is 1
Example: 10 has five odd numbers (1,3,5,7,9) and only 1 and 9 are not prime, so the answer is 2

************** Data Structures **************
Input: an integer
  Middle: how I’m going to get from where I am to where I want to be
Output: an integer (signifying how many integers from 1 to that number (the argument) are ODD but NOT PRIME)
  ************** Algorithm **************
-find all numbers from 1 to the argument
-select all the odd numbers that are not prime
-return the size of the array

 ************** Code **************

************** Refactor **************
=end

require 'prime'

def odd_not_prime(int)
  (1..int).to_a.select{ |num| num.odd? && !num.prime? }.size
end
p odd_not_prime(15) == 3
p odd_not_prime(48) == 10
p odd_not_prime(82) == 20



