# Write a method that takes an Array of numbers, and returns an Array with
# the same number of elements, and each element has the running total from
# the original Array.

# Explicit requirements:
# -a method that takes an array
# -returns an array
# -that array that is returned has the same number of elements and each element
#  has the running total from the original array
#
#  Data structures:
#  Input: array
#  Output: array
#
#  Algorithm:
# -build a new result array into which you add
# -first element of the array argument
# -then the subsequent sum of current element(starting with the first)
#  and next
# -when elements are finished, also add the sum of all elements from the 1st array

running_total([2, 5, 13]) == [2, 7, 20]
running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
running_total([3]) == [3]
running_total([]) == []
