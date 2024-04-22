# Given a grid of values represented by an array of arrays, e.g.:
# [1, 2, 3],
# [4, 5, 6],
# [7, 8, 9]
#
# Return the largest sum of a column of values in the grid.
# In this example, the largest sum is 18.
#
# a = [[1, 2, 3],
#     [4, 5, 6],
#     [7, 8, 9]]
#
# largest_column(a) == 18
#
# b = [[1, 2, 3, 4],
#     [5, 6, 7, 8]]
#
# largest_column(b) == 12
#
# c = [[1, 0, 0],
#      [5, 8, 10],
#      [3, 5, 1]]
#
# largest_column(c) == 13

# PROBLEM

# return the largest sum of a *column* in the grid
# Input: array of integers
# assumption all ints positive
# Output: single integer, (product of 3 integers)
# Assume an nxn array (square)

# go from array, to sum (int), final output: Integer

# ALGO

# We are always working with the same subarray element
# Comparing integers
# integers represent the sum of specific subarray positions
# [0, 0], [1, 0], .. [n, 0]
# Iterate over the given Array
# value = 0
# value = value + first subarray, first element
# second subarray, first element
# third subarray, first element

# Iterate over the given array the same number of times as the size of the given array. columns
# initialize an empty collection, where we are storing the running total of each iteration over the given array
# Iterate over the given Array for each column position
# value = 0
# value = value + first subarray, first element
# second subarray, first element
# third subarray, first element
# place that running total in the collection
# return the maximum value of that Array

# totals = []]
# outer_array with indices |outer, o|
# sum = 0
# innter_rray |inner, i|
# sum += inner[o]
# totals << sum

# CODE

# def largest_column(arr)
#   column_total = []
#   arr.each_with_index do |subarray, i|
#     running_total = 0
#     running_total += subarray[i]

# a = [[1, 2, 3],
#     [4, 5, 6],
#     [7, 8, 9]]

# adrienne

# edward
# Algorithm
# =begin
# - take input arrays and iterate through the first one
#   - for the first one make a new array of arrays that contain each element of the first array as the first elements of the new array
#   - for the remaining arrays iterate through them and add the elements to the new subarrays
#   - iterate through the return array and find the largest sum
# def largest_column(array)
#   columns = []
#   array.each_with_index do |row, row_index|
#     row.each_with_index do |element, element_index|
#       if row_index == 0
#        columns << [element]
#       else
#        columns[element_index] << element
#       end
#     end
#   end
#
#   sums = columns.map do |column|
#     column.sum
#   end
#   sums.max
# end

# ewa
# Problem:
# -return the largest sum of COLUMN values in the grid
# Examples
# =>
#
# ALgorithm
# ==========
# PLAN A
# ==========
# GET the inner array size - 1, these are the indices for my hash keys

# -INITIALIZE `all_sums` hash, index/column is a key in the hash, sum is a value
# 1=>sum update this as you iterate

# -ITERATE over the nested array
# --ITERATE with index over each subaaray inside the nested_array
# --if the index is in the `all_sums` hash as a key, increase the value for that index

# -RETURN the greatest value from the hash
#
# -RETURN the greatest
# look at the columns like this:
# [0][0]
# [1][0]
# [2][0]
# [3][0] -- sum all the numbers found like this
# the first number is the counter from 0 to array size - 1, second counter is always the same until we increase it an the end of this OUTER iteration
# use array counter and element counter
#========
# def largest_column(nested_array)
#   size = nested_array.first.size
#   all_sums = (0...size).each_with_object({}) { |index, hash| hash[index] = 0 }

#   nested_array.each do |subarray|
#     subarray.each.with_index do |element, index|
#       all_sums[index] += element if all_sums.key?(index)
#     end
#   end

#   all_sums.values.max
# end
# a = [[1, 2, 3],
#      [4, 5, 6],
#      [7, 8, 9]]

# p largest_column(a) == 18

