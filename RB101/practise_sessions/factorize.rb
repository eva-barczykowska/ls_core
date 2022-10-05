=begin
Create a function that takes a number as its argument and returns an array of all its factors.

Examples
factorize(12) ➞ [1, 2, 3, 4, 6, 12]

factorize(4) ➞ [1, 2, 4]

factorize(17) ➞ [1, 17]
Notes
The input integer will be positive.
A factor is a number that evenly divides into another number without
leaving a remainder. The second example is a factor of 12, because 12 / 2 = 6, with remainder 0.

PEDAC
Problem
-write a method that takes a number as its argument
-the method returns an array of all its factors
-a factor is a divisor of an integer n
-e.g. the factors of 12 are 1, 2, 3, 4, 6, 12
-the input integer will be positive

Examples
factorize(12) ➞ [1, 2, 3, 4, 6, 12]
factorize(4) ➞ [1, 2, 4]
factorize(17) ➞ [1, 17]

Data Structures
-input: integer
-output: array of factors of the integer (integer's divisors)

Algorithm
-define the result array
-iterate through all the numbers until the argument number
-and check if the argument number is evenly divisible by each of them
-if yes, add it to the result array

Code
=end

def factorize(number)
  result = []
  (1..number).to_a.each do |num|
    if number % num == 0
      result << num
    end
  end
  result
end

p factorize(12) == [1, 2, 3, 4, 6, 12]
p factorize(4) == [1, 2, 4]
p factorize(17) == [1, 17]

puts ""

# refactor, make it shorter
def factorize(number)
  result = []
  (1..number).to_a.each{|num| result << num if number % num == 0 }
  result
end

p factorize(12) == [1, 2, 3, 4, 6, 12]
p factorize(4) == [1, 2, 4]
p factorize(17) == [1, 17]
