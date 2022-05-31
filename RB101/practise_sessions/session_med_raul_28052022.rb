puts "swap_letters:"
# Given a string of words separated by spaces, write a function that swaps the
# first and last letters of every word.

# You may assume that every word contains at least one letter, and that
# the string will always contain at least one word. You may also assume that
# each string contains nothing but words and spaces, and that there are
# no leading,trailing, or repeated spaces.

# PEDAC
# Problem
# -I have a string of words, separated by spaces
# -write a method that swaps first and last letters of every word
# -every word contains at least 1 letter
# -a string will always contain at least 1 word
# -string will contain only letters and spaces
# -there are no leading, trailing or repeated spaces
#
# Examples
# swap('Oh what a wonderful day it is') = "hO thaw a londerfuw yad ti si"
# swap('Abcde')= "ebcdA"
# swap('a') = "a"
#
# Data Structures
# -input: String
# -output: String
#
# Algorithm
# -check if it's just 1 letter and if yes, return that letter
# -check if it's just 1 word and if yes, then
# -take the first letter of that word and put it as last, return the string,
# maybe write a method for this?
# -if there is more than 1 word, use the method for each of these words
# -save the return value of that method into the result variable
# -return the result variable
#
# Code

def swap_letters(word)
  word.split
  p word
  word[0], word[-1] = word[-1], word[0]
  word
end

p swap_letters("Ewa")
p swap_letters("Evaluation") #the method works only for 1 word
p swap_letters("Hello there")

# def swap(str, swap_letters(word)) #I am calling a method in another method definition, this cannot be done LOL, what is interesting is the error
#   result = []
#   if str.size == 1
#     str
#   else str.size < 1
#     str.split.each do |word|
#       result << word.swap_letters(word) #I cannot call this method on word because it does not exist on a String, see down for correction
#     end
#   end
#     result.join
# end
#
# p swap("Evaluation")
# swap('Oh what a wonderful day it is') = "hO thaw a londerfuw yad ti si"
# swap('Abcde')= "ebcdA"
# swap('a') = "a"

puts ""
################################################################################
puts "running totals:"
# Write a method that takes an array of numbers and returns an array with
# the same number of elements, but with each element's value being the running
# total from the original array.

# PEDAC
# Problem
# -write a method
# -method takes an array of numbers as an argument
# -method returns an array with the same number of elements
# -in the returned array, each elements value is the running total from the
# original array
# -what is a running total?
# -running total is a sum of previous element and current element
# -example [2, 5, 13]) == [2, 7, 20] because 2+5 = 7 and then 7+13 = 20
# -if the argument is an empty array, we return the empty array
# -if the argument is an array with 1 number, we return that same array
# (there's nothing to sum)
#
# Examples
# runningTotal([2, 5, 13]) == [2, 7, 20]
# runningTotal([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
# runningTotal([3]) == [3]
# runningTotal([]) == []
#
# Data Structures
# -input: Array
# -output: Array
#
# Algorithm
# -define the result array
# -check if the argument array is empty and if yes, return that array
# -check if the argument array contains only 1 element and if yes, return that
# same array
# -else process the array, this is how
# -the first element will stay the same, push the first element into the
# result array
# -the second element will be the sum of the first and second, push the
# 2nd element into the result array
# -the third element will the the sum of second element and third, push the
# 3rd element into the result array
# -do this until you run out of elements in the array
# -return the resulting array

# Code

def running_total(array)
  result = []
  counter = 0
  if array.empty?
    return array
  elsif array.size == 1
    return array
  else
    result << array[0]
    while counter < (array.size - 1)
      result << result[counter] + array[counter + 1]
      counter += 1
    end
  end
  result
end

# Examples:

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

puts " "
################################################################################
puts "pasting all session content:"
n = 10

1.times do |n|
  n = 11
end

puts n #=>

