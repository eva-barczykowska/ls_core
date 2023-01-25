=begin
Odd Lists
Write a method that returns an Array that contains every other element of an
Array that is passed in as an argument. The values in the returned list should be
those values that are in the 1st, 3rd, 5th, and so on elements of the argument
Array.

oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
oddities(['abc', 'def']) == ['abc']
oddities([123]) == [123]
oddities([]) == []
oddities([1, 2, 3, 4, 1]) == [1, 3, 1]

PEDAC
Problem
-I have to write a method
-the method takes 1 argument, an array
-the method returns an array
-in the array that is returned we will have elements 1, 3, 5th etc from the argument array

Examples
p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
p oddities([1, 2, 3, 4, 1]) == [1, 3, 1]

Data structures
input: Array
output: Array

Algorithm
-initialize result variable to an empty array
-if the argument array is empty, we return the argument array
-if the argument array has 1 element, we return the argument array
-else
-initialize a counter
-iterate over the array
-pick elements at the counter 1 and add to the result array
-increase the counter by 2
-keep iterating and adding elements at the counter while the counter is less than the array size
-finally, return the result
=end
def oddities(array)
  result = []
  if array.empty?
    return array
  elsif array.size == 1
    return array
  else array.size > 1
    counter = 0
    while counter < array.size # or while counter <= array.size - 1
      result << array[counter]
      counter += 2
    end
  end
  result
end
p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
p oddities([1, 2, 3, 4, 1]) == [1, 3, 1]

puts

# another solution during practise with AJ
# Odd Lists
# Write a method that returns an Array that contains every other element of an Array that is passed in as an argument. The values in the returned list should be those values that are in the 1st, 3rd, 5th, and so on elements of the argument Array.

# PEDAC TEMPLATE

# ************** Problem **************
# -write a method that takes an array as an argument
# -the method returns an array with every other element of the original array
# -(starting from the first)
# -if array argument size is 1, return that array
# -if it's an empty array, return that array

# Questions:

# ************** Examples **************
# oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
# oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
# oddities(['abc', 'def']) == ['abc']
# oddities([123]) == [123]
# oddities([]) == []
# oddities([1, 2, 3, 4, 1]) == [1, 3, 1]

# ************** Data Structure **************
# input: array
# output: array

# ************** Algorithm **************
# # -if array argument size is 1, return that array
# # -if it's an empty array, return that array
# ---do I need to take care of these 2 above separately?
# -initialize the `result` array
# -iterate over the argument array and its index
# -if the index is odd, add the element at that index to the result array
# -return the `result` array implicitly


# ************** Code **************

def oddities(array)
  result = []
  array.each_with_index do |element, index|
    result << element if index.even?
  end
  result
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
p oddities([1, 2, 3, 4, 1]) == [1, 3, 1]