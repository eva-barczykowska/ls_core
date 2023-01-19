# Practice Problem 1
# How would you order this array of number strings by descending numeric value?
puts "Practise Problem 1"
arr = ['10', '11', '9', '7', '8']
p arr.sort { |a, b| b.to_i <=> a.to_i }

# STRINGS ARE COMPARED BY CHARACTER so '11' would be evaluated less than '7'

puts

# Practice Problem 2
# How would you order this array of hashes based
# on the year of publication of each book, from the earliest to the latest?
#
puts "Practise Problem 2"
books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

res = books.sort_by do |hash|
  hash[:published]
end

puts res
puts

# Practice Problem 3
# For each of these collection objects demonstrate how you would reference the letter 'g'.

puts "Practise Problem 3"

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
# arr1 = --0th-->['a', 'b', --1st-->['c', --2nd-->['d', 'e', 'f', 'g']]]
p arr1
letter_g = arr1[2][1][-1]
p letter_g

puts
arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
p arr2
letter_g = arr2[1][:third][0]
p letter_g

arr3 = [['abc'], ['def'], {third: ['ghi']}]
p arr3
letter_g = arr3[2][:third][0][0]
p letter_g

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
p hsh1
letter_g = hsh1['b'][1]
p letter_g

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
p hsh2
letter_g = hsh2[:third].keys[0]
p letter_g

puts

# **** finished here for today, continue tomorrow ---analyze LS solutions as well ****
# Examples:
#   before:
#   [{a: 2}, {b: 3, c: 4}, {d: 5, e: 6, f: 7}]
# after:
#   [{a: 3}, {b: 4, c: 5}, {d: 6, e: 7, f: 8}]
#
# -----------------------
# Data Structure: Transforming input array elements into a new array of hashes
# Algorithm:
#   - Initialize 'new_arr' to iterating through each array element in the original array to trasform and return results into a new array
# - Iterate through each hash key/value pair to increment each hash key value by 1
#
#
# -----------------------
# Code:
arr = [{a: 2}, {b: 3, c: 4}, {d: 5, e: 6, f: 7}]

my_hash = {d: 5, e: 6, f: 7}
p my_hash.transform_values { |value| value += 1 }


#  new_arr = arr.map do |hsh|
#   hsh.each { |k, v| hsh[k] += 1 }
#   end

new_arr = arr.map do |hsh|
  hsh.each_value { |v| v += 1 }
end

p new_arr

# var = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |subhash|
#   subhash.each do |key, integer|
#     subhash[key] = integer + 1
#   end
#   end

=begin
Using the each method, write some code to output all of the vowels from the strings.
=end

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

VOWELS = 'aeouiAEOUI'
hsh.each { |key, value| value.join.split("").select { |char| p char if VOWELS.include?(char) }}


# VOWELS = 'aeoui'
# hsh.each { |key, value| value.join.split("").each { |char| p char if VOWELS.include?(char) }}


hsh.each { |key, value| value.join.split("").each {|char| char =~ /aeiou/ } }

puts

# Practice Problem 11
# Given the following data structure use a combination of methods,
# including either the select or reject method,
# to return a new array identical in structure to the original but
# containing only the integers that are multiples of 3.

arr = [[2], [3, 5, 7, 12], [9], [11, 13, 15]]

# Expected result: [[], [3, 12], [9], [15]]

threes = arr.map do |subarr|
  subarr.select do |ele|
    ele % 3 == 0
  end
end

p threes
p threes == [[], [3, 12], [9], [15]]

# Practice Problem 12
# Given the following data structure, and without using the Array#to_h method,
# write some code that will return a hash where the key is the first item
# in each sub array and the value is the second item.

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

h = arr.each_with_object({}) { |subarray, h| h[subarray[0]] = subarray[1] }

p arr
p h
p h == {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}
