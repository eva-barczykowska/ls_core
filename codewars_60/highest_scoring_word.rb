=begin
32. Highest Scoring Word

(https://www.codewars.com/kata/57eb8fcdf670e99d9b000272)

6 kyu

Given a string of words, you need to find the highest scoring word.
Each letter of a word scores points according to its position in the alphabet: a = 1, b = 2, c = 3 etc.
You need to return the highest scoring word as a string.
If two words score the same, return the word that appears earliest in the original string.
All letters will be lowercase and all inputs will be valid.

P:
-method takes a str of words as an argument
- method returns highest scoring word
-scores aer according to the position in the alphabet but a = 1 (not )

p highest_score_word('man i need a taxi up to ubud') == 'taxi'
p highest_score_word('what time are we climbing up the volcano') == 'volcano'
p highest_score_word('take me to semynak') == 'semynak'
p highest_score_word('aaa b') == 'aaa'

P:
-method takes a str of words as an argument
- method returns highest scoring word
-scores aer according to the position in the alphabet but a = 1 (not 0)
-if 2 words score same, return the first
-only lowercase letters

E:
p highest_score_word('man i need a taxi up to ubud') == 'taxi'
=> taxi 20+1+24+9=54

p highest_score_word('what time are we climbing up the volcano') == 'volcano'
=>22+15+12+3+1+14+15 = 82
p highest_score_word('take me to semynak') == 'semynak'
p highest_score_word('aaa b') == 'aaa'

DS:
input: str of words
output: str, highest scoring word

# Notes
alphabet = ('a'..'z').to_a.zip(1..26).to_h
p alphabet
-find out score of each word and return the word that scores highest

A:
-initialize `highest_score`` and `highest_scoring_word` to 0 and "" respectively

-iterate over words and determine their score
--convert word to chars, map letters to scores, sum all the digits, this is the score

--save word to `highest_scoring_word` if the score is higher than `highest_score`
--save score to `highest_score` if `score` is greater than `highest_score`

--return highest_scoring_word
=end


#scoping problem
#idea for Medium article

# def highest_score_word(str)
#   alphabet = ('a'..'z').to_a.zip(1..26).to_h
#   highest_score = 0
#   word = ""

#   result = []

#   str.split(" ").each do |word|
#     score = word.chars.map { |letter| alphabet[letter] }.sum # getting a sum
#     word = word if score > highest_score #shadowing!
#     p word
#     highest_score = score if score > highest_score

#   end

#   highest_score
#   # word
# end
# p highest_score_word('man i need a taxi up to ubud') #== 'taxi'
# p highest_score_word('what time are we climbing up the volcano') #== 'volcano'
# p highest_score_word('take me to semynak') #== 'semynak'
# p highest_score_word('aaa b') #== 'aaa'

def highest_score_word(str)
  alphabet = ('a'..'z').to_a.zip(1..26).to_h
  highest_score = 0
  highest_scoring_word = ""

  result = []

  str.split(" ").each do |word|
    score = word.chars.map { |letter| alphabet[letter] }.sum 
    highest_scoring_word = word if score > highest_score
    highest_score = score if score > highest_score
  end


  highest_scoring_word
end
p highest_score_word('man i need a taxi up to ubud') == 'taxi'
p highest_score_word('what time are we climbing up the volcano') == 'volcano'
p highest_score_word('take me to semynak') == 'semynak'
p highest_score_word('aaa b') == 'aaa'

puts

def highest_score_word(str)
  alphabet = ('a'..'z').to_a

  word_score = str.split.map do |word|
    score = 0
    max_score = 0
    word.chars.map do |char|
      score += alphabet.index(char) + 1
    end
    score
  end

  # word_score #got scores of each word in order

  target_index = word_score.each_with_index.sort_by { |score, idx| [score, idx]}.last.last # sort by score
  str.split(" ")[target_index]
end
p highest_score_word('what time are we climbing up the volcano') == 'volcano'
p highest_score_word('take me to semynak') == 'semynak'
p highest_score_word('aaa b') == 'aaa'
   
puts

def word_score(str)
  alphabet = ("a".."z").zip(1..26).to_h
  str.chars.map { |chr| alphabet[chr] }.sum
end

def highest_score_word(str)
  words = str.split
  highest_score = 0
  highest_score_word = ""

  words.each do |word|
    if word_score(word) > highest_score
      highest_score = word_score(word)
      highest_score_word = word
    end
  end

  highest_score_word
end

p highest_score_word('man i need a taxi up to ubud') == 'taxi'
p highest_score_word('what time are we climbing up the volcano') == 'volcano'
p highest_score_word('take me to semynak') == 'semynak'
p highest_score_word('aaa b') == 'aaa'


# Ekerin
def high(str)
  points = ('a'..'z').to_a.map.with_index do |char, i|
    [char, i + 1]
  end.to_h


  words = str.split
  scores = words.map.with_index do |word, i|
    score = word.chars.map {|char| points[char].to_i}.reduce(&:+)
    [word, i, score]
  end

  highest = scores.first

  scores.each do |score|
    highest = score if score.last > highest.last
  end

  highest.first

end

p high('man i need a taxi up to ubud') == 'taxi'
p high('what time are we climbing up the volcano') == 'volcano'
p high('take me to semynak') == 'semynak'
p high('aaa b') == 'aaa'
p high('what time are we climbing up the valcono volcano') == 'valcono'
