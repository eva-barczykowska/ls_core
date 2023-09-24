# A value is omnipresent if it exists in every subarray inside the main array.

# To illustrate:

# [[3, 4], [8, 3, 2], [3], [9, 3], [5, 3], [4, 3]]
# # 3 exists in every element inside this array, so is omnipresent.
# Create a function that determines whether an input value is omnipresent for a given array.

# Notes
# Sub-arrays can be any length.

# P:
#  - a value is called omnipresent if it exists in every subarray
#  - write a method that takes a nested array and a number
#  - and returns true/false based on whether that number is present in every array

# N:
# - all?

# A:
# - use enumerable

# - ask if if all subarays contain the 2nd arg

# - the method implicitly returns true of false

# Examples

def is_omnipresent(array, num)
  array.all? { |s| s.include?(num) }
end
p is_omnipresent([[1, 1], [1, 3], [5, 1], [6, 1]], 1) == true
p is_omnipresent([[1, 1], [1, 3], [5, 1], [6, 1]], 6) == false
p is_omnipresent([[5], [5], [5], [6, 5]], 5) == true
p is_omnipresent([[5], [5], [5], [6, 5]], 6) == false
