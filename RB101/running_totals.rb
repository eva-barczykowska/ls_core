# Write a method that takes an Array of numbers, and returns an Array with
# the same number of elements, and each element has the running total from
# the original Array.

# Explicit requirements:
# -a method that takes an array
# -returns an array
# -that array that is returned has the same number of elements and each element
#  has the running total from the original array
#
#  Data structures:
#  Input: array
#  Output: array
#
#  Algorithm:
# -define result
# -define current total
# -look at the 1st element of the array and add it with the 2nd, this is now
# your current total
# -then add next element to your current total and so on until the end
# -return the result

def running_total(array)
  result = []
  current_total = 0
  array.each do |elem|
    current_total = current_total + elem
    result << current_total
  end
  result
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []
