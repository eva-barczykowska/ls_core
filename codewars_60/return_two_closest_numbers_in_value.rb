# Write a method that takes an array of integers and returns the
# two numbers that are closest together in value.


# p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
# p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
# p closest_numbers([12, 7, 17]) == [12, 7]

# PEDAC TEMPLATE

# ************** Problem **************
# -write a method
# -the method takes an array of integers as an argument
# -the method returns an array of 2 numbers, these numbers are closest together in value
# # ************** Examples **************
# p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
# =>5 is compared with all the numbers, the smaller number is subtracted from the bigger number
# => 25 is compared with all the numbers
# => 15 is compared with all the numbers
# => the closest 2 numbers are 15, and 11 because the difference is only 4
# p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
# => the closest 2 numbers are 25, and 27 because the difference is only 2
# p closest_numbers([12, 7, 17]) == [12, 7]

# ************** Data structures **************
# input: array
# medium/modelling: [5, 25, 15, 11, 20] => [[5, 25], [5, 15], [5, 11], [5, 20], [25, 15], [25, 11], [25, 20], [15, 11], [15, 20], [11, 20]]
# => [20, 10, 6, 15, 10, 14, 5, 4, 5, 9]  => 7 => [15, 11]
# output: array
# ************** Algorithm **************
# -initialize an empty `results` array
# -iterate through a range of numbers (0...arr.size)
# use iteration to iterate through all the numbers and create nested arrays
# -take first number and pair it with every other number like so:
# [5, 25, 15, 11, 20] - my array
# [[5, 25], [5, 15], [5, 11], [5,20]] result after first iteration
# -so I will start with the first index and iterate until the one but last index, I will take those numbers that signify
# indices and use them as indices later, when grabbing numbers from the array

# the above was outer iteration, I also need to have inner iteration to continue grabbing different pairs starting
# (this time) with the second number or number at index 1
# so I will have an inner loop starting with the same index starting with the block variable that the outer loop
# started with, in this case called `start`
# in the inner loop I will iterate from start to the one but last element of the array
# (I can't take last because I won't have a number to make a pair since it is the last element of the array)
# inside this inner loop (which is inside the outer loop),
# I will retrieve the numbers at those indexes ([array[start], array[ending]])
# and push them both as an array to the `results` array
#
# -once I get all the pairs I need to find the smallest difference between them
# for that I will subtract one from another and get rid of the negative values by retrieving the absolute version of each
# number
# -see which array produces the smallest result of subtraction
# -return the array that returns this smallest result
# ************** Code **************

# ************** Refactor **************

# Differentiate between EXPLICIT AND IMPLICIT requirements?

def closest_numbers(arr)
  # p array
  results = []

  (0...arr.size).each do |start| # my array is for example [5, 25, 15, 11, 20] # this is grabbing the INDEX - 0, 1, 2, 3, 4, note the use of ...
    (start + 1...arr.size).each do |ending|
      results << [arr[start], arr[ending]] # this will give me an array with all the combinations in separate nested arrays
    end
  end
  p results
  differences = results.map { |array| (array[0] - array[1]).abs }

  p differences

  smallest_difference = differences.min # 4 in case of the first array argument (from the test cases)

  target_array_index = differences.index(smallest_difference)
  p target_array_index

  results[target_array_index]
end

p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]

puts
puts "Adil's algorithm"
# Write a method that takes an array of integers and returns the
# two numbers that are closest together in value.

=begin
restate the problem:

  return the 2 closest numbers of an array
explicit rules:
  array elements are integers

implicit rules:
IO
 array -> integer

mental model:
  [19, 25, 32, 4, 27, 16]) => [25, 27]
  [[19,25], [19,32], ...
   [25, 32], [25,4]]
   each =>
   each
   result = []
   hash = {}
   (0 ... arr.size) |i|
     (i + 1 ... arr.size) |ii|
       [arr[i], arr [ii]] => push to result
       after first iteration result = [[19, 25]]
  iterate the result Array
    for each subarray
      push the subarray as key and diff as val
    return key with min val in hash

ds:
  input: array
  working: hash
  output: array

algorithm:
  initialize a results arr
  iterate through a range of numbers (0 ... arr_size)
    for each iteration
      iterate through the range of numbers from the outer loop index plus 1
        push the subarray arr[i], arr[ii] to results
  iterate through the array
    put the subarr as hash and abs difference as value
  return the key with min value
=end

# Examples:
def closest_numbers(arr)
  results = {}
  (0...arr.size).each do |starting_index|
    (starting_index + 1...arr.size).each do |ending_index|
      results[[arr[starting_index], arr[ending_index]]] = (arr[starting_index] - arr[ending_index]).abs
    end
  end

  minimum_difference = results.values.min

  results.each_pair do |key, value|
    return key if value == minimum_difference
  end
end


p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]

puts
puts "Adil's solution"
def closest_numbers(arr)
  results = []

  (0 .. arr.size - 2).each {|i|
    (i + 1 ... arr.size).each {|ii|
      results << [arr[i], arr[ii]] # add this array as results
    }
  }

  results.each_with_object({}) { |subarr, hash| hash[subarr] = (subarr[0] - subarr[1]).abs }.min_by { |_, v| v }[0]
end

# in short: create a hash from which you can easily extract the correct value
# nice how on line 168 he created a hash and while creating he's creating a key in the form of subaray
# and as he's doing that, he's on the fly creating the result of subtraction of each array elements as a value
# (also using the abs method to have the absolute value so that we don't have to care if we're subtracting greater
# number from smaller of vice versa)
# and then also min_by :-)
p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]

