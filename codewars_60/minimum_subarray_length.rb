
#Given an array of n positive integers and a positive integer, find the minimal length of a contiguous subarray
# for which the sum >= integer.
# p minSubLength([2, 3, 1, 2, 4, 3], 7) == 2
# p minSubLength([1, 10, 5, 2, 7], 9) == 1
# p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
# p minSubLength([1, 2, 4], 8) == 0


# ************** Problem **************
# -write a method with 2 arguments: an array and an integer
# -the method returns minimal length of a contiguous subarray for which the sum >= integer

# # ************** Examples **************
# p minSubLength([2, 3, 1, 2, 4, 3], 7) == 2
# 2, 3 = 5
# 2, 3, 1 = 6
# 2, 3, 1, 2 = 8
# 2, 3, 1, 2, 4, 3 = 15 -- 1st pass

# 3, 1 =
# 3, 1, 2 =
# 3, 1, 2, 4 =
# 2, 3, 1, 2, 4, 3 =  --2nd pass


# 4th pass 4, 3



# p minSubLength([1, 10, 5, 2, 7], 9) == 1
# p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
# p minSubLength([1, 2, 4], 8) == 0

# ************** Data Structures **************
# Input: array of numbers AND an integer

# Output: an integer that signifies the length of an array the sum of which is equal or greater than the second argument
# to the method

# ************** Algorithm **************
# -create all possible combinations of arrays from the argument array -- HOW?

# -start from the first element (element at index 0) and continue until array size - 1
# -inner loop starting at start defined in the other loop and finishing at the end of the array - 1
# -the arrays that I create - save them to the `arrays` array

# -iterate and see the sum of which array(s) is equal or greater than the 2nd argument
# -return the MINIMUM length of the array, the sum of which is equal or greater than the 2nd argument
# ************** Code **************

# ************** Refactor **************

# Differentiate between EXPLICIT AND IMPLICIT requirements?


def min_subarray_length(array, int)
  arrays = []

  (0...array.size).each do |start|
    (start..array.size).each do |finish|
      arrays << array.slice(start, finish) # start means from which index, finish means how many elements we're slicing
    end
  end

  hash = arrays.each_with_object({}) { |subarray, hash| hash[subarray] = subarray.sum } # arrays and their sums

  target = hash.select { |_, v| v >= int }.keys # selecting only the pairs where value is >= integer

  target = target.map { |array| array.size }.min

  target.nil? ? 0 : target
end
p min_subarray_length([2, 3, 1, 2, 4, 3], 7) == 2
p min_subarray_length([1, 10, 5, 2, 7], 9) == 1
p min_subarray_length([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
p min_subarray_length([1, 2, 4], 8) == 0

puts

# solve it another way
def min_subarray_length(array, int)
  i = 0
  ii = 0
  subarrays = []

  loop do
    loop do
      break if ii >= array.size
      subarrays << array[i..ii]
      ii += 1
    end
    i += 1
    ii = 0
    break if i >= array.size
  end
  target = subarrays.select { |subarr| subarr.sum >= int }

  return 0 if target.empty?
  target.sort_by(&:size).first.size
end
p min_subarray_length([2, 3, 1, 2, 4, 3], 7) == 2
p min_subarray_length([1, 10, 5, 2, 7], 9) == 1
p min_subarray_length([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
p min_subarray_length([1, 2, 4], 8) == 0

















=begin

Given an array of n positive integers and a positive integer, find the minimal length of a contiguous subarray for which the sum >= integer.

p minSubLength([2, 3, 1, 2, 4, 3], 7) == 2
p minSubLength([1, 10, 5, 2, 7], 9) == 1
p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
p minSubLength([1, 2, 4], 8) == 0

=end

=begin


- PROBLEM
  - Input: an array of positive integers and a positive integer
  - Output: integer that represents the minimal length of a continguous subarray where the sum is >= integer

  - Rules:
    - all integers are positive
    - the subarray we're looking for has to be continguous and have a sum greater than or equal to the given integer
    - return 0 if no such subarray exists

- EXAMPLE
  - p minSubLength([2, 3, 1, 2, 4, 3], 7) == 2
    p minSubLength([1, 10, 5, 2, 7], 9) == 1
    p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
    p minSubLength([1, 2, 4], 8) == 0

- DATA STRUCTURE
  -

- ALGORITHM
  - Iterate through the given array, and get subarray of increasing length to compare to the given Integer
    - start with subarray of length 1, all the way up to the length of the given array
      - each of the subarrays, check if the sum of the integers in the subarray is greater than or equal to the given integer
      - return the length of the subarray when condition is satisfied
  -return 0
=end

# #using each_cons method
# def minSubLength(array, target_number)
#   1.upto(array.size) do |subarray_length|
#     array.each_cons(subarray_length) do |slice|
#       if slice.sum >= target_number
#         return slice.size
#       end
#     end
#   end

#   0
# end

# #not using each_cons
# def minSubLength(array, target_number)
#   1.upto(array.size) do |subarray_length|
#     slices = create_slices(array, subarray_length)
#     slices.each do |slice|
#       return subarray_length if slice.sum >= target_number
#     end
#   end

#   0
# end

# def create_slices(array, length)
#   slices = []
#   final_index = array.size - length

#   (0..final_index).each do |start_index|
#     slices << array[start_index, length]
#   end

#   slices
# end


# p minSubLength([2, 3, 1, 2, 4, 3], 7) # 2
# p minSubLength([1, 10, 5, 2, 7], 9) # 1
# p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) # 4
# p minSubLength([1, 2, 4], 8) == 0

# puts "ewa"
# - ALGORITHM
#   - create subarrays starting from element at index 0
#   -itearate over subarrays checking their sum
#   - stop iterating and return the array's length if the sum of array is equal or greater to the 2nd argumetn sum >= integer

# def minSubLength(arr, target_num)
#   subarrays = []ccccccccccccccc
#   (0...arr.size).each do |start|
#     (start...arr.size).each do |finish|
#       subarrays << arr[start..finish]
#     end
#   end

#   subarrays = subarrays.select { |s| s.sum >= target_num }
#   return 0 if subarrays.empty?
#   subarrays.min_by(&:size).size

# end
# p minSubLength([2, 3, 1, 2, 4, 3], 7) == 2
# p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
# p minSubLength([1, 10, 5, 2, 7], 9) == 1
# p minSubLength([1, 2, 4], 8) == 0


###########################################################
# ALGORITHM
# - create an empty array that contains all of the sub_numbers
# - find all sub_numbers that has the sum >= given integer
#   - use each method to iterate from first -> last element
#     -  use each method to iterate from first -> last element
#       - return all sub_numbers to the array
# - select sub_numbers that  have the sum >= given integer
# - select the sub_numbers that has smallest size

def min_sub_length(numbers_array, number)
  sub_numbers = []

  (0..numbers_array.size - 1).each do |left_index|
    (left_index..numbers_array.size - 1).each do |right_index|
      sub_numbers << numbers_array[left_index..right_index]
    end
  end

  result = sub_numbers.select {|sub| sub.sum >= number}
                      .sort_by{ |sub| sub.size}

  return 0 if result.empty?

  result.first.size
end


p min_sub_length([2, 3, 1, 2, 4, 3], 7) == 2
p min_sub_length([1, 10, 5, 2, 7], 9) == 1
p min_sub_length([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
p min_sub_length([1, 2, 4], 8) == 0