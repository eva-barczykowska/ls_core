require 'pry'
require 'pry-doc'

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

puts ""
#and now a solution I liked a lot
# puts ""
# puts "TALLY - ZESTAWIENIE, calculate the total number of"
# puts "And using the tally method it's just 1 line!!!"
# puts "Returns a hash containing the counts of equal elements:"
# puts "Each key is an element of self."
# puts "Each value is the number elements equal to that key."
# p %w[a b c b c a c b].tally # => {"a"=>2, "b"=>3, "c"=>3}
#
# puts "With a hash argument, that hash is used for the tally (instead of a new hash),"
# puts "and is returned; this may be useful for ACCUMULATING TALLIES ACROSS MULTIPLE ENUMERABLES:"
#
# hash = {}
# hash = %w[a c d b c a].tally(hash)
# p hash # => {"a"=>2, "c"=>2, "d"=>1, "b"=>1}
#
# p hash = %w[b a z].tally(hash)
# p hash # => {"a"=>3, "c"=>2, "d"=>1, "b"=>2, "z"=>1}
#
# hash = %w[b a m].tally(hash)
# p hash # => {"a"=>4, "c"=>2, "d"=>1, "b"=>3, "z"=>1, "m"=> 1}
#
puts "key method returns the key for the first-found entry with the given value"
def find_dup(array)
  binding.pry
  array.tally.key(2)
end

p find_dup([1, 5, 3, 1]) == 1
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
