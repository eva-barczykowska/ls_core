=begin
Question:
How long are you?
Write a method that takes a string as an argument,
and returns an Array that contains every word from the string,
to which you have appended a space and the word length.

You may assume that words in the string are separated by exactly one space,
and that any substring of non-space characters is a word.

-----------------------
Questions:

Problem (Rewrite if needed else skip):

Input: String
Output: An array containing each word from the original string
with the number of characters in the word appended to it; separated by a space.

Rules:
  Explicit Requirements
  - Return array containing each word from input String
  - Append a space and word length to each word
  - Words in the string will be separated by 1 space
  - Any substring of non-space chars is a word

  Implicit Requirements

-----------------------
Examples:
word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

word_lengths("") == []

-----------------------
Data Structures: An array containing each individual word.
Then a second to add each word and append the space + count

Algorithm:
- Define `word_lengths` with param of `str`
- Break up `str` into individual words
  ['hello', 'there'] => ['hello 5', 'there 5']
- Get the count of each word
- Append count to each word with a space
- Return the new array

-----------------------
Code:
=end

def word_lengths(str)
  str.split.each_with_object([]) do |word, arr|
    arr << word + ' ' + word.size.to_s # on last iteration arr contains all added elements and this is what is returned - nice!
  end
end

p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") ==
    ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
    ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []