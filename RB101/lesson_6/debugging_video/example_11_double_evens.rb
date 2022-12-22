require 'pry'
require 'pry-doc'
require 'pry-byebug'

# write a method that takes an input an array of integers and returns a new array
# with the even integers doubled

def double_num(num)
  binding.pry
  num + 2
end

def double_evens(arr)
  arr.map do |num|
   binding.pry
    new_num = num.even? ? double_num(num) : num
  end
end

p double_evens([6, 8, 3, 4, 5]) == [1, 4, 3, 8, 5]
