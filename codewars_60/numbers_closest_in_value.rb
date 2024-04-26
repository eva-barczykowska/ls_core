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

puts

# Write a method that takes an array of integers and returns the
# two numbers that are closest together in value.

# Examples:

# p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
# p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
# p closest_numbers([12, 7, 17]) == [12, 7]

# # The tests above should print "true".
# #each, select, map

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

# Output: array of 2 itegers
# ************** Algorithm **************
# -create subarrays [5, 25, 15, 11, 20]
# =>5-25, 5-15, 5-11, 5-20
# =>25-15, 25-11, 25-20
# =>15-11, 15-20
# =>11-20

# initialize `groups` empty array
# -initialize `start` counter for the starting index to 0 (coz we're starting with the 1st number)
# -initialize `finish` counter for the starting index to 1 (coz we're starting with the 2nd number)
# -`start` will retrieve numbers until penultimate number so arr.size - 2
# -`finish` will retrieve numbers until the last number so arr.size
# -outer loop is for the starting index, which will be increased only after inner loop has finished looping
# -inner loop is for the finishing index, it will be increased at each iteration
# using start and finish, extract correct elements (as per example analysis) and save both in an array, which in turn
# you store in the groups array
#
# -find out what is the difference between element a and b in each array -- how? I can even loop :)
# -return the array that produces smallest difference
# ************** Code **************
# ************** Refactor **************

# -0---1---2---3---4 arr size is 5
# [5, 25, 15, 11, 20]

def closest_numbers(arr)
  groups = []
  start = 0
  finish = 1

  while start < arr.size - 1 # while 0 < 4 so the last index is 3!!!!
    while finish < arr.size
      groups << [arr[start], arr[finish]]
      finish += 1
    end
    start += 1
    finish = start + 1
  end

  groups.min_by { |s| (s.first - s.last).abs }
end

p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]

def closest_numbers(array)
  sub_arrays = []

  (0..array.size - 2).each do |index_1|
    (index_1 + 1..array.size - 1).each do |index_2|
      # p "index_1 is #{index_1} and index_2 is #{index_2}"
      sub_arrays << [array[index_1], array[index_2]]
    end
  end

  sub_arrays.min_by { |sub| sub.inject(:-).abs }
end

p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]

puts

# Write a method that takes an array of integers and returns the
# two numbers that are closest together in value.
#
# Problem
# =======
# --method takes an array of integers
# -methjod returnns integers that are closest in value
# -onlly positive
#
# Examples:
# ============
# p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
# 5,25
# 5,15
# 5,11
# 5,20
# -25, 15
# -25, 11
# -25,20
# --15, 11 =>4
# --15, 20
# --11,20
# p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
#
# p closest_numbers([12, 7, 18]) == [12, 7]
# The tests above should print "true".
#
# Algorithm
# =========
# -INIT all_pairs
# --ITERATE over the array
# --start outer it. with inndex 0 and cont. untill arr.size - 2
# --start inner it. with index 1 and continue to arr.size -1
# --using arr element ref. retrieve e.from inner, el. from outer i. and
# --store pairs in all_pairs as an array
#
# -ITERATE over alll_pairs, store pair as a key in a hash, value is abs.value of minusing secondn vallue from the first
def closest_numbers(arr)
  all_pairs = []

  (0..arr.size - 2).each do |start|
    (start + 1...arr.size).each do |finish|
      pair = [arr[start], arr[finish]]
      all_pairs << pair
    end
  end

  hash = {}
  all_pairs.each do |pair|
    hash[pair] = (pair.first - pair.last).abs
  end

  min_value = hash.values.min

  hash.each do |k, v|
    return k if v == min_value
  end
end
p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 18]) == [12, 7]

# refactor
def closest_numbers(arr)
  all_pairs = []
  closest = {}

  (0..arr.size - 2).each do |start|
    (start + 1...arr.size).each do |finish|
      pair = [arr[start], arr[finish]]
      closest[pair] = (pair.first - pair.last).abs
    end
  end

  min_value = closest.values.min

  closest.each { |k, v| return k if v == min_value }
end
p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 18]) == [12, 7]
