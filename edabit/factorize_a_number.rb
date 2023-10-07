=begin
Create a function that takes a number as its argument and returns an array of all its factors.
The input integer will be positive.

A factor is a number that evenly divides into another number without leaving a remainder.
The second example is a factor of 12, because 12 / 2 = 6, with remainder 0.

factorize(12) ➞ [1, 2, 3, 4, 6, 12]

factorize(4) ➞ [1, 2, 4]

factorize(17) ➞ [1, 17]

P:
Given an integer, return its factors (numbers which divide this integer evenly)

E:
factorize(12) == [1, 2, 3, 4, 6, 12]
factorize(4) == [1, 2, 4]
factorize(17) == [1, 17]

DS:
- input: integer
- output: array of integers which divide the input int evenly

A:
- initialize an empty `factors` array

- iterate over numbers from 1 to the int argument
- if the input int is evenly divisible by the number you're currently iterating over, add it to `factors` array

- return factors array
=end
def factorize(int)
  factors = []

  (1..int).each do |number|
    factors << number if int % number == 0
  end

  factors
end
p factorize(12) == [1, 2, 3, 4, 6, 12]
p factorize(4) == [1, 2, 4]
p factorize(17) == [1, 17]