# On line 1 we declare a locally-scoped variabe n and make it reference an Integer
# object 10. On line 3 we invoke the #times method on Integer 1 and pass it a block,
# denoted by the keywords do… end. and a block parameter |n|.
#   The block creates its own scope. Within the body of the block we declare
#   a block-scoped variable n and make it reference an Integer Object 11.
#   The question is what line 7 will ouput. It will output 10 because of a
#   concept called shadowing , the block scoped variable |n| covers
#   the main-scoped variable n and we are not able to access it and change it.
#   Therefore, it remains unchanged.
################################################################################
animal = "dog"

loop do |_|
  animal = "cat"
  break
end

puts animal # =>
################################################################################

animal = "dog"

loop do |animal|
  animal = "cat"
  break
end

puts animal # => "dog"

################################################################################
flag = false

until flag do #it is false, until it is true do....so now do....
  name = 'bob'
  break
end

puts name #=>

# # do...end create a block which has its own scope only when they follow a method invocation!!!
# # while, until, unless, if are not methods

################################################################################
def plus(x, y)
  x = x + y #x = 3 + 2
end

a = 3
b = plus(a, 2)

puts a
puts b

################################################################################
def change_name(name)
  name = 'bob'#does this reassignment change the object outside the method?
end

name = 'jim'
change_name(name)
puts name

################################################################################
def cap(str)
  str.capitalize!   # does this affect the object outside the method?
end

name = "jim"
cap(name)
puts name

################################################################################
puts ""

a = [1, 'bob']
arr = [a, b]
p arr.object_id
p arr # [[1, 3], [2]]

a[1] = 'suzy' # we change the pointer at index position 1

#index assignment is mutating with respect to the array object, replaces the element, mutates the state of the array object
p arr # =>[[1, 'suzy'], [2]] the value at index 1 was replaced
p arr.object_id

puts ""

################################################################################
arr1 = ["a", "b", "c"]
arr2 = arr1.dup

# arr = [1, 2, 3]
puts "array1:"
p arr1.object_id # 60
puts "array2:"
p arr2.object_id # 80

puts "object at index 0 in array1:"
p arr1[0].object_id # 100
puts "object at index 0 in array2:"
p arr2[0].object_id # 100

puts ""

arr2.map! do |char| # replaces each element with the return value of the block
  char.upcase # is the elem affected or the other array? here we are mutating the state of the outer array, we work on array level
end

p arr1 # ['a', 'b', 'c']
p arr2 # ["A", "B", "C"]

puts "first array stays the same, 2nd got mutated:"
p arr1.object_id # 60
p arr2.object_id # 80
puts ""
################################################################################
arr1 = ["a", "b", "c"]
arr2 = arr1.dup

puts "first array:"
p arr1.object_id # 60
puts "second array:"
p arr2.object_id # 80

puts ""

puts "object id of the element at index 0 in array1"
p arr1[0].object_id # 100
puts "object id of the element at index 0 in array2"
p arr2[0].object_id # 100

arr2.map! do |char|
  char.upcase! #is the element affected of the array? Here we are mutating the element, we work on element level
end

puts ""

puts "both arrays, array1 and array2 got mutated:"
p arr1 #["A", "B", "C"]
p arr2 #["A", "B", "C"]

puts ""
################################################################################

arr1 = ["a", "b", "c"]
arr2 = arr1.dup

puts "array1 and array2 object ids:"
p arr1.object_id # 60
p arr2.object_id # 80

puts ""

puts "element at index 0 in array1 and element at index 0 in array2 - ids:"
p arr1[0].object_id # 100
p arr2[0].object_id # 100

arr2.select! do |char|
  char == 'a' || char == 'b'
end

puts ""

p arr1
p arr2

puts ""
################################################################################

# Given a string of words separated by spaces, write a function that swaps the
# first and last letters of every word.

# You may assume that every word contains at least one letter, and that
# the string will always contain at least one word. You may also assume that
# each string contains nothing but words and spaces, and that there are
# no leading, trailing, or repeated spaces.

# Examples:

# swap('Oh what a wonderful day it is');  // "hO thaw a londerfuw yad ti si"
# swap('Abcde');                          // "ebcdA"
# swap('a');                              // "a"

