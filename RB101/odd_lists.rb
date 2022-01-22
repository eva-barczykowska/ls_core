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

# ls solution:
def oddities(array)
  odd_elements = []
  index = 0
  while index < array.size
    odd_elements << array[index]
    index += 2
  end
  odd_elements
end

# Further Exploration
# Write a companion method that returns the 2nd, 4th, 6th, and so on elements
# of an array.
# Try to solve this exercise in at least 2 additional ways.

def oddities(arr)
  res = []
  arr.each_with_index do |element, index|
    if index.odd?
      res << element
    end
  end
  res
end

p oddities([2, 3, 4, 5, 6]) == [3, 5]
p oddities([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities(['abc', 'def']) == ['def']
p oddities([123]) == []
p oddities([]) == []

def oddities(arr)
  arr.select.with_index { |element| arr.index(element).even? }
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []

### Further Exploration
# 1)
def oddities(array)
  array.delete_if { |ele| array.index(ele).odd? }
end

# 2)
def oddities(array)
  array.keep_if { |ele| array.index(ele).even? }
end
