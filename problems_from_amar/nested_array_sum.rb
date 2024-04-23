# Write a function that calculates the sum of all numbers in a nested array.
# The array may contain integers,
#  nested arrays of integers, or a mix of both. (for ruby and JS don't use flatten)
# p sum_of_nested_array([1, [2, 3], [4, [5, 6]]]) #== 21
#  p sum_of_nested_array([10, [20, 30, [40]], 50]) == 150
#
# Problem:
# -do not use flatten, find numbers in all the nexted arrays and add them
#
# p sum_of_nested_array([1, [2, 3], [4, [5, 6]]]) == 21
# 1+2+3+4+5+6 => 21
#
# p sum_of_nested_array([10, [20, 30, [40]], 50]) == 150
# 10+20+30+40+50 = 150
#
# Input: nested array
# Output: Integer, sum of all numbers from nested array
#
# A:
# -solve recursively
# -INIT `sum`
# -ITERATE over the array
# --if elem is an array
# --assign `sum` to the `sum` + return value of callign the `sum_of_nested_array `with element as an argument
# --else
# --just assin `sum` to the `sum` plus the element
#
# -RETURN sum at the end of iteration

def sum_of_nested_array(arr)
  sum = 0
  arr.each do |element|
    sum += if element.is_a?(Array)
             sum_of_nested_array(element)
           else
             element
           end
  end

  sum
end

p sum_of_nested_array([1, [2, 3], [4, [5, 6]]]) == 21
p sum_of_nested_array([10, [20, 30, [40]], 50]) == 150
