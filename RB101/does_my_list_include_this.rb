=begin
Does My List Include This?
Write a method named include? that takes an Array and a search value as arguments. This method should return true if the search value is in the array, false if it is not. You may not use the Array#include? method in your solution.

PEDAC
Problem
-I have an array
-I have a value I need to search in this array
-write a method that takes 2 arguments, an array and a search value
-the method returns true if the search value is present in the array
-the method returns false if the search value is not in the array

Examples
include?([1,2,3,4,5], 3) == true
include?([1,2,3,4,5], 6) == false
include?([], 3) == false
include?([nil], nil) == true
include?([], nil) == false

Data structures
-input: array, integer/nil
-output: a boolean (true or false)

Algorithm
-I will declare a method with 2 arguments, an array and a search value
-if the input array is empty, I will return false
-I will iterate through the input array
-each time I iterate, I will ask the question if the current element is equal
 to the search value
 -if it is equal, I will stop searching and return true from the method
 -if the search value is not in the array and I finished iterating, I need to return false

 Code
=end

=begin
this is a common pattern to iterate over the array and if the something was not found,
return false
js:
function demonstrate(inputData, condition) {
  for (let i = 0; i < inputData.length; i++) {
    if (something in the inputData meets a condition) return true;
  }

  return false;
}
=end

def include?(array, search_value)
  return false if array.empty?

  array.each do |element|
    if element == search_value
      return true
    end
  end
  return false
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false

puts ""

# ls solution
def include?(array, value)
  !!array.find_index(value)
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false

puts ""

def include?(array, value)
  array.each { |element| return true if value == element }
  false
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false

=begin
The first method uses Array#find_index to scan the array for the first element
that has the specified value. find_index returns the index number of the found
element, which will always have a truthy value, or nil if no such element is
present. We then use !! to force the return value to true or false in accordance
with the implied promise of the ? in include?.
=end

puts ""

# other solutions

def include?(arr, arg)
  arr.any? do |el|
    el == arg
  end
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false

puts ""

def include?(array, search_value)
  array.any? (search_value)
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false

puts ""

# my old solution

def include?(array, search_value)
  counter = 0
  while counter < array.size
    if array[counter] != search_value
      counter += 1
      next
    else
      return true
    end
  end
  return false
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false
