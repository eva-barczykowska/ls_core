# Given an array and an integer n, return the sum of the first n numbers in the array.

# sum_first_n_nums([9, 8, 7, 6], 3) == 24
# The parameter n is specified as 3.
# The first 3 numbers in the list are 9, 8 and 7.
# The sum of these 3 numbers is 24 (9 + 8 + 7).
# Return the answer.
#
# Notes
# If n is larger than the length of the array, return the sum of the whole array.
#
# P:
# - write a method that takes 2 arguments, an array and a number
# - the number signifies how many items from the array I need to take
# - if the number is greater than the array size, the method returns sum of all the elements of the array
# - if the number is less or equal to the size of the array, the method returns sum of n elements
#
# N: take, sum
#
def slice_sum(array, n)
  return array.sum if n > array.size

  array.take(n).sum
end
p slice_sum([1, 3, 2], 2) == 4

p slice_sum([4, 2, 5, 7], 4) == 18

p slice_sum([3, 6, 2], 0) == 0