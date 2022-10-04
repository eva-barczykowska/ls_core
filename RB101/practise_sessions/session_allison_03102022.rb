# # Multiply Lists
# # Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array
# # that contains the product of each pair of numbers from the arguments that have the same index. You may assume that
# # the arguments contain the same number of elements.

# multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

# PEDAC
# Problem
# -write a method that takes 2 array arguments
# -the array arguments contain equal number of integers
# -multiply the integer at index 0 from the first array with
#  the integer at index 0 from the 2nd array
# -do the same for each index of the arrays

# Example
# multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

# Data structures
# input: 2 arrays
# output: 1 array containing products from the 2 input arrays

# Algorithm
# -iterate through both arrays and take integers at respective indexes
# -eg. 3 * 9, 5 * 10, 7 * 11
# -initialize the result array
# -initialize a counter variable
# -loop over the arrays using the counter to access the ingegers at the
# consecutive indexes
# -multiply those integers
# -append the result to the result array

def multiply_list(arr1, arr2)
  result = []
  counter = 0
  while counter < arr2.size
    result << arr1[counter] * arr2[counter]
    counter += 1
  end
  result
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

# Multiply All Pairs
# Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of every pair of numbers that can be formed between the elements of the two Arrays. The results should be sorted by increasing value.

# You may assume that neither argument is an empty Array.

# multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
# 2, 4
# 2, 3
# 2,1
# 2,2

# 4, 4
# 4, 3
# 4, 1
# 4, 2
# PEDAC
# Problem
# -write a method that takes 2 arrays, of same or different size
# -the method returns a new array
# -the array contains the product of each possible pair of numbers from both of the arrays (see above)
# -BUT the returned result array has to be sorted ascending

# Example
# multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
# 2, 4
# 2, 3
# 2,1
# 2,2

# 4, 4
# 4, 3
# 4, 1
# 4, 2

# Data structures
# input: 2 arrays of same/different size
# output: a new array with the products of each possible pair from the argument arrays

# Algorithm
# -initialize the result array
# initialize a counter1 variable - this is for the 1st array
# initialize a counter2 variable - this is for the 2nd array
# -take the first element of the 1st array and multiply it in turn  all the elements from the 2nd array
# -take the following (2nd) element from the 1st array and multiply it in turn with all the elements from the 2nd array
# -do this until you've reached the end of array 1
# -sort and return the result

# 2, 4
# 2, 3
# 2,1
# 2,2

# 4, 4
# 4, 3
# 4, 1
# 4, 2

# Code - my take
def multiply_all_pairs(arr1, arr2)
  result = []
  arr1.each do |num1|
    arr2.each do |num2|
      result << num1 * num2
    end
  end
  result.sort
end

puts ""

def multiply_all_pairs(arr1, arr2)
  result = []
  counter1 = 0 # we define both counters here but then we need to reset the value of counter 2!
  counter2 = 0
  while counter1 < arr1.size # 1st while loop, look at the condition
    counter2 = 0 # Reset the inner loop index coz on the next iteration (when I do multiply all the numbers from the 2nd array by 4, I need to start from 0, duh!)
    p "iteration #{counter1}"
    while counter2 < arr2.size # 2nd while loop, look at the condition
      p "#{counter1}, #{counter2}"
      result << arr1[counter1] * arr2[counter2]
      counter2 += 1
      # 0, 1, 2, 3, 4 # indices accessed
    end
    puts ''
    counter1 += 1 # increasing the counter for the first array
  end
  result.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
# p multiply_all_pairs([4, 3, 1, 2], [2, 4]) == [2, 4, 4, 6, 8, 8, 12, 16]
