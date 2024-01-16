=begin
If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Finish the solution so that it returns the sum of all the multiples of 3 or 5 below the number passed in.

Additionally, if the number is negative, return 0.

Note: If the number is a multiple of both 3 and 5, only count it once.

PEDAC
P:
- write a method
- if we list all the natural numbers below 10 that are multiples of 3 or 5 we get 3, 5, 6, 9.
- the sum of these multiples is 23

- the method has to return the sum of all the multiples of 3 or 15 below the number passed in as a argument
- if the input number is negative, return 0
- if the number is a multiple of both 3 and 5 (like e.g. 15), only count it once

DS:
input: number until which to count (excluding)
middle: array
output: sum of all the numbers/multiples of 3 and 5

A:
- loop through numbers until the input number and if a number is evenly divisible by 3 or 5, add it to the array

- sum the array and return the sum
=end

def get_multiples_sum(number)
  return 0 if number.negative?
  result = []

  counter = 1
  loop do
    break if counter > number - 1
    result << counter if counter % 3 == 0 or counter % 5 == 0
    counter += 1
  end
  result.sum
end

p get_multiples_sum(10) == 23
# => 3, 5, 6, 9
p get_multiples_sum(-55) == 0

