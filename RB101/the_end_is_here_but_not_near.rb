=begin
The End Is Near But Not Here
Write a method that returns the next to last word in the String passed to it as an argument.
Words are any sequence of non-blank characters.
You may assume that the input String will always contain at least two words.

penultimate('last word') == 'last'
penultimate('Launch School is great!') == 'is'

PEDAC
Problem
-write a method that takes a string argument
-the string argument will always contain at least 2 words
-the method returns penultimate word
-words are any sequence of non-blank characters

Examples
penultimate('last word') == 'last'
penultimate('Launch School is great!') == 'is'

Data Structures
input: a string
output: a string

Algorithm
-split the string on space, this will give me an array
-return second last element

Code
=end

def penultimate(str)
  str.split[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'

puts ""

# Further exploaration
# Further Exploration
# Our solution ignored a couple of edge cases because we explicitly stated that
# you didn't have to handle them: strings that contain just one word,
# and strings that contain no words.
#
# Suppose we need a method that retrieves the middle word of a phrase/sentence.
# What edge cases need to be considered? How would you handle those edge cases
# without ignoring them?
# Write a method that returns the middle word of a phrase or sentence.
#
# It should handle all of the edge cases you thought of.
#
# Problem
# -assumption: the middle word is the word that falls in the middle of the array size
# -write a method that returns the middle word of a phrase or sentence
# -what if a phrase contains just 1 word? Then inform the user
# -if a phrase is less than 3 words or is empty, inform the user
# -how will I define a word? a string of characters, at least one character per word

def penultimate(str)
  arr = str.split
  if arr.size < 3
    return "The string contains less than 3 words so we can't return the middle word, sorry!"
  else
    middle = arr.size / 2
    p middle
    return arr[middle]
  end
end

p penultimate('')
p penultimate('just')
p penultimate('just one')
p penultimate('just one drink')
p penultimate('Launch School is great, no?!')
p penultimate('We love chocolate muffins')
p penultimate('We love chocolate muffins and coffee')

puts ""

def super_penultimate(string)
  return string if string.empty? || string.size == 1
  words = string.split
  middle = words.size / 2 - 1
  words.size.even? ? words[middle] : words[middle + 1]
end

p penultimate('')
p penultimate('just')
p penultimate('just one')
p penultimate('just one drink')
p penultimate('Launch School is great, no?!')
p penultimate('We love chocolate muffins')
p penultimate('We love chocolate muffins and coffee')

# different approach

def middle_word(sentence)
  return sentence if sentence.size < 2
  words = sentence.split(" ")
  words.size.even? ? middle = words.size / 2 - 1 : middle = words.size/2
  words[middle]
end

p middle_word("Hello World") # => "Hello"
p middle_word("")
p middle_word("Sup")
p middle_word("No way Jose")
p middle_word("Ya tu sabes guey")  # => "tu"
