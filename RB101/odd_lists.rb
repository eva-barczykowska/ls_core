# Write a method that returns an Array that contains every other element of
# an Array that is passed in as an argument. The values in the returned list
# should be those values that are in the 1st, 3rd, 5th, and so on elements of the
# argument Array.
#
# Explicit requirements:
# Given an array that is passed as an argument to a method, write a method that
# returns every other element of an array that was passed as an argument.

# Data structure:
# input: array
# output: array with odd elements of the array that was passed as an argument

# Algorithm:
# - iterate through the array argument
# - if the index of the element is even, add it the resut
# - odd elements will be left
# - return the result

def oddities(arr)
  res = []
  arr.each_with_index do |element, index|
    if index.even?
      res << element
    end
  end
 res
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
