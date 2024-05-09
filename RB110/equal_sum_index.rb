# Problem 18
# Create a method that takes an array of integers as an argument. Determine and return the index N for which all numbers with an index less than N sum to the same value as the numbers with an index greater than N. If there is no index that would make this happen, return -1.
#
# If you are given an array with multiple answers, return the index with the smallest value.
#
# The sum of the numbers to the left of index 0 is 0. Likewise, the sum of the numbers to the right of the last element is 0.
#
# p equal_sum_index([1, 2, 4, 4, 2, 3, 2]) == 3
# p equal_sum_index([7, 99, 51, -48, 0, 4]) == 1
# p equal_sum_index([17, 20, 5, -60, 10, 25]) == 0
#
# The following test case could return 0 or 3. Since we're
# supposed to return the smallest correct index, the correct
# return value is 0.
# p equal_sum_index([0, 20, 10, -60, 5, 25]) == 0
#
# Problem
# ========
# -method takes an array of integers
# -integers can be negative
# -method determines the index N, for which all the number with an index less than N sum to the same value as the numbers with an index greater than n.
# -if there's no such index, return -1
# -if there is an array where multiple answers are possible, return the index with the smallest value
# -sum of numbers to the left is 0
# -sum of index to the right is 0
#
# Examples
# =========
# p equal_sum_index([1, 2, 4, 4, 2, 3, 2]) == 3
# at index 0 sum is LS 0 RS 17
# at index 1 sum is LS 1 RS 15
# at index 2 sum is LS 3 RS 11
# at index 3 sum is LS 7 RS 7
# at index 4 sum is LS 11 RS 5
# at index 5 sum is LS 13 RS 2
# at index 6 sum is LS 16 RS 0
#
# p equal_sum_index([7, 99, 51, -48, 0, 4]) == 1
# p equal_sum_index([17, 20, 5, -60, 10, 25]) == 0
#
# Algorithm
# ==========
# INIT `index` for tracking the index
#
# ITERATE over the arr argument
# -if index is 0, left size is 0
# -if index is -1, right size is 0
# -else
# -left sum is equal to a range from 0 to current index(excluding)
# -right sum is equal to a range from the next index to last index, -1
#
# at each index check if left sum == right sum
# --if this is the case RETURN `index`at which left_sum == rigtht_sum

def equal_sum_index(arr)
  left_sum = 0
  rigt_sum = 0
  index = 0
  while index < arr.size
    if index == 0
      left_sum = 0
      right_sum = arr[1..-1].sum
    elsif index == -1
      left_sum = arr[1..-2].sum
      right_sum = 0
    else
      left_sum = arr[0...index].sum
      right_sum = arr[index.next..-1].sum
    end
    return index if left_sum == right_sum

    index += 1
  end
  -1
end

p equal_sum_index([1, 2, 4, 4, 2, 3, 2]) == 3
p equal_sum_index([7, 99, 51, -48, 0, 4]) == 1
p equal_sum_index([17, 20, 5, -60, 10, 25]) == 0
