=begin
Alphabet symmetry
Consider the word "abode". We can see that the letter a is in position 1 and b
is in position 2. In the alphabet, a and b are also in positions 1 and 2.
Notice also that d and e in abode occupy the positions they would occupy in the
alphabet, which are positions 4 and 5.

Given an array of words, return an array of the number of letters that occupy
their positions in the alphabet for each word. For example,

solve(["abode","ABc","xyzD"]) = [4, 3, 1]
See test cases for more examples.

Input will consist of alphabet characters, both uppercase and lowercase.
No spaces.
=end

# Problem:
# I have an array of words.
# I have to return an array of the NUMBER of letters that occupy their position
# in the alphabet for each word
# letters are lowercase and uppercase
# a is first in the word and 1st in the alphabet
# b is 2nd in the word and 2nd in the alphabet
# o we are not considering because it's not third in the alphabet
# d is 3rd in the word and third in the aphabet

# Algorithm
# -make it all same case
# -define the alphabet
# -define the result
# -look at every word
# look at every character in a word
# ask a question is this character's position is same as its position in
# the aphabet
# -if yes, then add 1 to the counter for this word
# -when i have a new word, I have to start a new counter
# -when the words are finished, return the result
# -what should i return when i have an empty array?
# --array will always have values

def solve(array)
  alphabet = ('a'..'z').to_a
  array = array.map { |word| word.downcase }
  result = []

  array.each do |word|
    how_many_chars = 0
    word.chars.each_with_index do |character, idx|
      if word[idx] == alphabet[idx]
        how_many_chars += 1
      end
    end
    result << how_many_chars
  end

  result
end

p solve(["abode"]) == [4]
p solve(["abode","ABc","xyzD"]) == [4, 3, 1]
p solve(["abide","ABc","xyz"]) == [4, 3, 0]
p solve(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"]) == [6, 5, 7]
p solve(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]
