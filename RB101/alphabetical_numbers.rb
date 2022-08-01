# Alphabetical Numbers
# Write a method that takes an Array of Integers between 0 and 19, and returns
# an Array of those Integers sorted based on the English words for each number:
#
# zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve,
# thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen


PEDAC
-write a method that takes an Array of Integers between 0 and 19
-the method returns an Array of Integers sorted based on the English words for each number
- when it's 0 it's 8

Examples
alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0

Data Structures
input: an array of Integers
output: an array of Integers

Algorithm

Examples:

alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]
