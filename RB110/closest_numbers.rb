# # Write a method that takes an array of integers and returns the
# two numbers that are closest together in value.
#
# PEDAC
# P:
# - write a method that takes an array of integers as an argument
# - method returns the 2 numbers that are closest in value
#
# Examples:
# p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
# 5-25=5
# 5-15=10
# 5-11=6
# 5-20=15
# *25-15=10
# *25-11=14
# *25-20=5
# --15-11=4 => 15, 11 are closest in value
# --15-20=5
# &&&11-20=8
#
# p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
# p closest_numbers([12, 7, 17]) == [12, 7]
#
# The tests above should print "true".
#
# DS:
# input: array of integers
# output: an array of integers closest in value
#
# A:
# - create hash_result
# - create `pairs`
#
# - iterate over the array, starting with index 0 up to arr.size exclusive - 1, this is outer iteration
# - finish this outer iteration at the one but last number
# - iterate again, starting from the number at the starting_index + 1 up to arr.size exclusive
# - populate the `pairs` array with sliced pairs
# - slice at the initial index
#
# - subtract in pairs one int  from another and find out what is the absolute value of the result
# - return the min absolute value
#
# - save into the hash, pair(key) and their absolute difference
# - for the least value, return the key
def closest_numbers(arr)
  h = {}
  pairs = []

  (0...arr.size).each do |first_number|
    (first_number.next...arr.size).each do |second_number|
      # p "starting is #{starting_number}"
      # p "ending is #{ending_number}"
      pairs << [arr[first_number], arr[second_number]]
    end
  end

  pairs.each do |pair|
    h[pair] = (pair[0] - pair[1]).abs
  end

  least_value = h.values.min

  h.each do |k, v|
    return k if v == least_value
  end
end
p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]

# Problem 4
# Create a method that takes an array of integers as an argument and returns an array of two numbers that are closest together in value. If there are multiple pairs that are equally close, return the pair that occurs first in the array.
#
# p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
# p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
# p closest_numbers([12, 22, 7, 17]) == [12, 7]
#
# Problem
# =======
# -method takes an array as an argument
# -method returns an array of 2 numbers that are closest in value
# -if there are multiple pairs like that, return the pair that occurs first in the array
#
# Examples
# ========
# p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
# =>pairs
# 5,25 => 20
# 5,15 => 10
# 5,11 => 6
# 5,20 => 15
# -25,15 => 10
# -25,11 => 13
# -25,20 => 5
# --15,11 => 4 CLOSEST IN VALUE
# --15,20 => 5
#
# p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
# p closest_numbers([12, 22, 7, 17]) == [12, 7]
# => pairs
# 12, 22 => 10
# 12, 7 => 5 CLOSEST IN VALUE, OCCURS FIRST
# 12, 17 => 5 CLOSEST IN VALUE
# -22, 7 => 15
# -22, 17 => 5 CLOSEST IN VALUE
# --7, 17 => 10
#
# Algorithm
# ==========
# INIT `pairs` to array
# ITERATE over the numbers and get pairs
# -start with index 0 and continue to penultimate index - start index
# -start with starting_index  and continue to last index - finish index
# --retrieve element and start and finish as an array
# --add this array to `pairs`
#
# INIT `result` hash
# ITERATE over `pairs`
# --if pair doesn't exist as a key in the `result` hash, add it
# --as a value add the absoluate value of subtracting 2nd value from first
#
# ITERATE over the hash and RETURN the key for which the value is min (first found result will get returned)
def closest_numbers(arr)
  pairs = []
  (0..arr.size - 2).each do |start|
    (start + 1...arr.size).each do |finish|
      pair = [arr[start], arr[finish]]
      pairs << pair
    end
  end
  result = {}
  pairs.each do |pair|
    result[pair] = (pair[0] - pair[1]).abs
  end

  result.each do |key, value|
    return key if value == result.values.min
  end
end
p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 22, 7, 17]) == [12, 7]

#
# algorithm for solving with a loop
# Algorithm
# ==========
# solve with a loop
# INIT counter1 to 0
# INIT counter2 to 1
# INIT `result` hash
# LOOP over the numbers and get pairs
# --while counter1 is less or equal to penulatimate element of the array
# --while counter2 is less or equal to the last element of the array
# --retrieve element at counter1 and element at counter2 in an array (a pair)
# --add `pair` as a key-array to hash
# --as a value, add the absolute result of subtracting elem 2 from elem 1 of this `pair` array
# --increaese counter2 on each loop iteration
# --increae counter 1 when the inner loop is done with 1 iteration
# --also REASSIGN counter2 to counter1 + 1 in order to start the next iteration of retrieving the pairs
# --first pairs are [5, 25]=>20, [25, 15]=>10, [15, 11]=>4, [11, 20]=>9 but this is just all possible pairs with 5, the first element,
# retrieved by counter1=1 and counter2=all possible indices starting with 1
# --now we need to start genearating pairs with 25, the next element in this array so counter1 needs to be 1 and counter 2 needs to be counter1 + 1
#
#
# ITERATE over `result`
# RETURN the key for which the value is min (first found result will get returned)
def closest_numbers(arr)
  result = {}

  counter1 = 0
  counter2 = 1
  while counter1 < arr.size - 1
    while counter2 < arr.size
      pair = [arr[counter1], arr[counter2]]
      result[pair] = (pair[0] - pair[1]).abs
      counter2 += 1
    end

    counter1 += 1
    counter2 = counter1 + 1
  end

  result.each do |key, value|
    return key if value == result.values.min
  end
end
p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 22, 7, 17]) == [12, 7]
