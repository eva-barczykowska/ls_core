require 'pry'
require 'pry-doc'
require 'pry-byebug'




# write a method that takes as argument an array of integers and returns
# a new array with the integers transformed. If the ingeter is divisible by 3,
# it should be replaced by 'Fizz', if it divisible by 5, by Buzz, and if it is
# divisible by both, it should be replaced by FizzBuzz. If it is not divisible
# by either 3 or 5, it should stay the same.


def fizzbuzz(arr)
  arr.map do |num|
    binding.pry
    if num % 5 == 0 && num % 3 == 0
      "FizzBuzz"
    elsif num % 5 == 0
      "Buzz"
    elsif num == 3
      "Fizz"
    else
      num
    end
  end
end

p fizzbuzz([1, 3, 5, 6, 8, 10, 3, 15, 9])
p fizzbuzz([1, 3, 5, 6, 8, 10, 3, 15, 9]) == [1, 'Fizz', 'Buzz', 7, 8, 'Fizz', 'FizzBuzz', 'Fizz']