# b = [[1, 2, 3, 4],
#      [5, 6, 7, 8]]

# p largest_column(b) == 12

# c = [[1, 0, 0],
#      [5, 8, 10],
#      [3, 5, 1]]

# p largest_column(c) == 13
# # PLAN B
#========
# -iterate through all the arrays - get fist elements, sum them, shift
# -do this until arrays are empty
# -which is the gereatsest sum?-get indices g
#
# def largest_column(arr)
#   indices = (0...arr.size).to_a
#   hash = {}
#
#   arr.each do |subarray|
#     indices.each do |index|
#       if !hash.key?(index)
#         hash[index] = 0
#       else
#         hash[index] += subarray[index]
#       end
#     end
#   end
#
#   hash
# end
#
# a = [[1, 2, 3],
#      [4, 5, 6],
#      [7, 8, 9]]
#
# p largest_column(a) #== 18
#
# b = [[1, 2, 3, 4],
#     [5, 6, 7, 8]]
#
# largest_column(b) == 12
#
# c = [[1, 0, 0],
#      [5, 8, 10],
#      [3, 5, 1]]
#
# largest_column(c) == 13

# udeshika
#
# Algo:
# - create largest_sum variable to store largest sum
# - iterate over to  get column index -->column index is statring from 0 and ending from
#   (size of sub array -1 )
# - for each column index it should be iterate over the array to access 0th index of every sub array
# i.e. this should itearte with index to acess all sub_arrays once
# a = [[1, 2, 3],
#     [4, 5, 6],
#     [7, 8, 9]]
#     should take - [1,4,7]
#     i.e a[0][0],a[1][0],a[2][0]
# -create an empty array to store all column numbers to it (current array)
# - take each sub array (iterate over each index)
# - find 0th index of all arrays and append to current array
# -if current array sum  > largest sum --> reassign largest sum to current array sum
# -return largest sum
# =e
def largest_column(arr)
  largest_sum = 0
  (0...arr[0].size).each do |column_index|
    current_array = []
    (0..arr.size - 1).each do |index|
      current_array << arr[index][column_index]
    end
    largest_sum = current_array.sum if largest_sum < current_array.sum
  end
  largest_sum
end

a = [[1, 2, 3],
     [4, 5, 6],
     [7, 8, 9]]
p largest_column(a) == 18

b = [[1, 2, 3, 4],
     [5, 6, 7, 8]]
p largest_column(b) == 12

c = [[1, 0, 0],
     [5, 8, 10],
     [3, 5, 1]]
p largest_column(c) == 13

# Interesting erroneous code
def largest_column(nested_array)
  all_sums = # no good coz I need indices from the inner array!!!!
    (0...nested_array.size).to_a.each_with_object({}) do |num, hash|
      hash[num] = 0
    end
  p all_sums

  nested_array.each.with_index do |subarray, index|
    p subarray[index] # prints 1(element at index 0 in the first array) and 6(element at index 2 in the 2nd array) -- maybe write a problem that requires that? index_hopping
  end
end
# a = [[1, 2, 3],
#      [4, 5, 6],
#      [7, 8, 9]]
# p largest_column(a) == 18

b = [[1, 2, 3, 4],
     [5, 6, 7, 8]]
p largest_column(b) == 12

# c = [[1, 0, 0],
#      [5, 8, 10],
#      [3, 5, 1]]
# p largest_column(c) == 13

def largest_column(nested_array)
  all_sums = (0...nested_array.size).to_a.each_with_object({}) { |num, hash| hash[num] = 0 }

  nested_array.each do |subarray|
    subarray.each.with_index do |element, index| # we need to iterate over index OF THE INNER ARRAY, not outer
      all_sums[index] += element if all_sums.include?(index)
    end
  end

  all_sums.max
end

a = [[1, 2, 3],
     [4, 5, 6],
     [7, 8, 9]]
p largest_column(a) #== 18
