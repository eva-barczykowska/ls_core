# Given a string of words, you need to find the highest scoring word.
# Each letter of a word scores points according to it’s position in the alphabet:
# a = 1, b = 2, c = 3 etc.
# You need to return the highest scoring word as a string.
# If two words score the same, return the word that appears earliest in the original string.
# All letters will be lowercase and all inputs will be valid.
#
# PEDAC TEMPLATE
#
# ************** Problem **************
# -write a method
# -score of each letter is its value in the alphabet, i.e. a = 1, b = 2, c = 3 etc.
#
# ************** Examples **************
# p alphabet_score("man i need a taxi up to ubud") == "taxi"
# # => t + a + x + i => 20 + 1 + 24 + 9 = 54
# p alphabet_score("what time are we climbing up the volcano") == "volcano"
# p alphabet_score("take me to semynak") == "semynak"
# p alphabet_score("aa b") == "aa"
#
# ************** Data Structures **************
# Input: a sentence
# Middle: Hash
# Output: return the highest scoring word
# ************** Algorithm **************
# initialize `alphabet` Hash: keys will be letters and values will be corresponding letter points
# divide string argument into separate words and put them into a hash
# using the alphabet reference calculate the value of each character that belongs to a certain word and
# finally sum those values to get the score of the word
# place results in the words_and_scores hash
# iterate over the words_and_scores hash and whichever value is the greatest, return key for that value
# ************** Code **************
#
# ************** Refactor **************

ALPHABET = ("a".."z").zip(1..26).to_h

def alphabet_score(str)
  words_and_scores = {}

  str.split.each do |word|
    words_and_scores[word] = word.chars.map { |char| ALPHABET[char]}.sum
  end

  max_score = words_and_scores.values.max

  words_and_scores.each do |word, score|
    return word if score == max_score
  end

end

p alphabet_score("man i need a taxi up to ubud") == "taxi"
p alphabet_score("what time are we climbing up the volcano") == "volcano"
p alphabet_score("take me to semynak") == "semynak"
p alphabet_score("aa b") == "aa"

puts

#suggestion from Rachele - use the Hash#keys method
ALPHABET = ("a".."z").zip(1..26).to_h

def alphabet_score(str)
  words_and_scores = {}

  str.split.each do |word|
    words_and_scores[word] = word.chars.map { |char| ALPHABET[char] }.sum
  end

  max_score = words_and_scores.values.max

  words_and_scores.keys.select { |key| words_and_scores[key] == max_score }.first
end

p alphabet_score("man i need a taxi up to ubud") == "taxi"
p alphabet_score("what time are we climbing up the volcano") == "volcano"
p alphabet_score("take me to semynak") == "semynak"
p alphabet_score("aa b") == "aa"