#Raul
=begin
Problem
Write a 'swap' method that takes a string of words as a parameter and swaps the first and last letter of every word.
assume every word contains at least one letter, and every string contains at least one word.
The string will only contain words and spaces.

Examples/Data cases

swap('Oh what a wonderful day it is');  // "hO thaw a londerfuw yad ti si"
swap('Abcde');                          // "ebcdA"
swap('a');                              // "a"

Data Structures
The method will return a string
input: a string of words separated by spaces
output: a string of words separated by spaces but the first and last letter of every word will be swapped.

Algorithm
#split/join
- utilize the split method to split the string into an array of substrings containing the words separated by spaces
- use the each method to iterate over every elements (word) in the the array and assign the return value to the variable "swapped_str"
- initialize a variable "first" within the block to save the value of the first indexed element (first letter of the word)
- use indexed assignement to assign the value at index 0 (first letter) to the value at index -1 (last letter)
- index 0 and -1 now contain the same letter
-use indexed assignement to assign the value at index -1 to the value we saved to the variable first (original first letter)
- use the join method with a space as an argument to rejoin the elements of the array back into a string with the now swapped words separated by spaces

=end

def swap(str)
  swapped_str = str.split.each do |word|
    first = word[0]
    word[0] = word[-1]
    word[-1] = first
  end
  swapped_str.join(' ')
end

p swap('Oh what a wonderful day it is') == "hO thaw a londerfuw yad ti si"
p swap('Abcde') == "ebcdA"
p swap('a') == "a"

puts ""
# ##############################################################################
# # PEDAC
# # Problem
# # -I have a string of words, separated by spaces
# # -write a method that swaps first and last letters of every word
# # -every word contains at least 1 letter
# # -a string will always contain at least 1 word
# # -string will contain only letters and spaces
# # -there are no leading, trailing or repeated spaces

# # Examples
# # swap('Oh what a wonderful day it is') = "hO thaw a londerfuw yad ti si"
# # swap('Abcde')= "ebcdA"
# # swap('a') = "a"

# # Data Structures
# # -input: String
# # -output: String

# # Algorithm
# # -check if it's just 1 letter and if yes, return that letter
# # -check if it's just 1 word and if yes, then
# # -take the first letter of that word and put it as last, return the string, maybe write a method for this?
# # -if there is more than 1 word, use the method for each of these words
# # -save the return value of that method into the result variable
# # -return the result variable

puts ""

def swap_letters(word)
  word[0], word[-1] = word[-1], word[0]
  word
end

p swap_letters("Ewa")

puts ""

def swap(str)  # 1
  result = []
  if str.size == 1
    return str       # 2
  else str.size > 1
    str.split.each do |word|
      result << swap_letters(word)
    end
  end

  result.join(" ")
end

p swap('Oh what a wonderful day it is') == "hO thaw a londerfuw yad ti si"
p swap('Abcde') == "ebcdA"
p swap('a') == "a"

puts ""
# # In Ruby:
# # blocks
# # variables
# # methods
# # ARE NOT OBJECTS
################################################################################

# Write a function that takes an array of numbers and returns an array with
# the same number of elements, but with each element's value being the running
# total from the original array.

# Examples:

# runningTotal([2, 5, 13])             // [2, 7, 20]
# runningTotal([14, 11, 7, 15, 20])    // [14, 25, 32, 47, 67]
# runningTotal([3])                    // [3]
# runningTotal([])                     // []

# Raul
=begin
Problem
Write a method that takes an array of number and returns an array with the same
number of elements but the value
of every element is the running total from the original array.
running total? (based on test cases every element in array will be the element
added to the previous element in the original array)

Examples/Test cases

runningTotal([2, 5, 13]);             // [2, 7, 20]
runningTotal([14, 11, 7, 15, 20]);    // [14, 25, 32, 47, 67]
runningTotal([3]);                    // [3]
runningTotal([]);                     // []

Data structures
Returns an array of numbers
input: array of numbers
output: array of numbers with every element being the running total
if the input is an empty array return an empty array

