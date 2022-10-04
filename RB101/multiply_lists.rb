=begin
Multiply Lists
Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array
that contains the product of each pair of numbers from the arguments that have the same index. You may assume that
the arguments contain the same number of elements.

multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

PEDAC
Problem
-write a method that takes 2 array arguments
-the array arguments contain equal number of integers
-multiply the integer at index 0 from the first array with
 the integer at index 0 from the 2nd array
-do the same for each index of the arrays

Example
multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

Data structures
input: 2 arrays
output: 1 array containing products from the 2 input arrays

Algorithm
-iterate through both arrays and take integers at respective indexes
-eg. 3 * 9, 5 * 10, 7 * 11
-initialize the result array
-initialize a counter variable
-loop over the arrays using the counter to access the ingegers at the
consecutive indexes
-multiply those integers
-append the result to the result array

Code
=end

def multiply_list(arr1, arr2)
  result = []
  counter = 0
  while counter < arr2.size
    p "Iteration #{counter}"
    p "#{arr1[counter]} * #{arr2[counter]}"
    result << arr1[counter] * arr2[counter]
    counter += 1
  end
  result
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
