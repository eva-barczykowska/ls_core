# Write a method that takes an Array as an argument, and returns two Arrays
# (as a pair of nested Arrays) that contain the first half and second half of
# the original Array, respectively. If the original array contains an odd number
# of elements, the middle element should be placed in the first half Array.
#
# PEDAC
# Problem
# -write a method
# -method takes an array as an argument
# -method returns 2 arrays (as a pair of nested arrays, e.g. [[1, 2], [3, 4]])
# -1st nested array contains first half of the first array
# -2nd nested array contains the second half of the original array
# -what if the original argument contains uneven number of elements?
# -then the middle element should be in the first array
# -if argument is an empty array, the result will be 2 nested empty arrays
# -if argument contains one element, this 1 elment will be in the first array,
#  the 2nd array will be empty

# Examples
# halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
# halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
# halvsies([5]) == [[5], []]
# halvsies([]) == [[], []]
# Data structures
# input - array
# output - 2 nested arrays

# Algorithm

# how to get access the first and the second half - divide array by 2, use first
# and last method
# -create the result array
# -check if argument is empty
# -if argument is empty, return 2 nested arrays
# -if argument array is not empty, check the array size
# -if argument size is 1, define nested arrays and
# push the element into the first array and return result
# -else if the argument is even, push half of the elements into the first array
# and the other half into the second
# -if the argument size is odd, push the first half of the elements + 1 into the
#   1st nested array and the rest into the second nested array

# Code

def halvsies(array)
  result = []
  if array.empty?
    # return [[], []]
    result << [] << []
  elsif array.size == 1
    result = [[], []]
    result[0] << array[0]
  elsif array.size.even?
    result << array.first(array.size / 2)
    result << array.last(array.size / 2)
  else
    result << array.first((array.size / 2) + 1)
    result << array.last(array.size / 2)
  end
  result
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]

puts ""
# ls solution
def halvsies(array)
  middle = (array.size / 2.0).ceil
  first_half = array.slice(0, middle)
  second_half = array.slice(middle, array.size - middle)
  [first_half, second_half]
end
p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]

puts ""
#other people's solution
def halvsies(orig_array)
  sub_1_arr = []
  sub_2_arr = []

  if orig_array.size.odd?
    sub_1_arr << orig_array[0..(orig_array.size) / 2]
    sub_2_arr << orig_array[(orig_array.size / 2) + 1..-1]
    return sub_1_arr + sub_2_arr
  else
    sub_1_arr << orig_array[0..(orig_array.size / 2) - 1]
    sub_2_arr << orig_array[(orig_array.size) / 2..-1]
    return sub_1_arr + sub_2_arr
  end
end
p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]
