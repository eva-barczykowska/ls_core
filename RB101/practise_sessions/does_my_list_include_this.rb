# Write a method named include? that takes an Array and a search value as arguments.
# This method should return true if the search value is in the array, false if it
# is not. You may not use the Array#include? method in your solution.
#
# PEDAC
# Problem
# -write a a method that takes 2 arguments
# -1st argument is an array, 2nd is a search value
# -method returns true if the search value is in the array
#
# Examples
# include?([1,2,3,4,5], 3) == true
# include?([1,2,3,4,5], 6) == false
# include?([], 3) == false
# include?([nil], nil) == true
# include?([], nil) == false
#
# Data Structures
# - input: array and a value like integer/nil
# -output: a boolean, true of false
#
# Algorithm
# -iterate over the array
# -verify if the provided value is there ****************************************write more details, USE LOOP
# -if it is there, return true
# -otherwise return false
#
# Code
# def include?(array, search_value)
#   array.each do |value|
#     if value == search_value
#       return true
#     else
#       return false
#     end
#   end
# end

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

puts ""

# The first method uses Array#find_index to scan the array for the first element
# that has the specified value. find_index returns the index number of the found
# element, which will always have a truthy value, or nil if no such element is
# present. We then use !! to force the return value to true or false in accordance
# with the implied promise of the ? in include?.
#
# The second method does essentially the same thing, but it uses each instead of
# find_index. This takes a little bit more work, since we are explicitly returning
# false if the value is not found.

# other people's solution

def include?(array, search_value)
  array.any?(search_value)
end
p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false

puts ""

# will work in latest versions of ruby:
# def include?(arr, value)
#   arr.intersect?([value])
# end
# p include?([1,2,3,4,5], 3) == true
# p include?([1,2,3,4,5], 6) == false
# p include?([], 3) == false
# p include?([nil], nil) == true
# p include?([], nil) == false

puts ""

def include?(array,value)
  false
  true if array.count(value) > 0
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false


p include?([1,2,3,4,5], 3)
p include?([1,2,3,4,5], 6)
p include?([], 3)
p include?([nil], nil)
p include?([], nil)
