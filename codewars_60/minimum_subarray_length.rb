
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
