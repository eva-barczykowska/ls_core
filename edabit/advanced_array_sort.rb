=begin
Create a function that takes an array of numbers or strings and returns an array with the items
from the original array stored into subarrays.

Items of the same value should be in the same subarray.
P:
- write a method that takes 1 argument, an array
- the method sorts objects in the array into subarrays in such a way that
  objects that are same should be in the same subarray

E:
advanced_sort([2, 1, 2, 1]) ➞ [[2, 2], [1, 1]]
=> sorted into subarrays of same objecs with the same value
advanced_sort([5, 4, 5, 5, 4, 3]) ➞ [[5, 5, 5], [4, 4], [3]]
=>sorted into subarrays of same objecs with the same value
advanced_sort(["b", "a", "b", "a", "c"]) ➞ [["b", "b"], ["a", "a"], ["c"]]
of same objecs with the same value

N:
sort and then chunk_while
tally

DS:
input: array of integers
output: nested array

A:
- sort the array arg
- once sorted, group it into sub-arrays of the same object with the same value, chunks:)
- the action above will return an enumerator, transform it into an array and return it implicitly
=end

# def advanced_sort(array)
#   array = array.sort
#   array.chunk_while { |a, b| a == b }.to_a.reverse
# end
#
# p advanced_sort([2, 1, 2, 1]) == [[2, 2], [1, 1]]
# p advanced_sort([5, 4, 5, 5, 4, 3]) == [[5, 5, 5], [4, 4], [3]]
# p advanced_sort(["b", "a", "b", "a", "c"]) #== [["b", "b"], ["a", "a"], ["c"]]

# does the order matter? if yes, another solution
# A: sort_by

# puts
# def advanced_sort(array)
#   array.sort { |a,b| b<=>a }.chunk_while { |a,b| a==b }.to_a
# end
#
# p advanced_sort([2, 1, 2, 1]) == [[2, 2], [1, 1]]
# p advanced_sort([5, 4, 5, 5, 4, 3]) == [[5, 5, 5], [4, 4], [3]]
# p advanced_sort(["b", "a", "b", "a", "c"]) == [["b", "b"], ["a", "a"], ["c"]]

# A:
# - this looks like they started with the first element, counted how many there are and placed all elements that
#   are same into the same array
#
# - shift the first element and save it to the `results` subarray
# - iterate over the rest of the elements and if there is an array with the last element like this, add it there,
# - else create a new array with this element
#
# - after finishing iteration, return the nested array

# - iterate over the input array
# - initialize array of arrays
# - if an array with a given element already exists in the nested array, add the element to that array
# - if not, create a new nested array with that element inside
# - when iteration finished, return the array

def advanced_sort(array)
  result = []


  array.each do |element|
    if result.none? { |subarray| subarray.include?(element) }
      result << [element] # add it as an array
    else
      target_subarray = result.find { |s| s.include?(element) }
      target_subarray << element
    end
  end

  result
end

p advanced_sort([2, 1, 2, 1]) == [[2, 2], [1, 1]]
p advanced_sort([5, 4, 5, 5, 4, 3]) == [[5, 5, 5], [4, 4], [3]]
p advanced_sort(["b", "a", "b", "a", "c"]) #== [["b", "b"], ["a", "a"], ["c"]]
