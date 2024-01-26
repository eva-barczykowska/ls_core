=begin
# Finds all fibonacci slices in a given array of integers.
# (A Fibonacci slice is a sequence where every number after the first two is the sum of the two preceding ones.
# The minimum length is 3)

PEDAC
P:
- write a method that creates all possible subarrays from the input array and among these arrays, finds fibonacci slices
- fibonacci slice is a fibonacci sequence

E:
p find_fibonacci_slices([2, 4, 7, 11, 18]) ==  [[4, 7, 11], [4, 7, 11, 18], [7, 11, 18]]
=> [2, 4, 7, 11, 18]
2, 4, 7
2, 4, 7, 11
2, 4, 7, 11, 18
- 4, 7, 11
- 4, 7, 11, 18
- -  7, 11, 18 => [[4, 7, 11], [4, 7, 11, 18], [7, 11, 18]]

A:
- what is a fibonacci sequence? define it, make a definition for it
- this method takes an array as an argument
- it starts analyzing numbers from the 3rd number (at index 2)
- it will ask if all the numbers are the sum of the previous and previous previous number all?.with_index

- create an array of all possible subarrays
- iterate from 0 to arr.size - 1 - outer iteration, grab start index
- iterate from start index to end of array
- save to subarrays a range from the input array but only if it's side is greated or equal to 3

- check each of those subarrays if they are fibonacci slices
=end

def fibonacci_slice?(arr)
  counter = 2
  while counter < arr.size
    if arr[counter] != arr[counter - 1] + arr[counter - 2]
      return false
    else
      counter += 1
    end
  end
  true
end
p fibonacci_slice?([1, 1, 2]) == true
p fibonacci_slice?([2, 4, 7, 11]) == false

puts

def find_fibonacci_slices(arr)
  subarrays = []
  (0...arr.size).each do |start| # no need for special treatment here
    (start...arr.size).each do |finish|
      subarrays << arr[start..finish] if arr[start..finish].size >= 3 # this is key, array has to have at least 3 elements
    end
  end

  subarrays.select { |s| fibonacci_slice?(s) }
end
p find_fibonacci_slices([1, 1, 2, 3, 5, 8]) == [[1, 1, 2], [1, 1, 2, 3], [1, 1, 2, 3, 5], [1, 1, 2, 3, 5, 8], [1, 2, 3], [1, 2, 3, 5], [1, 2, 3, 5, 8], [2, 3, 5], [2, 3, 5, 8], [3, 5, 8]]
p find_fibonacci_slices([2, 4, 7, 11, 18]) == [[4, 7, 11], [4, 7, 11, 18], [7, 11, 18]]
p find_fibonacci_slices([5, 5, 10, 15, 24, 40]) == [[5, 5, 10], [5, 5, 10, 15], [5, 10, 15]]
p find_fibonacci_slices([1, 2, 4, 6, 10, 16]) == [[2, 4, 6], [2, 4, 6, 10], [2, 4, 6, 10, 16], [4, 6, 10], [4, 6, 10, 16], [6, 10, 16]]
p find_fibonacci_slices([10, 22, 33, 43, 56]) == []