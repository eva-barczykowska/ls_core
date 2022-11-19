=begin
Create a function that applies a discount d to every number in the array.

Examples
get_discounts([2, 4, 6, 11], "50%") ➞ [1, 2, 3, 5.5]

get_discounts([10, 20, 40, 80], "75%") ➞ [7.5, 15, 30, 60]

get_discounts([100], "45%") ➞ [45]

Notes
The discount is the percentage of the original price (i.e the discount of "75%"
to 12 would be 9 as opposed to taking off 75% (making 3)).

There won't be any awkward decimal numbers, only 0.5 to deal with.
=end

=begin
PEDAC
Problem
-write a method that applies a discount d to every number in the array

Examples
get_discounts([2, 4, 6, 11], "50%") ➞ [1, 2, 3, 5.5]

get_discounts([10, 20, 40, 80], "75%") ➞ [7.5, 15, 30, 60]

get_discounts([100], "45%") ➞ [45]

Data Structures
input: an array of digits
output: an array of digits/integers/floats which denote the discount

Algorithm
-initialize the result array
-iterate over the argument array
-when I iterate, I'm going to calculate the discout on every element
 in the array
e.g. if element/number is 2, 2*0.50 = 1.0 -- convert the discout argument to
 a float and divide it by 100
-push the discounts into the result array
-deal with the display: compare the number with its integer version
-if the comparison returns true, return the integer version, otherwise
return the float version

Code
=end

def get_discounts(array, d)
  result = array.map do |element| # no need to first initialize the result array
    element * (d.to_f / 100)
  end

  result.map! do |num|
    num == num.to_i ? num.to_i : num
  end

  # result.map! do |element|
  #   if element == element.to_i
  #     element.to_i
  #   else
  #     element
  #   end
  # end
end

p get_discounts([2, 4, 6, 11], "50%") == [1, 2, 3, 5.5]

p get_discounts([10, 20, 40, 80], "75%") == [7.5, 15, 30, 60]

p get_discounts([100], "45%") == [45]

puts
####################################################################
=begin
Create a method that takes two lists of numbers sorted in ascending order
and returns an array of numbers which are common to both the input arrays.

Examples
common_elements([-1, 3, 4, 6, 7, 9], [1, 3]) ➞ [3]

common_elements([1, 3, 4, 6, 7, 9], [1, 2, 3, 4, 7, 10]) ➞ [1, 3, 4, 7]

common_elements([1, 2, 2, 2, 3, 4, 5], [1, 2, 4, 5]) ➞ [1, 2, 4, 5]

common_elements([1, 2, 3, 4, 5], [10, 12, 13, 15]) ➞ []
Notes
Lists are sorted.
=end

# Problem
# -write a method that takes 2 arrays as arguments
# -the arrays are sorted in ascending order
# -the method returns an array of numbers that are common
# -if there are no common elements, an empty array is returned

# Examples
# common_elements([-1, 3, 4, 6, 7, 9], [1, 3]) ➞ [3]

# common_elements([1, 3, 4, 6, 7, 9], [1, 2, 3, 4, 7, 10]) ➞ [1, 3, 4, 7]

# common_elements([1, 2, 2, 2, 3, 4, 5], [1, 2, 4, 5]) ➞ [1, 2, 4, 5]

# common_elements([1, 2, 3, 4, 5], [10, 12, 13, 15]) ➞ []

# Data Structures
# input: 2 arrays
# output: 1 array, containing common elements from the 2 arrays

# Algorithm
# -initialize result array
# -iterate through both arrays and ask if the element present in the first array
# also exists in the second array
# -if it does, add the element to the result array

# Code
require 'pry'
require 'pry-doc'
require 'pry-byebug'

def common_elements(arr1, arr2)
  result = []
  arr1.each do |num1| # taking a number from array1, it is taking 2 elem from arr1 and iterating over all elements from arr2
    # num1 == 1
    p "--- #{num1} from array1"
    arr2.each do |num2|  # taking a number from array2
      p "*** #{num2} from array2"
    # binding.pry
  # first iteration num2 === 1
      # second iteration num2 === 2
  # third iteration num2 == 3
    if arr2.include?(num1)
      p "arr2 include #{num1} and we will put it in the result array"
      result << num1
      p "#{result}"
      puts "-----------"
    end
  end
end
  p result.size
end

# for each element in the 1st array argument, example in the first array, I'm iterating twice (coz 2 elements in the 2nd array)
arr1 = [-1, 3, 4, 6, 7, 9]
arr2 = [1, 3]
common_elements(arr1, arr2) #== [3]

# each within each will take the numbers in the following order -1,1,3--3,1,3--4,1,3--6,1,3--7,1,3--8,1,3--9,1,3
# 1 from the first array and all the numbers one by one from the 2nd array

# arr1 = [1, 3, 4, 6, 7, 9]
# arr2 = [1, 2, 3, 4, 7, 10]
# common_elements(arr1, arr2) # == [1, 3, 4, 7]
#
# common_elements([1, 2, 2, 2, 3, 4, 5], [1, 2, 4, 5]) #== [1, 2, 4, 5]
#
# common_elements([1, 2, 3, 4, 5], [10, 12, 13, 15]) #== []

puts
puts "another solution"
# Algorithm
# -iterate through both arrays and ask if the element present in the first array
# also exists in the second array
# -if it does, add the element to the result array

def common_elements(arr1, arr2)
  arr1.intersection(arr2)
end

p common_elements([-1, 3, 4, 6, 7, 9],[1, 3]) == [3]
p common_elements([1, 3, 4, 6, 7, 9], [1, 2, 3, 4, 7, 10]) == [1, 3, 4, 7]
p common_elements([1, 2, 2, 2, 3, 4, 5], [1, 2, 4, 5]) == [1, 2, 4, 5]
p common_elements([1, 2, 3, 4, 5], [10, 12, 13, 15]) == []

puts
puts "another solution"


def common_elements(arr1, arr2)
  arr1.select { |num| arr2.include?(num)}.uniq
end

p common_elements([-1, 3, 4, 6, 7, 9],[1, 3]) == [3]
p common_elements([1, 3, 4, 6, 7, 9], [1, 2, 3, 4, 7, 10]) == [1, 3, 4, 7]
p common_elements([1, 2, 2, 2, 3, 4, 5], [1, 2, 4, 5]) == [1, 2, 4, 5]
p common_elements([1, 2, 3, 4, 5], [10, 12, 13, 15]) == []

puts

def common_elements(arr1, arr2)
  arr1.reject{ |num| !arr2.include?(num) }.uniq
end

p common_elements([-1, 3, 4, 6, 7, 9], [1, 3]) == [3]
p common_elements([1, 3, 4, 6, 7, 9], [1, 2, 3, 4, 7, 10]) == [1, 3, 4, 7]
p common_elements([1, 2, 2, 2, 3, 4, 5], [1, 2, 4, 5]) == [1, 2, 4, 5]
p common_elements([1, 2, 3, 4, 5], [10, 12, 13, 15]) == []
