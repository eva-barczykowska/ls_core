# Task
# Given an array of integers, remove the smallest value. Do not mutate the original array/list. If there are multiple elements with the same value, remove the one with the lowest index. If you get an empty array/list, return an empty array/list.

# Don't change the order of the elements that are left.

# Problem
# =========
# -method takes an array of numbers
# -method needs to find and remove the smallest one
# -if multiple values are smallest, remove the first value/value with the lowest index
# -if array arg is empty, return []
# -do not mutate the original array
# -do not change order of the numbers that are left

# Examples
# ===========
# * Input: [1,2,3,4,5] == [2,3,4,5]
# => 1 removed
# * Input: [5,3,2,1,4] == [5,3,2,4]
# => 1 removed
# * Input: [2,2,1,2,1] == [2,2,2,1]
# =>first 1 is removed

# ALGOrithm
# =========
# -find min from the array
# -find index of min
# -copy array
# -delete at the found index the mininum element

def remove_smallest(arr)
  return [] if arr.empty?

  value_to_delete = arr.min
  target_index = arr.index(value_to_delete)

  copy = arr.dup
  copy.delete_at(target_index)
  copy
end
p remove_smallest([1, 2, 3, 4, 5]) == [2, 3, 4, 5]
p remove_smallest([5, 3, 2, 1, 4]) == [5, 3, 2, 4]
p remove_smallest([2, 2, 1, 2, 1]) == [2, 2, 2, 1]
