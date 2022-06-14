=begin
Problem

write a method that takes an integer and returns the index location of the first number that matches the number of digets given as the Integer

Implicit rule:
index location is starting 1

input Integer
min array (build up the fibonnacci sequence)
output integer (reference to the index)

Algortithm
build up an array of the fibonnacci numbers and keep build until the last entry's lenght is the given Integer
return the last size -1 of the array

given number_length
set array [1, 1]
iterate through the numbers until the last number is == number_length
last two numbers of the array and push their sum into the Array
test the length of the last element of the array


=end

# def find_fibonacci_index_by_length(int)
#   fibs = [1, 1]
#
#   loop do
#     break if fibs[-1].to_s.size == int
#     fibs << fibs[-2] + fibs[-1]
#   end
#
#   fibs.size
# end
#
# p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
# p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
# p find_fibonacci_index_by_length(10) == 45
# p find_fibonacci_index_by_length(100) == 476
# p find_fibonacci_index_by_length(1000) == 4782
# p find_fibonacci_index_by_length(10000) == 47847

#######################################################################################
puts ""
# Write a method that takes an array of strings, and returns an array of the same string values, except with the vowels (a, e, i, o, u) removed.

# PEDAC

# Problem
# -I have an array of strings
# -I need to write a method that returns the SAME array of strings (I'm thinking mutation here) but without vowels
# -method returns THE SAME array but mutated (vowels removed!)

# Examples

# remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
# remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
# remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

# Data Structures
# -input: Array of strings
# -ouput: Array of strings

# Algortithm
# I split this loging into 2 cases.
# First case is if the array has only 1 element.
# In this case, I will join this array in order to have a string so that I can delete vowels from this string.
# Then I will split this string to get an array, which I will explicitely return.
#
# If my array has more than 1 element thouth, my approach will be slightly different.
# I will initialize a res variable referencing an empty array.
# I will start with the each method to get access to every word.
# I will append to the empty result array each word, but with vowels removed.
# Then I will implicitly return the result

def remove_vowels(array)
  result = []
  if array.size == 1
    array = array.join(" ").delete('aeiouAEOUI').split
    return array
  else
    array.each do |word|
      result << word.delete('aeiouAEOUI')
    end
  end
  result
end

p remove_vowels(['abcdefghijklmnopqrstuvwxyz']) ==['bcdfghjklmnpqrstvwxyz']
p remove_vowels(['green', 'YELLOW', 'black', 'white']) == ['grn', 'YLLW', 'blck', 'wht']
p remove_vowels(['ABC', 'AEIOU', 'XYZ']) == ['BC', '', 'XYZ']

puts ""
# Write a method that takes an Array as an argument, and returns two Arrays
# (as a pair of nested Arrays) that contain the first half and second half of the
# original Array, respectively. If the original array contains an odd number of
# elements, the middle element should be placed in the first half Array.

=begin
given an array with elements and splitting the elements into two separate arrays,
by cutting them in half. If the size of the array is odd, the middle element goes
into the first Array

input array of integers
output is and array with two nested Arrays

Algortithm
- get the size of the array and divide by a float 2.0 rounding up to th nearest Integer

- two iterations
  the first array will get pushed the elements until the counter is at the halfway mark
  the second array will get the last elements of the origunal Array

push both arrays into a new array and return


=end

def halvsies(array)
  half = (array.size / 2.0).ceil

  first_half = array[0, half]
  second_half = array[half, array.size - half]

  [first_half, second_half]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]

puts ""
# So the slice array starts with the first element mentioned(we slice from this element, including)
# and then we mention the number of elements so
# array = [1, 2, 3, 4, 5]
# array[0, 3] #=> will give me [1, 2, 3]
# array[0, 2] #=> will give me [1, 2]
# array[0, 4] #=> will give me [1, 2, 3, 4]
# array[0, 5] #=> will give me [1, 2, 3, 4, 5]

# Given an unordered array and the information that exactly one value in the
# array occurs twice (every other value occurs exactly once), how would you
# determine which value occurs twice? Write a method that will find and return
# the duplicate value that is known to be in the array.

# PEDAC
# Problem
# -I have an array of unordered numbers
# -there is 1 number that occurs twice in the array
# -write a method that finds and returns this number

# Examples

# Data Structures
# input: array
# output: an integer

# Algortithm
# -find the uniq elements in the array
# -compare the array with uniq elements with the original array
# loop over all the numbers, and if you encounter a number that you have seen
# before, return it
# -see which element is extra

# # Code
# def find_dup(array)
#   counter = 0
#   temp = []
#   result = []
#   while counter <= array.size
#     if !temp.include?(array[counter])
#       temp << array[counter]
#     else
#       result << array[counter]
#     end
#     counter += 1
#   end
#
#   result[0]
# end
puts "About the count method"
puts "without any arguments or a block it counts just the number of elements, like size"
arr = [0, 1, 2, 3, 4, 5, 5, 5, 555, 5]
p arr.count

puts "counting specific elements = how many of them?"
#With argument obj, count returns the count of elements == to obj:
arr = [0, 1, 2, 3, 4, 5, 5, 5, 555, 5]
p arr.count(0)
p arr.count(5)

puts "count with a block - returns all elements for which the block is evaluates to true"
# With no argument and a block given, calls the block with each element;
# returns the count of elements for which the block returns a truthy value:
arr = [0, 1, 2, 3]
p arr.count {|element| element > 1} # => 2

arr = [1, 5, 3, 1]
arr.select { |num| arr.count(num) >= 2 }
# solution I liked
def find_dup(array)
  array.select { |num| array.count(num) >= 2 }.pop
end

p find_dup([1, 5, 3, 1])# == 1
p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73
