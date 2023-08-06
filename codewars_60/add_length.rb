# What if we need the length of the words separated by a space to be added at the end of that same word
# and have it returned as an array?
#
# Your task is to write a method that takes a String and returns an Array with the length of each word added to each element .
#
#   Note: String will have at least one element; words will always be separated by a space.
# "apple ban" --> ["apple 5", "ban 3"]
# "you will win" -->["you 3", "will 4", "win 3"]
# PEDAC
# ************** Problem **************
# -write a method that takes an string as an argument
# -return an array where at the end of the word, after a space there is its length added
# ************** Examples **************
# "apple ban" --> ["apple 5", "ban 3"]
# "you will win" -->["you 3", "will 4", "win 3"]
# ************** Data Structures **************
# Input:a string
#
# Output: array of strings where at the end of each string, its length is added after a space
# ************** Notes **************
# map?
# ************** Algorithm **************
# -divide the string into separate words(on space)
# -iterate over the array of words
# -while iterating over a word, check its length and append it at the end of the word
#
# ****************** Code **************
#
# ************** Refactor **************
#
def add_length(str)
  arr = str.split(" ")

  arr.each_with_index { |word, idx| arr[idx] = word + " " + word.size.to_s }
end

p add_length("apple ban") == ["apple 5", "ban 3"]
p add_length("you will win") == ["you 3", "will 4", "win 3"]

puts
puts "other solutions"
def add_length(str)
  str.split.map { |s| "#{s} #{s.size}" }
end

p add_length("apple ban") == ["apple 5", "ban 3"]
p add_length("you will win") == ["you 3", "will 4", "win 3"]