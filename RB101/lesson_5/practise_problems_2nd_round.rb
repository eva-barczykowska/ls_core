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

puts

arr3 = [['abc'], ['def'], {third: ['ghi']}]
p arr3
letter_g = arr3[2][:third][0][0]
p letter_g

puts

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
p hsh1
letter_g = hsh1['b'][1]
p letter_g

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
p hsh2
letter_g = hsh2[:third].keys[0]
p letter_g

puts

# Practice Problem 4
# For each of these collection objects where the value 3 occurs,
# demonstrate how you would change this to 4.
#
puts "Practise Problem 4"

arr1 = [1, [2, 3], 4]
p arr1
arr1[1][1] = 4
p arr1

puts

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
p arr2
arr2[-1] = 4
p arr2

puts

hsh1 = {first: [1, 2, [3]]}
p hsh1
hsh1[:first][2] = [4]
p hsh1

puts

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
p hsh2
hsh2[["a"]][:a][2] = 4
p hsh2

puts

# Practice Problem 5
# Consider this nested Hash.
# Determine the total age of just the male members of the family.
puts "Practise Problem 5"

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
age = 0
munsters.each do |_, details|
  age += details["age"] if details["gender"] == "male"
end
p age

puts

# ls solution:
total_male_age = 0
munsters.each_value do |details| # they used .each_value
  total_male_age += details["age"] if details["gender"] == "male"
end

p total_male_age # => 444

# Practice Problem 6
# One of the most frequently used real-world string properties
# is that of "string substitution", where we take a hard-coded string
# and modify it with various parameters from our program.
# Given this previously seen family hash, print out the name, age and gender of each family member:
puts "Practice Problem 6"

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# Expected ==> (Name) is a (age)-year-old (male or female).

munsters.each do |name, details|
  puts "#{name} is a #{(details["age"])}-year-old #{details["gender"]}."
end

puts

# Practice Problem 7
# Given this code, what would be the final values of a and b?
# Try to work this out without running the code.

puts "Practice Problem 7"

a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a

# Practice Problem 8
# Using the each method, write some code to output
# all of the vowels from the strings.
puts "Practice Problem 8"
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}
VOWELS = "aeoui"
hsh.each { |_, value| value.join.split("").each {|char| p char if VOWELS.include?(char)}}

puts
puts "or"
puts
# Practice Problem 8
hsh.each { |_, value| value.join.split("").each {|char| p char if char =~ /[aeoui]/}}

puts
# ls solution
vowels = 'aeiou'

hsh.each do |_, value|
  value.each do |str|
    str.chars.each do |char|
      puts char if vowels.include?(char)
    end
  end
end

puts "Practice Problem 9"
# Practice Problem 9
# Given this data structure, return a new array of the same structure
# but with the sub arrays being ordered
# (alphabetically or numerically as appropriate) in descending order.

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]
res = arr.map do |subarray|
  subarray.sort do |a, b|
    b <=> a
  end
end

p res

puts

puts "Practice Problem 10"
# Practice Problem 10
# Given the following data structure and without modifying the original array,
# use the map method to return a new array identical in structure to the original
# but where the value of each integer is incremented by 1.

arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
# expected: [{a: 2}, {b: 3, c: 4}, {d: 5, e: 6, f: 7}]
p arr

res = arr.map do |hsh|
  hsh.each do |key,value|
    hsh[key] = value + 1
  end
end

p res

puts
# ls additional solution
[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].each_with_object([]) do |hsh, arr|
  incremented_hash = {}
  hsh.each do |key, value|
    incremented_hash[key] = value + 1
  end
  arr << incremented_hash
end
p arr
# => [{:a=>2}, {:b=>3, :c=>4}, {:d=>5, :e=>6, :f=>7}]

puts

puts "Practice Problem 11"
# Practice Problem 11
# Given the following data structure use a combination of methods,
# including either the select or reject method, to return a new array
# identical in structure to the original but containing
# only the integers that are multiples of 3.

# arr = [[2], [3, 5, 7, 12], [9], [11, 13, 15]]
# Expected [[], [3, 12], [9], [15]]
#
arr = [[2], [3, 5, 7, 12], [9], [11, 13, 15]]
res = arr.map do |subarray|
  subarray.select do |number|
    number % 3 == 0
  end
end
p arr
p res

puts
puts "Practice Problem 12"
# Practice Problem 12
# Given the following data structure, and without using the Array#to_h method,
# write some code that will return a hash where the key
# is the first item in each sub array and the value is the second item.

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
p arr

h = {}
arr.each do |subarray|
  h[subarray.first] = subarray.last
end

p h

# ls solution
hsh = {}
arr.each do |item|
  hsh[item[0]] = item[1]
end
hsh # => {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}
puts
puts "Practice Problem 13"
# Practice Problem 13
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}
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


# p new_arr
# => [{:a=>2}, {:b=>3, :c=>4}, {:d=>5, :e=>6, :f=>7}]

# var = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |subhash|
#   subhash.each do |key, integer|
#     subhash[key] = integer + 1
#   end
#   end


hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

VOWELS = 'aeouiAEOUI'
hsh.each { |_, value| value.join.split("").select { |char| p char if VOWELS.include?(char) }}


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
# Practice Problem 13
# Given the following data structure, return a new array containing the same sub-arrays as the original but ordered logically by only taking into consideration the odd numbers they contain.

# -we want a NEW array
# -with only odd numbers like 1, 3, 5, 7, etc.

arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]

# expected: [[1, 8, 3], [1, 5, 9], [6, 1, 7], [1, 6, 9]]

new_arr = arr.sort_by do |subarray|
  subarray.select do |number|
    number.odd?
  end
end

p new_arr

# Practice Problem 13
# Given the following data structure, return a new array containing the same sub-arrays as the original but ordered logically by only taking into consideration the odd numbers they contain.

# -we want a NEW array
# -with only odd numbers like 1, 3, 5, 7, etc.

arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]

# expected: [[1, 8, 3], [1, 5, 9], [6, 1, 7], [1, 6, 9]]
updated_subarray = []
new_arr = arr.sort_by do |subarray| # [1, 6, 9]
  updated_subarray = subarray.select do |number| # 1, 6, 9, retn [1,9] which is selection criteria for `sort_by`[1, 7], [1,3] [1,5,9]
    p number
    p number.odd? # true, false, true
  end
  p updated_subarray
end

p new_arr

# Precedence
# [1,9], [1,7], [1,3], [1,5,9]
# sorted will be [1,3], [1,5,9], [1,7], [1,9]
#
# arr = ["9", "8", "7", "10", "11"]
# p (arr.sort) do |x, y|
#     y.to_i <=> x.to_i
#   end
#
#
# Precedence problem, remove the p to get correct output
# # Expected output: ["11", "10", "9", "8", "7"]
# # Actual output: ["10", "11", "7", "8", "9"]
#
# # "10" => 49
# # "11" => 49
# # "7" => 55
# # "8" => 56
# # "9" => 57
# another solution
#
# arr = ["9", "8", "7", "10", "11"]
# p (arr.sort do |x, y|
#     y.to_i <=> x.to_i
#   end)
# maybe save to another file -- precedence
#
# also can fix it using the {}, which has highter precedence
#
# arr = ["9", "8", "7", "10", "11"]
# p arr.sort { |x, y| y.to_i <=> x.to_i}
#
# also this example
#
# p(array.map) do |num|
#   num + 1 # <Enumerator: [1, 2, 3]:map>
#
#   p(array.map { |num| num + 1 })
