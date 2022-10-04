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

puts ""

# ls solution
def multiply_list(list_1, list_2)
  products = []
  list_1.each_with_index do |item, index|
    p "Item from list_1 is #{item}, index from list_2 is #{index} and item at this index position from list_2 is #{list_2[index]}"
    products << item * list_2[index]
  end
  products
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

puts ""

# other solutions
def multiply_list(arr1, arr2)
  multiplied_arr = []

  index = 0
  loop do
    curr_val1 = arr1[index]
    curr_val2 = arr2[index]
    multiplied_arr << curr_val1 * curr_val2
    index += 1
    break if index == arr1.size
  end

  multiplied_arr
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

puts ""

def multiply_list(arr1, arr2)
  result = []
  arr1.each_index { |index| result << arr1[index] * arr2[index] }
  result
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

puts ""

def multiply_list(arr1, arr2)
  arr3 = []
  counter = 0
  loop do
    arr3 << arr1[counter] * arr2[counter]
    counter += 1
    break if counter == arr1.size
  end
  arr3
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

# Further Exploration
# The Array#zip method can be used to produce an extremely compact solution
# to this method. Read the documentation for zip, and see if you can come up
# with a one line solution (not counting the def and end lines).

def multiply_list(arr1, arr2)
  arr1.zip(arr2).map { |array| array[0] * array[1] }
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

puts ""

def multiply_list(arr1, arr2)
  arr1.zip(arr2).map { |pairs| pairs.inject(:*) }
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
