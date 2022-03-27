# Write a method that takes an Array of numbers, and returns an array with the
# same number of elements, and each element has the running total from the
# original Array.

# Requirement
# -a method
# -input: array of numbers
# -output: array of same number of elements, each element has a running total
# from the original array
# running total for the 1st element of the array is the same element as in
# the argument array
# running total for the 2nd element is the first element(unchanged) plus the
# current(second) element of the argument array
# is the current number plus next in case of 1st element of the array

# Data Structures: input and output is an ARRAY

# Algorithm:
# -if it is an array of only 1 element, then return that element
# -print the 1st element
# -create a result array
# -add the first element
# -add the first element plus the second element, this creates a sum
# -add this sum plus the next element of the array
# -now the sum has changed, use the new sum and add it with the 3rd element of
# the array
# -add the current element and next element of the array

def running_total(array)
  res = []
  counter = 0
  if array.empty?
    return array
  else
    res << array.shift
    until counter >= array.size
      current_sum = res.last + array[counter]
      res << current_sum
      counter += 1
    end
  end
  res
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

#ls solution - 4 lines!!!
puts ""

def running_total(array)
  sum = 0
  array.map { |value| sum += value }
end

puts ""
# Further Exploration
# Try solving this problem using
# Enumerable#each_with_object or
# Enumerable#inject (note that Enumerable methods can be applied to Arrays).

def running_total(array)
  totals = []
  array.inject(0) { |sum, n| totals[totals.length] = sum + n }
  totals
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []
