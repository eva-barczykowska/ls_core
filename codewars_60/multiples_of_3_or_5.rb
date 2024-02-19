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

puts
=begin
[Train: Multiples of 3 or 5 \| Codewars](https://www.codewars.com/kata/514b92a657cdc65150000006/train/ruby)
6 kyu
If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Finish the solution so that it returns the sum of all the multiples of 3 or 5 below the number passed in.

Note: If the number is a multiple of both 3 and 5, only count it once.
=end
=begin

- PROBLEM
  - Input: a number
  - Output: a number

  - Rules:
    - what is the natural number???????
      - the natural numbers are the numbers 1, 2, 3, etc., possibly including 0 as well.
    - count all multiples of 3 or 5 till the number (exclusive)
    - calculate the sum of numbers divisible by 3 or 5 up to the number(exclusive)
    - if a number is evenly divisible by both 3 and 5, count it only ONCE

- EXAMPLE
p solution(10) == 23
3, 5, 6, 9 => 23

p solution(20) == 78
=> 3, 5, 6, 9, 10, 12, 15, 18 = 78

p solution(200) == 9168

- DATA STRUCTURE,
  - input: int
  - middle: range/array
  - output: int

- ALGORITHM
- initialize `numbers`

  - create a range of numbers from 1 to arg (exclusive)
  - iterate and if number divisible by both 3 and 5, add it to `result`
  -else number is divisible by 5, add it to result
  -esleif num divisible by 3 add it to result

  - sum the numbers in `result`
=end

def solution(num)
  numbers = []
  (1...num).each do |num|
    numbers << num
  end

  result = []

  numbers.each do |number|
    if number % 3 == 0 && number % 5 == 0
      result << number
    elsif number % 5 == 0
      result << number
    elsif number % 3 == 0
      result << number
    end
  end

  result.sum
end
p solution(10) == 23
p solution(20) == 78
p solution(200) == 9168

# ALGORITHM
# - create an array to hold all of the multiple number
# - create a range of number from 3 upto given number
# - select uniqe numbers that are multiple of 3 or 5
# - return the sum of those numbers

def solution(number)
  sum = []

  3.upto(number - 1) do |num| #smart!
    case
    when num % 3 == 0 && num % 5 == 0
      sum << num
    when num % 3 == 0
      sum << num
    when num % 5 == 0
      sum << num
    end
  end

  sum.sum
end

p solution(10) == 23
p solution(20) == 78
p solution(200) == 9168

