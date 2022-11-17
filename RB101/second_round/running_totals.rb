# Running Totals
# Write a method that takes an Array of numbers, and returns an Array with the
# same number of elements, and each element has the running total from the original Array.


# PEDAC
# Problem
# -write a method that takes an Array of numbers as an argument
# -the method will return an array of numbers as well, of the size size as the argument
# -each element in the returned array will have the running total from the original array
#
# Examples
# running_total([2, 5, 13]) == [2, 7, 20]
# 2+5 is 7 and 7+13 is 20 but that's only 2 numbers, what about the 1st number, 2?
# 2 or the first number always stays the same
# running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
# so.. 14, 14+11=25, 25+7=32, 32+15=47, 47+20=67]
# running_total([3]) == [3]
# if the argument array contains only 1 elelement, we return the argument array (there's nothing to add)
# running_total([]) == []
# if argument array is empty, we return an empty array (there is nothing to add)
# Data Structures
# input: array
# output: array
#
# ALGORITHM
# -transform the argument array into a new one, which will contain the running totals for each number
# -the first number stays as it is
# -initiliaze sum to 0, because this is where we start, we need the first number stay the same and we can achive it by adding 0 to it
# -iterate through the array and each time add a new number to the sum, while iterating so it will be
# -with this array as an argument [2, 5, 13]
#  -take 2 and add it to 0 -now our running total is 2 -add 2 to the result array
#  -take 5 and add it to 2 -now our running total is 7 -add 7 to the result array
#  -take 13 and add it to 7 - now our running total is 20 -add 20 to the result array
#
#  return the array with the running totals

require 'pry'
require 'pry-doc'
require 'pry-byebug'
# Code
def running_total(array)
  return [] if array.empty?
  result = []
  sum = 0
  index = 0
  loop do
    # binding.pry
    result << sum += array[index] #array[0], which is 2, then array[1], which is 7 and array[2], which is 20 --- that is 3 iterations
    # p "sum is #{sum}"
    index += 1

    break if index == array.size #break when you've done the job when the index == 3, break if index > array.size to get the nil Error
  end
  result
end
p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []
