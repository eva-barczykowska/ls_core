# Write a method that takes an array of integers and returns the
# two numbers that are closest together in value.

# Examples:
# p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
# p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
# p closest_numbers([12, 7, 17]) == [12, 7]

# The tests above should print "true".

# # ************** Problem **************
# -write a method that takes an array of integers
# -the method returns 2 integers that are closest in value
# -so the difference between 2 numbers is the smallest
# calculate that difference and return the numbers that create that difference

# # ************** Examples **************
# p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
# =>5-25, 5-15, 5-11, 5-20
# =>25-15, 25-11, 25-20
# =>15-11, 15-20
# =>11-20
# p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
# p closest_numbers([12, 7, 17]) == [12, 7]

# ************** Data Structures **************
# Input: array of integers

# Output: array of 2 integers
# ************** Algorithm **************
# -create sub-arrays [5, 25, 15, 11, 20]
# =>5-25, 5-15, 5-11, 5-20
# =>25-15, 25-11, 25-20
# =>15-11, 15-20
# =>11-20
# Test assumptions in irb.

# Take your time.

# ************** Code **************
# ************** Refactor **************
#  for [5, 25, 15, 11, 20] it should be:
# # =>5-25, 5-15, 5-11, 5-20
# # =>25-15, 25-11, 25-20
# # =>15-11, 15-20
# # =>11-20...so
# [[5, 25], [5, 15], [5, 11], [5, 20]]
#     [[25, 15], [25, 11], [25, 20]]
#          [[15, 11], [15, 20]]
#              [[11, 20]]
def closest_numbers(array)
  subarrays = []

  (0..array.size - 2).each do |index1|
    (index1 + 1..array.size - 1).each do |index2| # + 1 because starting from index 1, not 0
      subarrays << [array[index1], array[index2]] # I want element at this index, in an array
    end
  end
  subarrays.min_by { |sub| sub.inject(&:-).abs }
end
# array is [5, 25, 15, 11, 20]
# index 0, 1 - append [5, 25]
# index 0, 2 - append [5, 15]
# index 0, 3 - append [5, 11]
# index 0, 4 - append [5, 20]

# index 1, 2 - append [25, 15]
# index 1, 3 - append [25, 11]
# index 1, 4 - append [25, 20]

# index 2, 3 - append [15, 11]
# index 2, 4 - append [15, 20]

# index 3, 4 - append [11, 20]
# 3 is the last starting index because we said arr.size - 2 so 5 - 2 = 3
# 4 is the last finishing index because we're iterating until arr.size - 1 = 5 - 1 = 4

p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]