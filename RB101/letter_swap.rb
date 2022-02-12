# Given a string of words separated by spaces, write a method that takes this
# string of words and returns a string in which the first and last letters
# of every word are swapped.
#
# You may assume that every word contains at least one letter, and that
# the string will always contain at least one word. You may also assume that
# each string contains nothing but words and spaces

#  Explicit requirement
# -a method
# -takes a string as an input
# -returns a string
# -in that string, first and last letters of every word are swapped
# -every word has at least 1 character
# -only words and spaces

# Data structures:
# input: string
# output: string

# Algorithm
# -split the string, you get an array
# -look at every word in the array
# -take its first letter and last letter
# -swap them
# -return the string
# -result variable where I append << the changed word?

# IMPORTANT CONCEPT
# # str[0], str[-1] = str[-1], str[0]
#
# str = 'what'
# tmp = str[0] #-> 'what'
# str[0] = str[-1] #-> 'that'
# str[-1] = tmp #-> 'thaw'

def swap(str)
  result = []
  array = str.split
  array.each do |word|
    word[0], word[-1] = word[-1], word[0]
    result << word
  end
  result.join(" ")
end

p swap('Oh what a wonderful day it is') #== 'hO thaw a londerfuw yad ti si'
p swap('Abcde') #== 'ebcdA'
p swap('a') #== 'a'
puts

# ls solution

def swap_first_last_characters(word)
  word[0], word[-1] = word[-1], word[0]
  word
end

def swap(words)
  result = words.split.map do |word|
    swap_first_last_characters(word)
  end
  result.join(' ')
end

p swap('Oh what a wonderful day it is') #== 'hO thaw a londerfuw yad ti si'
p swap('Abcde') #== 'ebcdA'
p swap('a') #== 'a'
puts

def swap(words)
  result = words.split.map do |word|
    swap_first_last_characters(word)
  end
  result.join(' ')
end
# solution I liked

def letter_swap(str)
  array_of_words = str.split(' ')
  array_of_words.map! do |word|
    first_letter = word.chars.first
    last_letter = word.chars.last
    word[0] = last_letter
    word[-1] = first_letter
    word
  end
  array_of_words.join(' ')
end

p swap('Oh what a wonderful day it is') #== 'hO thaw a londerfuw yad ti si'
p swap('Abcde') #== 'ebcdA'
p swap('a') #== 'a'
