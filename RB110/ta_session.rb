# PEDAC TEMPLATE
#=begin
# Given an array of n positive integers and a positive integer, find the minimal length of a contiguous subarray for which the sum >= integer.
#
# p minSubLength([2, 3, 1, 2, 4, 3], 7) == 2
# p minSubLength([1, 10, 5, 2, 7], 9) == 1
# p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
# p minSubLength([1, 2, 4], 8) == 0
# =end

# ************** Problem **************
# -I have an array of positive integers
# - I need to write a method that takes this array as an argument and also an integers (so 2 arguments)
# - the method will return the minimal length of a contiguous subarray for which the sum is greater or equal to the integer (2nd argument)
# ************** Examples **************
# p minSubLength([2, 3, 1, 2, 4, 3], 7) == 2
# 2
# 2, 3
# 2, 3, 1
# 2, 3, 1, 2
# 2, 3, 1, 2, 4
# 2, 3, 1, 2, 4, 3
# now starting with element at index 1
# 3
# 3, 1
# 3, 1, 2
# 3, 1, 2, 4
# 3, 1, 2, 4, 3, etc.
# ==> the solution is probably [4, 3] because [4, 3].sum == 7 and [4, 3].size == 2
# p minSubLength([1, 10, 5, 2, 7], 9) == 1
# p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
# p minSubLength([1, 2, 4], 8) == 0
# ************** Data Structures **************
# Input: 2 arguments: an array of positive integers AND an integer

# Output: an integer that signifies the length of the smallest subarray that, when summed, is equal or greater than the integer
#   ************** Algorithm **************
# -initialize subarrays array
# - create subarrays from the array, similarly to creating substrings
# - create 2 counters, one for start and the other one for end of array
# --use an outer loop to start with element at index 0 and iterate until the penultimate element
# --use an inner loop to start with element at index 1 and continue until the penultimate element
# - increase the second counter within the second loop so that the end is increasing and taking more numbers each time
#   the loop iterates
# - increase the outer loop counter1 and also counter 2 because
#
# --create a subarray
# -- use subarrays array to store the extracted (the 2 loops above) subarrays
# - now iterate through these subarrays and see which one, when summed, gives the number equal or greater to the 2nd argument
# - get rid of all the other arrays which do not fulfill the condition above
# - among all the arrays which are left, which one has the smallest number of elements?
# - return the number of those elements
# ************** Code **************
def min_sub_length(array, int)
  subarrays = []
  counter = 0 # where to start slicing from
  counter2 = 0 # where to finish slicing
  while counter <= array.size - 1

    while counter2 <= array.size - 1   # this gets only the first round
      subarray = array.slice(counter, counter2) # use slice here!
      subarrays << subarray
      counter2 += 1
    end

    counter += 1
    counter2 = 1 # that is why I need to zero the second counter!
  end

  subarrays.select! { |subarr| subarr.sum >= int }

  return 0 if subarrays.empty?

  subarrays.min_by { |array| array.size }.size
end
p min_sub_length([2, 3, 1, 2, 4, 3], 7) == 2
p min_sub_length([1, 10, 5, 2, 7], 9) == 1
p min_sub_length([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
p min_sub_length([1, 2, 4], 8) == 0

puts

#adil's solution
=begin
Given an array of n positive integers and a positive integer, find the minimal length of a contiguous subarray for which the sum >= integer.
restate the problem:
  find the min length array the sum of the elements of which is greater or even the integer given
Array of integers, integer -> array length
Explicit rules:
  - sum of consecutive elements is compared against the given Integer
implicit rules:
  - assume non-empty array is given
mental model:
  ([2, 3, 1, 2, 4, 3], 7) == 2
  [[1,2,2,3,3,4] [1,2,2,3] [2,2,3] [3,3,4] [3,4]]
ds: Array
algorithm:
initialize a results Array
sort the given Array
for each element of the subarray:
  initialize a subarray
  append the values until the sum of the subarray is greater or equal to num
  append the subarr to results
select the subarr in the array with the least length
return the sum of the subarr
=end
def minSubLength(arr, num)
  results_array = []
  subarr = []

  (0...arr.size).each do |i| #excluding the array size, nice!
    (i ... arr.size).each do |ii|
      break if subarr.sum >= num
      subarr << arr[ii] #adding elements from the array until their sum is equal or greater than num
    end
    results_array << subarr
  end
  results_array
  #
  # tt = results_array.select do |subarr| #this gives us all arrays which, when summed, give us the required int, equal or greater than the 2nd argument
  #   subarr.sum >= num
  # end
  #
  # zz = tt.map do |sub|
  #   sub.size # this results in 1 array with the sizes of all subarrays
  # end
  #
  # zz.min
end
p minSubLength([2, 3, 1, 2, 4, 3], 7) #== 2
# p minSubLength([1, 10, 5, 2, 7], 9) == 1
# p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
# p min_sub_length([1, 2, 4], 8) == 0