Algorithm
- define a runningTotal method that takes an array (arr) as a argument
- use the each_with_index method to iterate over every element (num) of
-the array but have access to the index (idx) aswell and initialize
  the return value to the variable "running_total"
- initialize a variable "current_idx" to the integer 0
- start a loop
- if idx > 0 do num[current_idx] += num[idx]
  else do num[current_idx] = num[idx]
- add 1 to "current_idx"
- break when the running_total.size == arr.size
- return new array
=end

# def runningTotal(array)
#   running_total = array.each_with_object([]) do |num, arr|
#     if arr[0] # 2
#       arr << num # iteration 1: 2, iteration 2: 5, iteration 3: 13
#     else
#       arr << num +
#     end
#   running_total [2, 5, 13]
# end
#
# runningTotal([2, 5, 13]);             == [2, 7, 20]
# runningTotal([14, 11, 7, 15, 20]);    # [14, 25, 32, 47, 67]
# runningTotal([3]);                    == [3]
# runningTotal([]);                     == []

################################################################################
# Write a function that takes an array of numbers and returns an array with
# the same number of elements, but with each element's value being the running
# total from the original array.
# PEDAC
# Problem
# -write a method
# -method takes an array of numbers as an argument
# -method returns an array with the same number of elements
# -in the returned array, each elements value is the running total from the original array
# -what is a running total?
# -running total is a sum of previous element and current element
# -example [2, 5, 13]) == [2, 7, 20] because 2+5 = 7 and then 7+13 = 20
# -if the argument is an empty array, we return the empty array
# -if the argument is an array with 1 number, we return that same array (there's nothing to sum)
#
# Examples
# runningTotal([2, 5, 13]) == [2, 7, 20]
# runningTotal([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
# runningTotal([3]) == [3]
# runningTotal([]) == []
#
# Data Structures
# -input: Array
# -output: Array
#
# Algorithm
#VERY IMPORTANT==================keep consinstent WHAT you are returning =================================================================
# -define the result array
# -check if the argument array is empty and if yes, return that array
# -check if the argument array contains only 1 element and if yes, return that same array
# -else process the array, this is how
# -the first element will stay the same, push the first element into the result array
# -the second element will be the sum of the first and second, push the 2nd element into the result array
# -the third element will the the sum of second element and third, push the 3rd element into the result array
# -do this until you run out of elements in the array
# -return the resulting array

# Code

def running_total(array)
  result = [] #be consistent in what you are returning
  counter = 0
  if array.empty? || array.size == 1
    result = array #be consistent in what you are returning
    return result
  else
    result << array[0]
    while counter < (array.size - 1)
      result << result[counter] + array[counter + 1]
      counter += 1
    end
  end
  result
end
p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

puts ""

#corrected
def running_total(array)
  result = []
  counter = 0
  if array.empty? || array.size == 1
    return array
  else
    result << array[0]
    while counter < (array.size - 1)
      result << result[counter] + array[counter + 1]
      counter += 1
    end
  end
  result
end
p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

puts ""

# improved
def running_total(array)
  result = []
  counter = 0
  if array.empty? || array.size == 1
    result = array
    return result
  else
    result << array[0]
    while counter < (array.size - 1)
      result << result[counter] + array[counter + 1]
      counter += 1
    end
  end
  result
end

# Examples:

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

puts ""
################################################################################
# APPROACH 1:
puts "Approach 1:"

def running_total(arr)
  sum = 0
  result = []

  arr.each do |e|
    sum += e
    result.push(sum)
  end

  result
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

puts ""

# APPROACH 2:
puts "Approach 2:"

def running_total(arr)
  sum = 0

  arr.each_with_object([]) do |e, result|
    sum += e
    result.push(sum)
  end
end
p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

puts ""
# Approach 3:
puts "Approach 3:"

def running_total(arr)
  sum = 0

  arr.reduce([]) do |result, e|
    sum += e
    result.push(sum)
    result
  end
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []
