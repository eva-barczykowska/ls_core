#  Implement function that finds all fibonacci slices in a given array of integers.
# A Fibonacci slice is a sequence where every number after the first two is the
# sum of the two preceding ones. The minimum length is 3.
#
# P:
# -method returns all fibonacci slices from the argument array
#
# -every number after the first 2 is a sum of preceding 2
# -min length is 3
#
# E:
# Test cases
# puts find_fibonacci_slices([1, 1, 2, 3, 5, 8]) == [[1, 1, 2], [1, 1, 2, 3], [1, 1, 2, 3, 5], [1, 1, 2, 3, 5, 8], [1, 2, 3], [1, 2, 3, 5], [1, 2, 3, 5, 8], [2, 3, 5], [2, 3, 5, 8], [3, 5, 8]]
#
# puts find_fibonacci_slices([2, 4, 7, 11, 18]) == [[4, 7, 11], [4, 7, 11, 18], [7, 11, 18]]
#
# puts find_fibonacci_slices([5, 5, 10, 15, 24, 40]) == [[5, 5, 10], [5, 5, 10, 15], [5, 10, 15]]
#
# puts find_fibonacci_slices([1, 2, 4, 6, 10, 16]) == [[2, 4, 6], [2, 4, 6, 10], [2, 4, 6, 10, 16], [4, 6, 10], [4, 6, 10, 16], [6, 10, 16]]
#
# puts find_fibonacci_slices([10, 22, 33, 43, 56]) == []
#
# Algorithm:
# -CREATE helper method fibonacci_slice to calculate if all numbers in a given array are the result of adding previous 2(this won't be true for the first 2 numbers)
# -INIT a counter to 2 and from that counter ask if all the numbers are a sum of 2 previous
#
#
# MAIN method
# -INIT `all_subarrays`
# --start with number at index 0 until index -3, outer iteration, starting index
# --start with starting index until the last index - inner iteration, ending index
# -- retrieve an increasing range and store it in `all_subarrays`
#
# -ITERATE over all_subarrays and select those arrays, for which the `fibonacci_slice?` method returns true
# -RETURN those

# def fibonacci_slice?(arr)
#   if arr[2] == 2
#     return false if arr[0] != 1 && arr[1] != 1
#   end
#   counter = 2
#   while counter < arr.size
#      return false if arr[counter] != (arr[counter - 1] + arr[counter - 2])
#     counter += 1
#   end

#   true
# end
# p fibonacci_slice?([4, 7, 11])
# p fibonacci_slice?([1, 1, 2])
# p fibonacci_slice?([1, 1, 2, 3])

# def find_fibonacci_slices(arr)
#   all_slices = []

#   (0..arr.size - 3).each do |start|
#     (start...arr.size).each do |finish|
#       slice = arr[start..finish]
#        all_slices << slice if slice.size > 2
#     end
#   end

#  all_slices.select { |slice| fibonacci_slice?(slice) }
# end

# p find_fibonacci_slices([1, 1, 2, 3, 5, 8]) == [[1, 1, 2], [1, 1, 2, 3], [1, 1, 2, 3, 5], [1, 1, 2, 3, 5, 8], [1, 2, 3], [1, 2, 3, 5], [1, 2, 3, 5, 8], [2, 3, 5], [2, 3, 5, 8], [3, 5, 8]]
# p find_fibonacci_slices([2, 4, 7, 11, 18]) == [[4, 7, 11], [4, 7, 11, 18], [7, 11, 18]]
# p find_fibonacci_slices([5, 5, 10, 15, 24, 40]) == [[5, 5, 10], [5, 5, 10, 15], [5, 10, 15]]
# p find_fibonacci_slices([1, 2, 4, 6, 10, 16]) == [[2, 4, 6], [2, 4, 6, 10], [2, 4, 6, 10, 16], [4, 6, 10], [4, 6, 10, 16], [6, 10, 16]]
# p find_fibonacci_slices([10, 22, 33, 43, 56]) == []

# Jack's solution

# def find_fibonacci_slices(nums)
#   fib_sequences = []

#   nums.each_with_index do |num, ind| #iterating over the argument array with index
#     end_of_slice = ind + 2

#     loop do # getting each valid contiguous fib slice starting from current num
#       break if end_of_slice >= nums.size

#       slice = nums[ind..end_of_slice]

#       case slice[-3] + slice[-2] == slice[-1] # this is a condition
#       when true then fib_sequences << slice
#       else break
#       end

#       end_of_slice += 1 # moving beginning of slice by 1 index
#     end

#     break if ind >= nums.size - 2
#   end

#   fib_sequences
# end

def find_fibonacci_slices(nums)
  fib_sequences = []

  nums.each_with_index do |_num, index|
    end_of_slice = index + 2

    loop do
      break if end_of_slice >= nums.size

      slice = nums[index..end_of_slice]
      slice[-3] + slice[-2] == slice[-1] ? fib_sequences << slice : break
      end_of_slice += 1
    end

    break if index >= nums.size - 2
  end

  fib_sequences
end

p find_fibonacci_slices([1, 1, 2, 3, 5,
                         8]) == [[1, 1, 2], [1, 1, 2, 3], [1, 1, 2, 3, 5], [1, 1, 2, 3, 5, 8], [1, 2, 3], [1, 2, 3, 5], [1, 2, 3, 5, 8],
                                 [2, 3, 5], [2, 3, 5, 8], [3, 5, 8]]
p find_fibonacci_slices([2, 4, 7, 11, 18]) == [[4, 7, 11], [4, 7, 11, 18], [7, 11, 18]]
p find_fibonacci_slices([5, 5, 10, 15, 24, 40]) == [[5, 5, 10], [5, 5, 10, 15], [5, 10, 15]]
p find_fibonacci_slices([1, 2, 4, 6, 10,
                         16]) == [[2, 4, 6], [2, 4, 6, 10], [2, 4, 6, 10, 16], [4, 6, 10], [4, 6, 10, 16], [6, 10, 16]]
p find_fibonacci_slices([10, 22, 33, 43, 56]) == []

puts

# solution with upto
def find_fibonacci_slices(nums)
  last_index = nums.size - 1
  fib_sequences = []

  0.upto(last_index - 2) do |start_ind| # upto
    (start_ind + 2).upto(last_index) do |end_ind|
      slice = nums[start_ind..end_ind]

      case slice[-3] + slice[-2] == slice[-1]
      when true then fib_sequences << slice
      else break
      end
    end
  end

  fib_sequences
end
p find_fibonacci_slices([1, 1, 2, 3, 5,
                         8]) == [[1, 1, 2], [1, 1, 2, 3], [1, 1, 2, 3, 5], [1, 1, 2, 3, 5, 8], [1, 2, 3], [1, 2, 3, 5], [1, 2, 3, 5, 8],
                                 [2, 3, 5], [2, 3, 5, 8], [3, 5, 8]]
p find_fibonacci_slices([2, 4, 7, 11, 18]) == [[4, 7, 11], [4, 7, 11, 18], [7, 11, 18]]
p find_fibonacci_slices([5, 5, 10, 15, 24, 40]) == [[5, 5, 10], [5, 5, 10, 15], [5, 10, 15]]
p find_fibonacci_slices([1, 2, 4, 6, 10,
                         16]) == [[2, 4, 6], [2, 4, 6, 10], [2, 4, 6, 10, 16], [4, 6, 10], [4, 6, 10, 16], [6, 10, 16]]
p find_fibonacci_slices([10, 22, 33, 43, 56]) == []
