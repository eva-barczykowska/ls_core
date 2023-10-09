=begin
Create a function that takes an array of numbers and returns the second largest number.

secondLargest([10, 40, 30, 20, 50]) ➞ 40
-40 because it's 2nd largest, the largest is 50

secondLargest([25, 143, 89, 13, 105]) ➞ 105
-40 because it's 2nd largest, the largest is 143

secondLargest([54, 23, 11, 17, 10]) ➞ 23
-40 because it's 2nd largest, the largest is 54

Notes:
-sort

DS:
input: an array of integers
output: 2nd largest number from those integers

A:
- sort the arg array

- return the second last number from the sorted array
=end

def second_largest(arr)
  arr.sort[-2]
end

p second_largest([10, 40, 30, 20, 50]) == 40
p second_largest([25, 143, 89, 13, 105]) == 105
p second_largest([54, 23, 11, 17, 10]) == 23