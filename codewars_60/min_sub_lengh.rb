#  Given an array of n positive integers and a positive integer, find the minimal length of a contiguous subarray for which the sum >= integer.
#
# P:
# - method takes array of positive integers
# - method returns the min length of a contiguous subarray equal or greater than integer(2nd arg)
# - do subarray of length 1 counts?
# - is it possible that I won't have such subarray?
#
# E:
# p minSubLength([2, 3, 1, 2, 4, 3], 7) == 2
# =>
# 2 3 => 5
# 2 3 1 => 6
# 2 3 1 2 => 8
# 2 3 1 2 4 =>
# 2 3 1 2 4 3 => => 7 was not there so that means I need to start from 2nd element of arg arr
# - 3 1=4
# - 3 1 2=6
# - 3 1 2 4
# - 3 1 2 4 3
# ----1 2=3
# ----1 2 4 =7 *********
# ----1 2 4 3
# ------2 4=6
# ------2 4 3
# --------4 3 **********. => 7 is the MINUMUM LENGTH
#
#
# p minSubLength([1, 10, 5, 2, 7], 9) == 1
# p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
# p minSubLength([1, 2, 4], 8) == 0
# => it's not possible so answer is 0
#
# A:
# -INIT all_subarrays
# -CREATE subarrays
# --start from index 0 until last but one index, retrieve - starting index
# --start from starting index until last index -- ending index
# --retrive a subarray, a range of indices from st. to end
# --save this subarray to all_subarrays but only if their sum == target
#
# -RETURN the array whose size is smallest
def minSubLength(arr, target)
  return 0 if arr.sum < target

  all_subarrays = []

  (0...arr.size).each do |starting_index|
    (starting_index...arr.size).each do |ending_index|
      subarray = arr[starting_index..ending_index]
      all_subarrays << subarray # why it doesn't work when I define here if subarray.sum >= target
    end
  end

  all_subarrays.reject! { |s| s.sum < target }.sort_by(&:size).first.size
end
p minSubLength([2, 3, 1, 2, 4, 3], 7) == 2
p minSubLength([1, 10, 5, 2, 7], 9) == 1
p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
p minSubLength([1, 2, 4], 8) == 0

# didn't analyze all the examples, arrays of 1 element are also considered!!!
