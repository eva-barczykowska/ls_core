require 'pry'
# require 'pry-byebug'

# write a method that takes an array of integers as an argument
# and returns a new array with the integers transformed.
# If the integer is divisible by 3, it should be replaced by 'Fizz',
# if the integer is divisible by 5, it should be replaced by 'Buzz',
# if the integer is divisible by both 3 and 5, it should be replaced by 'FizzBuzz'.
# If it is divisible by neither, it should remain as it is.

# def fizzbuzz(arr)
#   arr.map do |num|
#     binding.pry
#     if num % 5 == 0 && num % 3 == 0
#       'FizzBuzz'
#     elsif num % 5 == 0
#       'Buzz'
#     elsif num == 3
#       'Fizz'
#     else
#       num
#     end
#   end
# end
#
# p fizzbuzz([1, 3, 5, 6, 7, 8, 10, 3, 15, 9]) #== [1, 'Fizz', 'Buzz', 'Fizz', 7, 8, 'Buzz', 'Fizz', 'FizzBuzz', 'Fizz']

puts

# corrected:

def fizzbuzz(arr)
  arr.map do |num|
    binding.pry
    if num % 5 == 0 && num % 3 == 0
      'FizzBuzz'
    elsif num % 5 == 0
      'Buzz'
    elsif num % 3
      'Fizz'
    else
      num
    end
  end
end

p fizzbuzz([1, 3, 5, 6, 7, 8, 10, 3, 15, 9]) #== [1, 'Fizz', 'Buzz', 'Fizz', 7, 8, 'Buzz', 'Fizz', 'FizzBuzz', 'Fizz']
