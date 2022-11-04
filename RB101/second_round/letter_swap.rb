# Letter Swap
# Given a string of words separated by spaces, write a method that
# takes this string of words and returns a string in which
# the first and last letters of every word are swapped.

# You may assume that every word contains at least one letter,
# and that the string will always contain at least one word.
# You may also assume that each string contains nothing but words and spaces

# swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
# swap('Abcde') == 'ebcdA'
# swap('a') == 'a'

# PEDAC
# Problem
# -write a method that takes a str as an argument
# -the method returns the string, in which the 1st and last characters are swapped
# -every str contains at least 1 letter
# -every str contains at least 1 word
# -don't need to worry about non-letter characters

# Examples
# swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
# swap('Abcde') == 'ebcdA'
# swap('a') == 'a'

# Data structures
# input: String
# middle: Array
# output: String

# Algorithm
# -if the argument str.size is 1, return the argument string
# -otherwise split the string and iterate over the array
# -in every word, change the 1st and last character
# -return joined str

# Code

def swap(str)
  if str.size == 1
    return str
  else
    arr = str.split.each do |word|
      word[0], word[-1] = word[-1], word[0]
    end
  end
  arr.join(" ")
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'

puts

#each_char - a method to iterate over the string (it exists :-))

str = "cailan"
str.each_char{ |ch| p ch*2 }
