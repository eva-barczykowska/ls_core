# Given a string of words separated by spaces, write a method that takes this
# string of words and returns a string in which the first and last letters
# of every word are swapped.
#
# You may assume that every word contains at least one letter, and that
# the string will always contain at least one word. You may also assume that
# each string contains nothing but words and spaces

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
