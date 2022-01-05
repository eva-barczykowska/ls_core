# Given a collection of integers.
#
# Iterate through the collection one by one.
#   - save the first value as the starting value.
#   - for each iteration, compare the saved value with the current value.
#   - if the saved value is greater, or it's the same
#     - move to the next value in the collection
#   - otherwise, if the current value is greater
#     - reassign the saved value as the current value
#
# After iterating through the collection, return the saved value.

arr = [2, 4, 5, 3, 8, 44,22, 9, 9]

def find_greatest(array)
  saved_number = arr[0]

  arr.each do |number|
    if saved_number >= number
      next
    else
      saved_number = number
    end

   saved_number
 end
