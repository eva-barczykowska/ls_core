
=begin
How long are you?
Write a method that takes a string as an argument, and returns an Array that contains every word from the string, to which you have appended a space and the word length.

You may assume that words in the string are separated by exactly one space, and that any substring of non-space characters is a word.

PEDAC
Problem
-write a method
-the method takes a string as an argument
-the method returns an array that contains every word from the argument, space and size of that word
-special characters are part of the word

Examples
word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it?
 3"]

word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

word_lengths("") == []

Data Structures
input -string
output -array

Algorithm
-split the string by the space, this will give me words
-initialize a result array
-iterate through the words and TRANSFORM each of them in the following way:
-instead of the word, there should be word + space the size of the word
-once finished iterating, return the result
=end

# def word_lengths(string)
#   array_of_words = string.split
#   res = []
#   array = array_of_words.each do |word|
#     res + word.to_s + " " + word.size.to_s
#   end
#   res
# end

def word_lengths(string)
  array_of_words = string.split
  array = array_of_words.map do |word|
    word + " " + word.size.to_s
  end
  array
end
p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []

puts ""
#=======================================================================================
# Write a method that takes a sentence string as input, and returns the same string with any sequence of the words 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

# PEDAC
# Problem
# Given a string with some word numbers, without affecting the rest of the string, convert the word digits to their equivalent string digits and return the new string.

# Example:
# word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

# input: string
# mid: array
# output: string

# Algorithm:
# make a reference for converting word number to string digit
# split the string into individual components.
# iterate through each element in the array
#   if the element is a word number, replace it with its string digit
# return the new string

# make a reference for converting word number to string digit
# split the string into individual components.
# iterate through each element in the array
#   if the letter elements of the word is a word number, replace it with its string digit based on reference
# return the new string

WORD_NUMBERS = %w(zero one two three four five six seven eight nine)
p WORD_NUMBERS
DIGITS = %w(0 1 2 3 4 5 6 7 8 9)
p DIGITS
REFERENCE = WORD_NUMBERS.zip(DIGITS).to_h

# zip method will give me this: [['zero', '0'], ['one', `1`]]
# .to_h method will give me a hash where the first element of the inner array is a key,
# and the 2nd element of the inner array is the value

def word_to_digit(string)
  string = string.split
  string.map! do |word|
    if WORD_NUMBERS.include?(word.gsub(/[^A-z]/,'')) #ONLY LETTERS (replace non-letters with nothing)
      if word.include?('.')
        punctuation = word.gsub(/[A-z]/, '') #ONLY SPECIAL CHARACTERS, specifically '.'
        REFERENCE[word.gsub(/[^A-z]/, '')] + punctuation #transforming according to this
      else
        REFERENCE[word.gsub(/[^A-z]/, '')] #transforming according to this
      end
    else
      word
    end
  end
  string.join(' ')
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
