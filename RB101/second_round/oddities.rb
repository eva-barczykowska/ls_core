# https://launchschool.com/exercises/7ced73ba
=begin
Write a method that returns an Array that contains every other element of an
Array that is passed in as an argument.

The values in the returned list should be those values that are in the
1st, 3rd, 5th, and so on elements of the argument Array.
=end

=begin
PEDAC
Problem
-write a method
-the method returns an ARRAY
-the returned array contains every other element from the argument array
-the values should be elements 1, 3, 5 etc. from the argument array

Examples
oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
oddities(['abc', 'def']) == ['abc']
oddities([123]) == [123]
oddities([]) == []
oddities([1, 2, 3, 4, 1]) == [1, 3, 1]

Data Structures
input: Array
output: Array

Algorithm
-initiliaze a counter variable to 0
-iterate over the argument array
-pick every other element starting with the first
-append this element to the result array
-increase the counter by 2
-return the result array

-* empty and 1 element array will take care of themselves

Code
=end

# def oddities(array)
#   result = []
#     counter = 0
#     while counter < array.size
#       p "index is #{counter} and the element at that index is #{array[counter]}"
#       result << array[counter]
#       counter += 2
#     end
#   result
# end

# for [2, 3, 4, 5, 6]
# counter starts from 0
# array[counter] when counter is 0 ==> 2
# counter += 2 so:
# array[counter] when counter is 2 ==> 4
# counter += 2 so:
# array[counter] when counter is 4 ==> 6, counter/index 4 is the LAST element in this array so all others will be nil
# counter += 2 so:
# array[counter] when counter is 6 ==> nil

puts ""

# if I do while counter < array.size -1, I am stopping the loop 1 element earlier so I will not get all elements:

def oddities(array)
  result = []
    counter = 0
    while counter < array.size
      # p "index is #{counter} and the element at that index is #{array[counter]}"
      result << array[counter]
      counter += 2
    end
  result
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
p oddities([1, 2, 3, 4, 1]) == [1, 3, 1]

puts ""

=begin
Kim's solution

algorithm
given an array
select elements at index positions 0,2,4,6 even indicies
return them in new array
=end

def oddities(array)
  return_array = []
  array.each_with_index do |num, index|
    if index.even?
      return_array << num
    end
  end

  return_array
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
p oddities([1, 2, 3, 4, 1]) == [1, 3, 1]
