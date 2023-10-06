=begin
Create a function that takes an array and returns a new array containing only prime numbers.
filter_primes([7, 9, 3, 9, 10, 11, 27]) ➞ [7, 3, 11]

filter_primes([10007, 1009, 1007, 27, 147, 77, 1001, 70]) ➞ [10007, 1009]

filter_primes([1009, 10, 10, 10, 3, 33, 9, 4, 1, 61, 63, 69, 1087, 1091, 1093, 1097]) ➞ [1009, 3, 61, 1087, 1091, 1093, 1097]

New array must maintain the order of primes as they first appear in the original array.

P:
- define a method that takes an array of integers as an argument
- this method returns an array of prime numbers in the order that they appear in the input array

E:
filter_primes([7, 9, 3, 9, 10, 11, 27]) == [7, 3, 11]

filter_primes([10007, 1009, 1007, 27, 147, 77, 1001, 70]) == [10007, 1009]

filter_primes([1009, 10, 10, 10, 3, 33, 9, 4, 1, 61, 63, 69, 1087, 1091, 1093, 1097]) == [1009, 3, 61, 1087, 1091, 1093, 1097]

DS:
- input: array
- output: array of prime numbers in the order that they appeared in the input array

A:
- initialize `primes` array to an empty array

- iterate over the input array
- while iterating, establish if a num at the current index is prime and if it is, add it to the `primes` array

-return the primes array

OR

select from input arr numbers that are prime numbers
=end

require 'prime'

def filter_primes(arr)
  arr.select { |n| n.prime? }
end
filter_primes([7, 9, 3, 9, 10, 11, 27]) == [7, 3, 11]
filter_primes([10007, 1009, 1007, 27, 147, 77, 1001, 70]) == [10007, 1009]
filter_primes([1009, 10, 10, 10, 3, 33, 9, 4, 1, 61, 63, 69, 1087, 1091, 1093, 1097]) == [1009, 3, 61, 1087, 1091, 1093, 1097]