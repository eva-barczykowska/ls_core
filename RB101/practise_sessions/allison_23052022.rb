# Easy 6; number 6
# Write a method that takes two Arrays as arguments, and returns an Array that
# contains all of
# the values from the argument Arrays.
# There should be no duplication of values in the returned
# Array, even if there are duplicates in the original Arrays.

# PEDAC
# Problem
# -a method that takes 2 arrays as arguments
# -returns an array that contains all values from the 2 argument arrays
# -no values should be duplicated in the returned array
# -input: 2 arrays
# -output: 1 array
# Examples
# merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
# merge([2, 3, 5], [2, 5, 6, 9]) == [2, 3, 5, 6, 9]
# Data Structures
# ???==you can omit it
# Array
# Algorithm
# -in the body of the method add the 2 arrays
# -remove duplicate values
# -return the array
# Code

# def merge(arr1, arr2)
#   arr1.concat(arr2).uniq
# end
# p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
# p merge([2, 3, 5], [2, 5, 6, 9]) == [2, 3, 5, 6, 9]

#Algorithm
# -loop through the first array and add all elements to the result array
# -loop through the second array
# -check if the element of this counter is there, if it is, skip it, if not,
#  add it

def merge(arr1, arr2)
  counter = 0
  counter2 = 0
  result = []
  while counter < arr1.size
    result << arr1[counter]
    counter += 1
    p counter
  end
  p result

  while counter2 < arr2.size
    unless result.include?(arr2[counter2])
      result << arr2[counter2]
    end
    counter2 += 1
  end
  result
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
p merge([2, 3, 5], [2, 5, 6, 9]) == [2, 3, 5, 6, 9]

# Print your values as you go and make sure they are what you expect.
# Start from the top down.
# Run your code after every significant change.
