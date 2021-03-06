# Sorting, Nested Collections and Working with Blocks

# Practice Problem 1
# How would you order this array of number strings by descending numeric value?

arr = ['10', '11', '9', '7', '8']

arr.sort do |a, b|
  b.to_i <=> a.to_i
end

puts "************************************************************************"

# Practice Problem 2
# How would you order this array of hashes based on the year of publication of
# each book, from the earliest to the latest?

books = [
  { title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967' },
  { title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925' },
  { title: 'War and Peace', author: 'Leo Tolstoy', published: '1869' },
  { title: 'Ulysses', author: 'James Joyce', published: '1922' }
]

books.sort_by do |hash|
  hash[:published]
end

puts "************************************************************************"

# Practice Problem 3
# For each of these collection objects demonstrate how you would reference
# the letter 'g'.

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]

arr2 = [{ first: ['a', 'b', 'c'], second: ['d', 'e', 'f'] }, { third: ['g', 'h', 'i'] }]

arr3 = [['abc'], ['def'], { third: ['ghi'] }]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}

hsh2 = { first: { 'd' => 3 }, second: { 'e' => 2, 'f' => 1 }, third: { 'g' => 0 } }

p arr1[2][1][3]

p arr2[1][:third][0]

p arr3[2][:third][0][0]

p hsh1['b'][1]

p hsh2[:third].keys[0]

puts "************************************************************************"

# Practice Problem 4
# For each of these collection objects where the value 3 occurs, demonstrate
# how you would change this to 4.

arr1 = [1, [2, 3], 4]

arr2 = [{ a: 1 }, { b: 2, c: [7, 6, 5], d: 4 }, 3]

hsh1 = { first: [1, 2, [3]] }

hsh2 = { ['a'] => { a: ['1', :two, 3], b: 4 }, 'b' => 5 }

arr1[1][1] = 4
p arr1

arr2[2] = 4
p arr2

hsh1[:first][2] = 4
p hsh1

hsh2[['a']][:a][2] = 4 # this was interesting, I need to put [[]], double square braces, one for the key, and one because they key is an array
p hsh2

puts "************************************************************************"
# Practice Problem 5

# Figure out the total age of just the male members of the family.

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female" }
}
age = []
munsters.each do |munster|
  munster.each do |name|
    age << name["age"] if name["gender"] == "male"
  end
  age
end
p age.inject(:+)

# ls solution

total_male_age = 0 # remember to define this variable first and make it reference an integer 0
munsters.each do |name, details|
  total_male_age += details["age"] if details["gender"] == "male"
end

p total_male_age

puts "************************************************************************"

# Practice Problem 6

# One of the most frequently used real-world string properties is that of
# "string substitution", where we take a hard-coded string and modify it with
# various parameters from our program.
#
# Given this previously seen family hash, print out the name, age and gender
# of each family member:
# ...like this:
# (Name) is a (age)-year-old (male or female).

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |munster, details| # if it's a hash, it can have 2 block parameters, for key but also for value
  p "#{munster} is a #{details["age"]}-year-old #{details["gender"]}" # that's how we grab a part of the value
end
puts "************************************************************************"

# Practice Problem 7

# Given this code, what would be the final values of a and b? Try to work
# this out without running the code.

a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a

# p a
# p arr

a = 2
b = [3, 8]

puts "************************************************************************"

# Practice Problem 8

# Using the each method, write some code to output all of the vowels
# from the strings.

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

result = []
hsh.each do |key, details|
  details.each do |word|
    result << word.delete("^aeiou")
  end
end
p result
p result.join("")

puts "***"
# ls solution - done by me after reading the 'hint' section

VOWELS = 'aeiou'
hsh.each do |key, value|
  value.each do |word|
    p word.chars.select { |char| VOWELS.include?(char) }
  end
end

puts "***"

# exact solution by ls

vowels = 'aeiou'

hsh.each do |_, value|  # we are not concerned by key and here it's expressed by "_" block parameter choice
  value.each do |str|
    str.chars.each do |char|
      puts char if vowels.include?(char)
    end
  end
end

puts "************************************************************************"

# Practice Problem 9

# Given this data structure, return a new array of the same structure but with
# the sub arrays being ordered (alphabetically or numerically as appropriate)
# in descending order.

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

sorted_descending = arr.each do |sub_arr|
  sub_arr.sort do |a, b|
    b <=> a
  end
end

p sorted_descending

puts "************************************************************************"

# Practice Problem 10

# Given the following data structure and without modifying the original array,
# use the map method to return a new array identical in structure
# to the original but where the value of each integer is incremented by 1.

arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

arr = arr.map do |hash|
  hash.map do |k, v|
    hash[k] = v.next
  end
end

p arr

# ls solution
[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hsh|
  incremented_hash = {} # define a new hash and add to it, then return it
  hsh.each do |key, value|
    incremented_hash[key] = value + 1
  end
  incremented_hash # returning the hash
end
# => [{:a=>2}, {:b=>3, :c=>4}, {:d=>5, :e=>6, :f=>7}]

# Here map is iterating through the array. On each iteration it is creating
# a new hash (incremented_hash) and then iterating through the hsh object for
# that iteration in order to add key-value pairs to this hash using the original
# keys but values incremented by 1. The outer block then returns this
# incremented_hash to map which uses it to transform each element in the array.
#
# When approaching problems like this there is often more than one way to solve
# them. Here is a solution to the same problem using each_with_object instead of map.

# same solution but using #each_with_object

[{ a: 1 }, { b: 2, c: 3 }, { d: 4, e: 5, f: 6 }].each_with_object([]) do |hsh, arr|
  incremented_hash = {}
  hsh.each do |key, value|
    incremented_hash[key] = value + 1
  end
  arr << incremented_hash
end
# => [{:a=>2}, {:b=>3, :c=>4}, {:d=>5, :e=>6, :f=>7}]

# Sometimes a particular method will be more suited than another. Here map is
# probably more suitable since we know it will return a new array in any case.
# When deciding which method to use it is important to clearly understand the
# method implementation, what arguments and blocks can be passed to it and its
# return value.

puts "************************************************************************"

# Practice Problem 11

# Given the following data structure use a combination of methods,
# including either the select or reject method, to return a new array identical
# in structure to the original but containing only the integers that are
# multiples of 3.

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]
result = arr.map do |sub_arr|
  sub_arr.select { |elem| elem % 3 == 0 }
end

p result

# ls solution
arr.map do |element|
  element.select do |num|
    num % 3 == 0
  end
end
# => [[], [3], [9], [15]]
# We know that we want to return a new array, so map is a good choice to call on
# the original array. Technically you could use either select or reject for the
# nested arrays as both would work, however choosing to use select makes the code
# a bit more readable. This is what the same solution would look like with reject:

arr.map do |element|
  element.reject do |num|
    num % 3 != 0
  end
end
# => [[], [3], [9], [15]]

# Since the method rejects elements based on the truthiness of the evaluated
# condition, combining reject with the != operator seems somewhat like a double
# negative and is more difficult to parse than select combined with ==.

puts "************************************************************************"

# Practice Problem 12

# Given the following data structure, and without using the Array#to_h method,
# write some code that will return a hash where the key is the first item in
# each sub array and the value is the second item.

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
p arr
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}
p arr.to_h
# take each array, first element is the key, second is the value

# arr.each do |sub_arr|
#   hsh = {}
#   sub_arr.each do |first, last|
#     hsh[first] = last
#   end
#   hsh
# end
# p hsh

# this code prints this {{:a=>1, :b=>2, :c=>3, :d=>4}=>nil, "D"=>nil}
# that's because it's using the last return value of the block, I need to push ALL values on the hash, not only the last one

hsh = {}

arr.each do |sub_arr|
  hsh[sub_arr[0]] = sub_arr[-1]
end

p hsh

# ls solution

hsh = {}
arr.each do |item|
  hsh[item[0]] = item[1]
end
hsh # => {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

# Although this task may at first seem complicated because the collection contains
# different object types, sometimes nested three levels deep, you only really have
# to work at the initial sub-level in order to reach a solution. Remember that
#
# any Ruby object can be a hash key and any Ruby object can be a hash value!!!

puts "************************************************************************"

# Practice Problem 13

# Given the following data structure, return a new array containing the same
# sub-arrays as the original but ordered logically by only taking into
# consideration the odd numbers they contain.

arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]
puts "Original array"
p arr

sorted_by_odd = arr.sort_by do |sub_arr| # first we use sort because this is our goal
  sub_arr.select do |elem| # then we use select because we need to specify which integers should be sorted, we want only odd integers to be sorted
    elem.odd? # this 1 line returns true or false, this is what we need for select, which returns a new array based on the truthiness of the block
  end
end

# The sorted array should look like this:
puts "Expected result"
p [[1, 8, 3], [1, 5, 9], [6, 1, 7], [1, 6, 9]]
puts "Actual result - sorted by odd"
p sorted_by_odd

