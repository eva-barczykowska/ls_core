# Problem:
# You're given a nested array. Write a method that returns the sum of consecutive numbers taken from consecutive arrays. Arrays can be of different sizes. If an array is to short and doesn't have the number that should be taken to form the sum, assume the number is a zero.
#
# P:
# - method takes a nested array of integers
# - method returns a sum of elements at consecutive indices in consecutive inner arrays
# - so element at index 0 from 1st array, element at index 1 from 2nd array, etc.
#
# E:
# a = [[1, 2, 3],[4, 5, 6],[7, 8, 9]] # =>1 + 5 + 9 = 15
# p get_sum_of_elements(a) == 15
#
# b = [[1, 2, 3, 4],[2], [5, 6, 7, 8]] # =>2 + 0 + 9
# p largest_column(b) == 9
#
# c = [[1, 0, 0],[5, 8, 10], [3, 5, 1], [3, 5, 1], [3, 5, 1]] #=> 1 + 8 + 1 + 0 + 0 = 10
# p largest_column(c) == 10
#
# d = [[1, 0, 0],[5, 8, 10], [3, 5, 1], [3, 5, 1, 10], [3, 5, 1, 4, 4]] #=> 1 + 8 + 1 + 10 + 4 = 24
# p largest_column(c) == 24
#
# DS:
# input: nested array of integers
# output: integer representing the sum of consecutive numbers in consecutive arrays
#
# A:
# -CALCULATE the size of the array argument
#
# -CREATE a range from 0 to the `size` minus 1
#
# -USE the range as `indices` to
# -ITERATE over the arg array and
# -EXTRACT at each iteration the number at a consecutive index from the consecutive nested array
# --if the index doesn't exist, add zero to the array
# --else
# --ADD these numbers to `sum` array
#
# -RETURN sum of these numbers

def get_sum_of_elements(nested_array)
  size = nested_array.size
  indices = (0...nested_array.size).to_a

  sum = []

  nested_array.each_with_index do |array, index|
    sum << if array[index].nil?
             0
           else
             array[index]
           end
  end

  sum.sum
end
a = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
p get_sum_of_elements(a) == 15

b = [[1, 2, 3, 4], [2], [5, 6, 7, 8]]
p get_sum_of_elements(b) == 8

c = [[1, 0, 0], [5, 8, 10], [3, 5, 1], [3, 5, 1], [3, 5, 1]]
p get_sum_of_elements(c) == 10

d = [[1, 0, 0], [5, 8, 10], [3, 5, 1], [3, 5, 1, 10], [3, 5, 1, 4, 4]]
p get_sum_of_elements(d) == 24
