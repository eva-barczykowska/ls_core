# Sorting, Nested Collections and Working with Blocks

# Practice Problem 1
# How would you order this array of number strings by descending numeric value?

arr = ['10', '11', '9', '7', '8']

arr.map do |a, b|
  b.to_i <=> a.to_i
end

puts "************************************************************************"

# Practice Problem 2
# How would you order this array of hashes based on the year of publication of
# each book, from the earliest to the latest?

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

# access the key published:
# convert it to an integer
# order it from the eaerliest

p books[0][:published].to_i

# books.sort_by |hash|

puts "************************************************************************"

# Practice Problem 3
# For each of these collection objects demonstrate how you would reference
# the letter 'g'.

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]

arr3 = [['abc'], ['def'], {third: ['ghi']}]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}

puts "************************************************************************"

# Practice Problem 4
# For each of these collection objects where the value 3 occurs, demonstrate
# how you would change this to 4.

arr1 = [1, [2, 3], 4]

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]

hsh1 = {first: [1, 2, [3]]}

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}

puts "************************************************************************"

# Practice Problem 5

# Figure out the total age of just the male members of the family.

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

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


puts "************************************************************************"

# Practice Problem 7

# Given this code, what would be the final values of a and b? Try to work
# this out without running the code.

a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a

# Practice Problem 8

# Using the each method, write some code to output all of the vowels
# from the strings.

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each do |key, value|
  p value
end

# Practice Problem 9

# Given this data structure, return a new array of the same structure but with
# the sub arrays being ordered (alphabetically or numerically as appropriate)
# in descending order.

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]


# Practice Problem 10

# Given the following data structure and without modifying the original array,
# use the map method to return a new array identical in structure to the original
# but where the value of each integer is incremented by 1.

[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

# Practice Problem 11

# Given the following data structure use a combination of methods,
# including either the select or reject method, to return a new array identical
# in structure to the original but containing only the integers that are
# multiples of 3.

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]
