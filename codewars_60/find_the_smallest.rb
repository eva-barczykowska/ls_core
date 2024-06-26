# https://www.codewars.com/kata/573992c724fc289553000e95/train/ruby
#
# You have a positive number n consisting of digits. You can do at most one operation: Choosing the index of a digit in the number, remove this digit at that index and insert it back to another or at the same place in the number in order to find the smallest number you can get.
#
#   Task:
#   Return an array with
#   the smallest number you got
#   the index i of the digit d you took, i as small as possible
#   the index j (as small as possible) where you insert this digit d to have the smallest number.
#
#   Examples:
#
#   smallest(261235) --> [126235, 2, 0] or (126235, 2, 0) or "126235, 2, 0"
#
#   126235 is the smallest number gotten by taking 1 at index 2 and putting it at index 0
#
#
#
#   smallest(209917) --> [29917, 0, 1]
#
#
#
#   [29917, 1, 0] could be a solution too but index `i` in [29917, 1, 0] is greater than
#
#   index `i` in [29917, 0, 1].
#
#   29917 is the smallest number gotten by taking 2 at index 0 and putting it at index 1 which gave 029917 which is the number 29917.
#
#
#
#   smallest(1000000) --> [1, 0, 6] or ...
#
#   Note
#
#   Have a look at "Sample Tests" to see the input and output in each language
#
#
#
#   Problem
#
#   =======
#
#   -method takes 1 argument, a number
#
#   -method returns an array with 3 elements:
#
#   --the smallest number possible
#
#   --index i of the digit I took --the smallest possible index
#
#   --index j where I insert this digit d --the smallest possible index
#
#
#
#   Examples
#
#   ========
#
#   smallest(261235) == [126235, 2, 0]
#
#   126235 is the smallest number gotten by taking 1 at index 2 and putting it at index 0
#
#   =>
#
#   126235 - smallest number
#
#   2, index from there d was taken
#
#   0, index where d was put
#
#   breakup
#
#   =======
#
#   2 6 1 2 3 5
#
#   0-1-2-3-4-5
#
#   --------we take d(igit) from index 0 and put it at---
#
# index 0 -> 261235 - original number
#
# index 1 -> -21235 - the smallest number for this round 21235
#
# index 2 -> -62235
#
# index 3 -> -61235
#
# index 4 -> -61225
#
# index 4 -> -61232
#
#
#
# --------we take d(igit) from index 1 and put it at---
#
# index 0 -> 6-1235
#
# index 1 -> 261235 - original number
#
# index 2 -> 2-6235
#
# index 3 -> 2-1635
#
# index 4 -> 2-1265
#
# index 4 -> 2-1236 - the smallest number for this round 21236
#
#
#
# --------we take d(igit) from index 2 and put it at---
#
# index 0 -> 62-235
#
# index 1 -> 16-235
#
# index 2 -> 126235 - original number
#
# index 3 -> 12-635
#
# index 4 -> 12-265 - the smallest number for this round 12265
#
# index 4 -> 12-236
#
#
#
# --------we take d(igit) from index 3 and put it at---
#
# index 0 -> 226-35
#
# index 1 -> 126-35
#
# index 2 -> 122-35  - the smallest number for this round 12235
#
# index 3 -> 126235 - original number
#
# index 4 -> 126-25
#
# index 4 -> 126-32
#
#
#
# --------we take d(igit) from index 4 and put it at---
#
# index 0 -> 3262-5
#
# index 1 -> 1362-5
#
# index 2 -> 1232-5
#
# index 3 -> 1263-5
#
# index 4 -> 126235 - original number
#
# index 4 -> 1262-3 - the smallest number for this round 12623
#
#
#
# --------we take d(igit) from index 5 and put it at---
#
# index 0 -> 52623-
#
# index 1 -> 15623-
#
# index 2 -> 12523- the smallest number for this round 12523
#
# index 3 -> 12653-
#
# index 4 -> 12625-
#
# index 4 -> 126235 - original number
#
#
#
# smallest(209917) --> [29917, 0, 1]
#
#
#
# Agorithm
#
# =========
#
# separate concerns:
#
# 1. helper method
#
# takes `original_array` and `index_from `as an argument, which is the current index we're looking at in the main method
#
# INIT `smallest_number` to joined array (I need the original argument number)
# INIT `copy` to a copy of `original_array`
# INIT `digit` the digit at the current index in the `array`
# CHANGE `index_from `to NIL in `copy`
# INIT `index_to` to 0 - this is the counter/acts like a counter to iterate over all the indices
# INIT `result` to a nested array, first inner array is the array with `smallest_number`, `index_from` and `index_to`
#
#
# ITERATE over all the indices(`index_to`)
# --if index_to == index_from, skip it
# -- else replace the current `index_to` with `digit`
# --calculate the value of `smallest_number` generated by this array
# --if this number is smaller than the number that I currently have in `result1 in first array as first element
# --then save as another inner array [`smallest_number`, `index_from`, `index_to`]
# --reassign `copy` to the copy of `original_array`
#
# -increase `index_to` by 1
# -break if `index_to` is greater than the size of `copy` - 1
#
# --save number to `smallest_number` and `index_to` to `result` (`index_from `is already there)
# RETURN `result`
#
#
# 2.main method
# keys in the hash are from 0 to array.size, values are empty arrays
#
# TRANSFORM number to an array of digits, store in `array_of_digits`
#
# iterate over the array with index
#
# for each index call the helper method that takes the array and current_index as an argument
#
# -save the return value to `final_result` array, you should have as many inner arrays as the argument number has digits
#
# -select from `final_result` only inner arrays whose smallest number is mininum (only arrays with the smallest `smallest_number`)
#
# -then look at the min `index_from `and finally min `index_to`
#
# -so when I iterate I need to select an array where num is smallest, index_from is smallest and index_to is smallest
#
# -find the smallest_number from the smallest numbers in `result`
# RETURN the inner array that has those min values?????
p 1_000_000.digits.reverse
p 209_917.digits.reverse
def process_this_iteration(original_array, index_from)
  smallest_number = original_array.join.to_i
  copy = original_array.dup

  digit = original_array[index_from]
  # p "digit is #{digit}"
  # copy[index_from] = nil
  # p "copy is #{copy}" # [nil, 0, 0, 0, 0, 0, 0]

  index_to = 0
  result = [[smallest_number, index_from, index_to]]

  loop do
    copy[index_from] = nil
    copy[index_to] = digit
    p copy
    number = copy.join.to_i
    result << [number, index_from, index_to] if number < result[0][0]
    copy = original_array.dup # at each iteration come back to original state of copy
    index_to += 1
    break if index_to > copy.size - 1
  end
  p(result.sort_by! { |arr| arr[0] })

  # indices are in order of appearance
  indices = []
  (0...result.size).each do |start|
    (start...result.size).each do |finish|
      indices << [start, finish]
    end
  end
  p indices

  final = []
  indices.each do |indices_pair|
    result.each do |array|
      p indices_pair
      p array

      return array if indices_pair[0] == array[1] && indices_pair[1] == array[2] && array[0] < smallest_number
    end
  end
  # final
end
p process_this_iteration([1, 0, 0, 0, 0, 0, 0], 0)

# def smallest(number)
# end
# p smallest(261235) == [126235, 2, 0]
# p smallest(209917) == [29917, 0, 1]
# p smallest(1000000) == [1, 0, 6]

# [[1000000, 0, 0], [100000, 0, 1], [10000, 0, 2], [1000, 0, 3], [100, 0, 4], [10, 0, 5], [1, 0, 6]]
# [[209917, 0, 0], [29917, 0, 1], [2917, 0, 2], [9217, 0, 3], [9927, 0, 4], [9912, 0, 5]]
# find min number
# find min index from
# find min index to

# indice sto check
# 0,1
# 0,2
# 0,3
# 0,4
# 0,5

# indices = []
# iterate over the 2D array)
# (0...result.size).each do |start|
#   (starting_index..result.size).each do |finish|
#   indices << [start, finish]
#   end
# end
# p indices
