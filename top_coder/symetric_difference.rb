# Find the Symmetric Difference
#
# ---
#
# The mathematical term symmetric difference (`△` or `⊕`) of two sets is the set of elements which are in either of the two sets but not in both. For example, for sets `A = {1, 2, 3}` and `B = {2, 3, 4}`, `A △ B = {1, 4}`.
#
# Symmetric difference is a binary operation, which means it operates on only two elements. So to evaluate an expression involving symmetric differences among _three_ elements (`A △ B △ C`), you must complete one operation at a time. Thus, for sets `A` and `B` above, and `C = {2, 3}`, `A △ B △ C = (A △ B) △ C = {1, 4} △ {2, 3} = {1, 2, 3, 4}`.
#
#
# Create a function that takes two or more arrays and returns an array of their symmetric difference. The returned array must contain only unique values (_no duplicates_).
# Problem
# ========
# -method takes 2 or more arrays
# -method returns SYMETRIC DIFFERENCE
# -SYMETRIC DIFFERENCE: elements that are in either array but not all of them
#
# Examples
# =========
# sym([1, 2, 3], [5, 2, 1, 4]) == [3, 4, 5]
# => 3, 4, 5
# sym([1, 2, 3, 3], [5, 2, 1, 4]) == [3, 4, 5]
# => 3, 4, 5
# sym([1, 2, 3], [5, 2, 1, 4, 5]) == [3, 4, 5]
# => 3, 4, 5
# sym([1, 2, 5], [2, 3, 5], [3, 4, 5]) == [1, 4, 5]
# =>
# sym([1, 1, 2, 5], [2, 2, 3, 5], [3, 4, 5, 5]) should return [1, 4, 5]
# `A △ B △ C = (A △ B) △ C = {1, 4} △ {2, 3} = {1, 2, 3, 4}
# first do operation on first and second array, and then on third
# Do I need to compare arrays 1 by 1 after the first 2???
# [1, 1, 2, 5], [2, 2, 3, 5] => [1, 3], [3, 4, 5, 5] => [1, 4, 5]
#
# sym([3, 3, 3, 2, 5], [2, 1, 5, 7], [3, 4, 6, 6], [1, 2, 3]) == [2, 3, 4, 6, 7]
# ([3, 3, 3, 2, 5], [2, 1, 5, 7] => [3, 1, 7], [3, 4, 6, 6] => [1, 7, 4, 6], [1, 2, 3] => [7, 4, 6, 2, 3]
# => sorted!
#
# sym([3, 3, 3, 2, 5], [2, 1, 5, 7], [3, 4, 6, 6], [1, 2, 3], [5, 3, 9, 8], [1]) == [1, 2, 4, 5, 6, 7, 8, 9]
# [3, 3, 3, 2, 5], [2, 1, 5, 7] => [3, 1, 7], [3, 4, 6, 6] => [1, 7, 4, 6], [1, 2, 3]=> [7, 4, 6, 2, 3], [1]
# => [1, 7, 4, 6, 2, 3]
#
# Notes
# -helper method to compare 2 arrays?
# -sorted!
# [1, 2, 3].difference([5, 2, 1, 4])
# [5, 2, 1, 4].difference([1, 2,3])
#
# Algorithm
# ==========
# helper method comparing 2 arrays
# -return number that are in either but not in both
# -calculate the difference between a and b
# -calculate the difference between b and a
# -save results from both and return as a sorted array
#
# main method
# ITERATE over the array argument
# call the helper method
# use the return value from the helper method
# -moving by 1 array until no more arrays are left
# -when there are no more arrays left
# -RETURN the result but only uniq elements
#
# -if my arg size == 2,
# -I just call the helper method once and return result
# -if my arg size > 2
# -pop the first 2 arrays
# --call my helper method on the first 2 arrays
# --save the result to current_left
# INIT counter to 2
# until the array argument is an empty array
# ITERATE through the arg array and take 1array pop it)
# call the helper method with the value that current_left has and the popped array
# resave the result to current_left
# -take the following array from the arr argument
# -break if there are no more arrays
#
# --RETURN the return value from the helper

def get_symetric_difference(arr1, arr2)
  symetric_diff = []
  symetric_diff << arr1.difference(arr2)
  symetric_diff << arr2.difference(arr1)
  symetric_diff.flatten.sort.uniq
end

# arr1 = [1, 2, 3]
# arr2 = [5, 2, 1, 4]
# p get_symetric_difference(arr1, arr2)

def sym(arr)
  return get_symetric_difference(arr[0], arr[1]) if arr.size == 2

  arr1 = arr.shift
  arr2 = arr.shift
  current_left = get_symetric_difference(arr1, arr2)

  counter = 2
  while arr != []
    current_right = arr.shift
    current_left = get_symetric_difference(current_left, current_right)
  end
  current_left
end
arr = [[1, 2, 3], [5, 2, 1, 4]]
p sym(arr) == [3, 4, 5]

arr = [[1, 2, 3, 3], [5, 2, 1, 4]]
p sym(arr) == [3, 4, 5]

arr = [[1, 2, 3], [5, 2, 1, 4, 5]]
p sym(arr) == [3, 4, 5]

arr = [1, 2, 5], [2, 3, 5], [3, 4, 5]
p sym(arr) == [1, 4, 5]

arr = [[3, 3, 3, 2, 5], [2, 1, 5, 7], [3, 4, 6, 6], [1, 2, 3]]
p sym(arr) == [2, 3, 4, 6, 7]

arr = [[3, 3, 3, 2, 5], [2, 1, 5, 7], [3, 4, 6, 6], [1, 2, 3], [5, 3, 9, 8], [1]]
p sym(arr) == [1, 2, 4, 5, 6, 7, 8, 9]
