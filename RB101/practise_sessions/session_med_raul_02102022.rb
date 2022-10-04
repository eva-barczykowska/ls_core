=begin
Write a function that sorts an array of characters alphabetically in ascending order (a-z) by the character at the n-th character.

Examples
sort_by_character(["az16", "by35", "cx24"], 2) ➞ ["cx24", "by35", "az16"]
// By 2nd character: ["x", "y", "z"] is in alphabetical order.

sort_by_character(["mayor", "apple", "petal"], 5) ➞ ["apple", "petal", "mayor"]

# By 5th character: ["e", "l", "r"] is in alphabetical order.

sort_by_character(["mate", "team", "bade"], 3) ➞ ["team", "bade", "mate"]

PEDAC
Problem
-I have an array of characters
-my method has to sorth this array alphabetically in ascending order (a-z)
 by the character at the n-th character
 -my method takes the above-mentioned array and the character by which to sort (nth character) as arguments
 -what about capital letters - no need to worry about that, they will get sorted according to the ASCII table

Examples
sort_by_character(["az16", "by35", "cx24"], 2) == ["cx24", "by35", "az16"]
# By 2nd character: ["x", "y", "z"] is in alphabetical order

sort_by_character(["mayor", "apple", "petal"], 5) == ["apple", "petal", "mayor"]
# By 5th character: ["r", "e", "l"] is in alphabetical order

sort_by_character(["mate", "team", "bade"], 3) == ["team", "bade", "mate"]
# By 3rd character: ["t", "a", "d"] is in alphabetical order

Data structures
input: array of strings
output: array of strings sorted, based on the nth character

Algorithm
-initialize the result array
-subtract 1 from n because we start counting from 0
-downcase each word(?)
-iterate through the words and check their nth character
-map and sort-by based on the nth character


Algorithm 2
-create an alphabet constant
-find out the nth character in the word
-check where it should be based on the index of letters in the alphabet
-insert it there

Algorithm 3
get the nth character in a separate temp array
sort the temp array so that I have it in alphabetical order as required
iterate through the temp array
check which character in the temp array is first
now from the argument pick the word which has its nth character equal to this first character in the helper array
so if I have x as first in my helper array, I need to select a word that has x in the nth position
and insert that word into the result array
do this for all the characters from the helper array

Code
=end
def sort_by_character(arr, n)
  n = n - 1
  arr.sort_by{ |word| word[n] }
end

p sort_by_character(["az16", "by35", "cx24"], 2) == ["cx24", "by35", "az16"]
p sort_by_character(["mayor", "apple", "petal"], 5) == ["apple", "petal", "mayor"]
p sort_by_character(["mate", "team", "bade"], 3) == ["team", "bade", "mate"]

puts ""
puts "MINE"

def sort_by_character(arr, n)
  result = []
  n = n - 1
  temp = arr.map{ |word| word[n] }.sort # this will give me ["x", "y", "z"]
  temp.each do |letter|
    arr.find { |word| result << word if word[n] == letter }
  end
 result
end

p sort_by_character(["az16", "by35", "cx24"], 2) == ["cx24", "by35", "az16"]
p sort_by_character(["mayor", "apple", "petal"], 5) == ["apple", "petal", "mayor"]
p sort_by_character(["mate", "team", "bade"], 3) == ["team", "bade", "mate"]

puts ""

def sort_by_character(arr, num)
  temp = arr.map{|word| word.slice!(0, num-1)}
  p temp
  p arr
  new_arr = arr.map.with_index{|word, idx| [temp[idx], word]}
  p new_arr
  new_arr.sort_by!{|arr| arr[1] }
  p new_arr
  p new_arr.map{|arr| arr[0]+ arr[1]}
end

p sort_by_character(["az16", "by35", "cx24"], 2) == ["cx24", "by35", "az16"]
p sort_by_character(["mayor", "apple", "petal"], 5) == ["apple", "petal", "mayor"]
p sort_by_character(["mate", "team", "bade"], 3) == ["team", "bade", "mate"]

puts ""
puts "last one"

def sort_by_character(arr, num)
  temp = arr.map{|word| word[num-1]}
  arr
  temp
  p arr.sort_by{ temp.sort }
end

p sort_by_character(["az16", "by35", "cx24"], 2) == ["cx24", "by35", "az16"]
p sort_by_character(["mayor", "apple", "petal"], 5) == ["apple", "petal", "mayor"]
p sort_by_character(["mate", "team", "bade"], 3) == ["team", "bade", "mate"]

puts ""
# Given a hash containing the names and ages of a group of people, return the name of the oldest person.

# -I will grab all keys and values and sort the hash according to the values
# -this will give a nested array with all the key-value pairs sorted according to the value = [["Amy", 15], ["Ben", 29], ["Jack", 45], ["Emma", 71]]
# -now I will grab the last array and its first element, this will be the name of the oldest person, the name which used to be the key before sorting
# Examples
def oldest(hash)
  result = hash.sort_by{ |k, v| v }
  result.last.first
end

p oldest({
  "Emma" => 71,
  "Jack" => 45,
  "Amy" => 15,
  "Ben" => 29
}) == "Emma"

p oldest({
  "Max" => 9,
  "Josh" => 13,
  "Sam" => 48,
  "Anne" => 33
}) == "Sam"
# Notes
# All ages will be different.

puts ""

# Algorithm - Raul
# Use `max_by` to get the key:value pair with the highest value, this will return an array
# return the element at index 0 in that array

def oldest(hash)
  hash.max_by{ |k, v| v }[0]
end

p oldest({
  "Emma" => 71,
  "Jack" => 45,
  "Amy" => 15,
  "Ben" => 29
}) == "Emma"

p oldest({
  "Max" => 9,
  "Josh" => 13,
  "Sam" => 48,
  "Anne" => 33
}) == "Sam"

puts ""

def oldest(hash)
  hash.sort_by{ |k, v| v }.reverse[0][0]
end

p oldest({
  "Emma" => 71,
  "Jack" => 45,
  "Amy" => 15,
  "Ben" => 29
}) == "Emma"

p oldest({
  "Max" => 9,
  "Josh" => 13,
  "Sam" => 48,
  "Anne" => 33
}) == "Sam"

def oldest(hash)
  max = hash.values.max
  hash.each{|k, v| return k if v == max}
end

p oldest({
  "Emma" => 71,
  "Jack" => 45,
  "Amy" => 15,
  "Ben" => 29
}) == "Emma"

p oldest({
  "Max" => 9,
  "Josh" => 13,
  "Sam" => 48,
  "Anne" => 33
}) == "Sam"
