=begin
Combine Two Lists
Write a method that combines two Arrays passed in as arguments, and returns
a new Array that contains all elements from both Array arguments,
with the elements taken in alternation.

You may assume that both input Arrays are non-empty, and that they have the same number of elements.

interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

PEDAC
Problem
-write a method that takes 2 arguments, they are arrays
-this method returns a NEW array that contains elements from both arrays taken in alternation

Examples
interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

Data structures
  input: array
  output: an array

Algorithm
-initialize a result array
-take an element from first array and append to the new array
-take an element from the second array and append to the new array
-do this until the 2nd array is empty
-return the result array

['a', 'b', 'c'].shift
=end

def interleave(array1, array2)
  result = []
  until array2.empty?
    result << array1.shift
    result << array2.shift
  end
  result
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

puts ""

# ls solution
def interleave(array1, array2)
  result = []
  array1.each_with_index do |element, index|
    result << element << array2[index]
  end
  result
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

=begin
Further Exploration
Take a few minutes to read about Array#zip. #zip doesn't do the same thing
as interleave, but it is very close, and more flexible.
In fact, interleave can be implemented in terms of zip and one other method
from the Array class. See if you can rewrite interleave to use zip.
=end

def interleave(array1, array2)
  array1.zip(array2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

puts ""

def interleave(arr_1, arr_2)
 (arr_1.zip(arr_2)).flatten
 # after zip and before flatten the array is [[1, 6], [[2, 3, 4], 7], [5, 8]]
end

arr_1 = [1, [2, 3, 4], 5]
arr_2 = [6, 7, 8]

p interleave(arr_1, arr_2)

puts ""

# another approach using each_with_object
def interleave(arr1, arr2)
  (0..(arr1.length - 1)).each_with_object([]) do |index, output|
    output << arr1[index]
    output << arr2[index]
  end
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

puts ""

def interleave(arr1, arr2)
  new_arr = Array.new(arr1.length) { |index| [arr1[index], arr2[index]] }
  new_arr.flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

puts ""

def interleave (arr1, arr2)
  [arr1,arr2].transpose.flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
