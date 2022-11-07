=begin
Capitalize Words
Write a method that takes a single String argument and returns a new string that
contains the original value of the argument with the first character of every
word capitalized and all other letters lowercase.

You may assume that words are any sequence of non-blank characters.

Algorithm
-initialize alphabet variable
-split the argument on the space
-iterate through the array
-if the first character of each word is an alphabet character
-then make it a capital character and append this word to the result array
-otherwise, leave this word as it is and append it to the result array
-return the joined array
=end

def word_cap(str)
  alphabet = ('a'..'z').to_a
  arr = str.split # at this moment the string becomes an array - a different object

  arr.each do |word|
    if alphabet.include?(word[0])
      word.capitalize!
    else
      word
    end
  end

  arr.join(" ")
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
