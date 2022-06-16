
# write a method that takes as an argument an array of integers and returns a new
# array with the even numbers doubled

require 'pry'
require 'pry-doc'
require 'pry-byebug'

def double_num(num)
  num + 2
  # binding.pry here changes execution as calling pry on binding returns nill so result would be [1, nil, 3, nil, 5]
end

def double_evens(arr)
  binding.pry
  arr.map do |num|
    new_num = num.even? ? double_num(num) : num
  end
end

p double_evens([1, 2, 3, 4, 5])
p double_evens([1, 2, 3, 4, 5]) == [1, 4, 3, 8, 5]

#be careful where you call binding.pry because it can change the result of the method
