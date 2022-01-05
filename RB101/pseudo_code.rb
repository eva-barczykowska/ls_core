# Please see line 75 for EXERCISES
# below are notes from the class
#
# example of some pseudo-code for a method that determines
# which number is greatest in a collection:

# 1.
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

# 1. The logical problem domain layer.
# 2. The syntactical programming language layer.
# When you're not yet fluent in a programming language, doing both at the same time
#  can be very difficult and frustrating.
#
# This is where pseudo-code comes in to play. Using pseudo-code helps us focus on
# the LOGICAL DOMAIN LAYER, without dragging us down to the programming language layer.

# START	--- start of the program
# SET	--- sets a variable we can use for later
# GET	--- retrieve input from user
# PRINT	--- displays output to user
# READ	--- retrieve value from variable
# IF / ELSE IF / ELSE	--- show conditional branches in logic
# WHILE	--- show looping logic
# END	--- end of the program

# we use the above words when we translate our logic to FORMAL PSEUDO-CODE

# START
#
# # Given a collection of integers called "numbers"
#
# SET iterator = 1
# SET saved_number = value within numbers collection at space 1
#
# WHILE iterator <= length of numbers
#   SET current_number = value within numbers collection at space "iterator"
#   IF saved_number >= current_number
#     go to the next iteration
#   ELSE
#     saved_number = current_number
#
#   iterator = iterator + 1
#
# PRINT saved_number
#
# END

def find_greatest(numbers)
  saved_number = nil

  numbers.each do |num|
    saved_number ||= num  # assign to first value
    if saved_number >= num
      next
    else
      saved_number = num
    end
  end

  saved_number
end
p find_greatest([2, 6, 7, 44,5])

# ***************************************EXERCISES*******************************************************

# remarks from Srđan Ćorić
# - include input and output
# - include 'higher level algorithm', which in these small problems will just be the goal of the problem
# - in more complex problems, higher level algorithm would consist of multiple smaller goals
# - we are doing this in order to keep in mind at all times what is our goal, while we write implementation details
# - in more complex problems, you would have several of those goals making the algorithm, for example:
# find all the substrings from a given string
# select only palindrome substrings
# sort palindrome substrings and return the longest one


# Write in pseudo-code(both casual and formal):

# ------ 1) a method that returns the sum of two integers

# ***CASUAL***
# input: 2 integers
# output: 1 integer
# highlevel algorithm: add 2 integers
# Given there are 2 integers
#
# add one to another
# save the result to a variable
#
# return the result


# ***FORMAL***
# START
#
# Given 2 integers called number1 and number2
#
# SET the result = add number1 and number2
#
# PRINT result
#
# END

# ------- 2)a method that takes an array of strings, and returns a string that is all those strings concatenated together

# ***CASUAL***

# input: an array of strings
# output: 1 string
# Highlevel goal: Concatenate all the strings from the given array

# Given an array of strings
#
# iterate through this array
# while iterating concatenate all those strings together
# save the result a a new variable
#
# return that variable

# ***FORMAL***
# START
#
# Given an array of strings
#
# SET iterator = 0
# SET the result variable
# WHILE iterator <= size of the array
#  SET result to the previous + this iteration (concatenate)
#
# PRINT result
#

# ------- 3) a method that takes an array of integers, and returns a new array with every other element
#
# ***CASUAL***
# input: array of integers
# output: an array of integers
# highlevel algorithm: add every odd element in the array
# Given an array of integers
#
# make a new array which will be the result
# iterate over the array
# add to the result array the first element and skip the next. Like this proceed until the last element of the array
#
# print the result

# ***FORMAL***
# START
#
# Given an array of integers
#
# SET result = array
# SET the counter
# WHILE counter < array size
#   iterate over the array elements
#   add to the result first element and skip the next element
#
# return the result
#
# END
#
# ------- 4) a method that determines the index of the 3rd occurrence of a given
# character in a string. For instance, if the given character is 'x' and the string
# is 'axbxcdxex', the method should return 6 (the index of the 3rd 'x').
# If the given character does not occur at least 3 times, return nil.

# ***CASUAL***
# input: string
# output: integer
# goal: return the index of the 3rd occurrence of a given character in a string
# algorithm:
# - determine if a given character occurs at least 3 times (count method)
# - if it does not occur at least 3 times, return nil
# - if it does occur at least 3 times, iterate through a string
# - find all occurences of the character
# - determine which is the 3rd occurence
# return the index for the 3rd occurence of that character

def find_3rd_character(str, character)
  how_many = str.count(character)
  if how_many < 3
    return nil
  else
    occurences = (0 ... str.length).find_all { |index| str[index] == 'x' }
  end
  occurences[2]
end

str = 'axbxcdxex'
char = 'x'
p find_3rd_character(str, char)
# ------- 5) a method that takes two arrays of numbers and returns the result of
# merging the arrays. The elements of the first array should become the elements
# at the even indexes of the returned array, while the elements of the second
# array should becoome the elements at the odd indexes. For instance:
# merge([1, 2, 3], [4, 5, 6]) # => [1, 4, 2, 5, 3, 6]
# You may assume that both array arguments have the same number of elements.

# ***CASUAL***
# input: 2 arrays of numbers
# output: the result of merging of the 2 arrays, elements of the 1st array should become
# elements at the even indexes of the returned array
# elements of the 2nd array should become the elements at the odd indexes
# example: merge([1, 2, 3], [4, 5, 6]) # => [1, 4, 2, 5, 3, 6]
# algorithm:
# - create a result array
# - iterate through both the arrays
# - add all elements from the 2nd array to the indexes on the result array which are odd
# - add all elements from the 1st array to the indexes of the result array that are even
# - return the result array

puts "merge method:"
def merge(arr1, arr2)
  i = 0
  result = []
  k = 0
  j = 0
  while i < arr1.size
    result[k] = arr1[i]
    i += 1
    k += 1

    result[k] = arr2[j]
    j += 1
    k += 1
  end

  result
end

arr1 = [1, 2, 3]
arr2 = [4, 5, 6]
p merge(arr1, arr2)
