=begin
# Given a string of words, you need to find the highest scoring word.

# Each letter of a word scores points according to it's position in the alphabet:
# a = 1, b = 2, c = 3 etc.

# You need to return the highest scoring word as a string.

# If two words score the same, return the word that appears earliest in the original string.

# All letters will be lowercase and all inputs will be valid.
PEDAC
P:
- write a method that takes a str as an arg
- method calculates scores of words and returns the highest scoring word
- if there are 2 highest scoring words, return the earlier one

- scoring is according to the alphabet

E:
p alphabet_score('what time are we climbing up the volcano') == 'volcano'
=>
p alphabet_score('take me to semynak') == 'semynak'
=> semyak

p alphabet_score('aa b') == 'aa'

DS:input: str, output: str

A:
- define alphabet reference

- split input str on a space
- you get an array of words
- iterate over this array
- tranform the words into their values

-initialize result hash
-while iterating I could save the word as a key and its value as value
- find and return the key for the max value
=end
def alphabet_score(str)
  alphabet = ("a".."z").to_a
  reference_hash = {}

  alphabet.each.with_index do |letter, index|
    reference_hash[letter] = index + 1
  end

  result = {}

  arr = str.split(" ")
  arr.each do |word|
    result[word] = word.chars.map { |char| reference_hash[char] }.sum
  end

  maximum_value = result.values.max

  result.each do |word, its_value|
    return word if its_value == maximum_value
  end

end
p alphabet_score('man i need a taxi up to ubud') == 'taxi'
p alphabet_score('what time are we climbing up the volcano') == 'volcano'
p alphabet_score('take me to semynak') == 'semynak'
p alphabet_score('aa b') == 'aa'