puts " "
arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]
puts "Original array"
p arr
puts "Actual result - sorted by even"

sorted_by_even = arr.sort_by do |sub_arr|
  sub_arr.select do |elem|
    elem.even?
  end
end

p sorted_by_even

puts "************************************************************************"

# Practice Problem 14
# Given this data structure write some code to return an array containing
# the colors of the fruits and the sizes of the vegetables. The sizes should be
# uppercase and the colors should be capitalized.

hsh = {
  'grape' => { type: 'fruit', colors: ['red', 'green'], size: 'small' },
  'carrot' => { type: 'vegetable', colors: ['orange'], size: 'medium' },
  'apple' => { type: 'fruit', colors: ['red', 'green'], size: 'medium' },
  'apricot' => { type: 'fruit', colors: ['orange'], size: 'medium' },
  'marrow' => { type: 'vegetable', colors: ['green'], size: 'large' }
}

# The return value should look like this:
# [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

p hsh
p hsh['grape'][:colors].map(&:capitalize)
p hsh['grape'][:size].upcase

res = hsh.map do |_, value|
  if value[:type] == 'fruit'
    value[:colors].map do |color|
      color.capitalize
    end
  elsif value[:type] == 'vegetable'
    value[:size].upcase
  end
end

p res
puts "************************************************************************"

# Practice Problem 15

# Given this data structure write some code to return an array which contains
# only the hashes where all the integers are even.

arr = [{ a: [1, 2, 3] }, { b: [2, 4, 6], c: [3, 6], d: [4] }, { e: [8], f: [6, 10] }]
p arr

only_even = arr.select do |hsh|
  hsh.all? do |_, value|
    value.all? do |num|
      num.even?
    end
  end
end

p "only the hashes where all integers are even"
p only_even

puts "************************************************************************"

# Practice Problem 16

# A UUID is a type of identifier often used as a way to uniquely identify items,
# which may not all be created by the same system. That is, without any form of
# synchronization, two or more separate computer systems can create new items,
# and label them with a UUID with no significant chance of stepping on each
# other's toes.

# It accomplishes this feat through massive randomization. The number of
# possible UUID values is approximately 3.4 X 10E38.
#
# Each UUID consists of 32 hexadecimal characters, and is typically broken into
# 5 sections like this 8-4-4-4-12 and represented as a string.
#
# It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

# Write a method that returns one UUID when called with no parameters.

#Problem
# I need to write a method.
# Input is none.
# Ouput is uuid number.
# Uuid number consists of 32 hexadecimal characters.
# The characters are in sets 8-4-4-4-12, divided by dashes.
# The dashes are not part of the 32 numbers, they are extra.
# So it's 32 characters plus 4 dashes altogether.
# Hexadecimal characters are '0123456789abcdef'
#
# #Algorithm
# initialize an empty uuid variable
# initialize a variable which points to the hexadecimal characters
# generate a random number from the hexadecimal characters
# use a loop for generating the number
# insert a dash after character 8, 12, 16 and 20.
# return the uuid

def generate_uuid
  uuid = ''
  hex = '0123456789abcdef'.chars
  while uuid.size < 32
    uuid << hex.sample
  end
  uuid = uuid.insert(8, '-')
  uuid = uuid.insert(13, '-')
  uuid = uuid.insert(18, '-')
  uuid = uuid.insert(23, '-')
  uuid
end

p generate_uuid

# 2nd code, where I define the uuid as an array
# I think it doesn't really matter how I define the uuid but if it is a string
# I have less code to write because I don't need to join it in the end
def generate_uuid
  uuid = []
  hex = '0123456789abcdef'.chars
  while uuid.size < 32
    uuid << hex.sample
  end
  uuid = uuid.insert(8, '-')
  uuid = uuid.insert(13, '-')
  uuid = uuid.insert(18, '-')
  uuid = uuid.insert(23, '-')
  uuid.join
end

p generate_uuid

# ls solution

def generate_UUID
  characters = []
  (0..9).each { |digit| characters << digit.to_s } # here I added digits to the characters array
  ('a'..'f').each { |digit| characters << digit } # here I added letters to the characters array
  p "characters"
  p characters #now the array is not empty anymore, it contains all hexadecimal characters
  uuid = "" #defining the resutl string
  sections = [8, 4, 4, 4, 12] #defining sections to be able to use the method .each_with_index
  sections.each_with_index do |section, index|
    section.times { uuid += characters.sample }
    uuid += '-' unless index >= sections.size - 1
  end

  uuid
end

p generate_UUID
