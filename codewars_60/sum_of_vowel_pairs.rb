=begin
Problem 2
Create a function sum_of_vowel_pairsthat takes a sentence and returns the total sum of the lengths of all word pairs where both words start with a vowel (a, e, i, o, u).

# Test cases
puts sum_of_vowel_pairs("An apple a day keeps the doctor away") == 36 
puts sum_of_vowel_pairs("Every engineer enjoys innovative algorithms") == 156

P: 
-write a method that takes a str as an arg
-str returns total sum of the lengths of all word pairs where both words start with a vowel

E:
p sum_of_vowel_pairs("An apple a day keeps the doctor away") == 36
an
apple
a
away

p sum_of_vowel_pairs("Every engineer enjoys innovative algorithms") == 156
every
engineer
enjoys
innovative
algorithms

Notes
-find words that start with a vowel
-make combinations of 2/pairs
-calculate their lenghs
arr = %(an apple a away).split
p arr.combination(2).to_a.flatten.join.size
# p sum_of_vowel_pairs("An apple a day keeps t
arr = %(an apple a away).split
arr = %(every engineer enjoys innovative algorithms).split
p arr.combination(2).to_a.flatten.join.size

A:
-change str to arr
-find words that start with a vowel (define vowels)
-make combinations of 2/pairs
-calculate the lenghs of that array, flattned and joined into 1 string 
-return the size
=end

def sum_of_vowel_pairs(str)
  arr = str.split.select { |word| word.start_with?(/[aeouiAEOUI]/) }
 
  arr.combination(2).to_a.flatten.join.size
 end
 
 p sum_of_vowel_pairs("An apple a day keeps the doctor away") == 36 
 p sum_of_vowel_pairs("Every engineer enjoys innovative algorithms") == 156
 
 puts
 # if combination not allowed
 def sum_of_vowel_pairs(str)
   arr = str.split.select { |word| word.start_with?(/[aeouiAEOUI]/) }
  
   last_index = arr.size - 1
   combinations = []
 
   (0..last_index).each do |start|
     (start + 1..last_index).each do |finish|
       combinations << [arr[start], arr[finish]]
     end
   end
 
   combinations.flatten.join.size
  end
  
  p sum_of_vowel_pairs("An apple a day keeps the doctor away") == 36 
  p sum_of_vowel_pairs("Every engineer enjoys innovative algorithms") == 156
  

  puts
=begin
PROBLEM
=======
Given a String return the total sum lengths of all word-pairs made of words that begin with vowels.
              determine the length of eac word that starts with a vowel
              find sum of all lengths for those words.

Rules
-----
  + need to find valid_words
    - start with vowels
  + create pairs from valid words
  + sum lengths of all pairs


DS
========
Input : String
  + words separated by spaces

Intermediate
------------
+ generate Arrayof valid_words
+ generate pairs

Output : Integer
  + represents all characters from all pairs of valid words
    -- sum of lengths of valid pairs


ALHORITHM
=========
> helper : is_valid?
  + in : string (word)
  + out : Boolean
    - `true` : lowercase version of first character is vowel
    - `false` otherwise

> helper : all_pairs
  + in : array of Strings (Words)
  + init empty Array `pairs`
  + iterate from first to 2nd-to-last index
    + grab element at outer index
    + iterate from next to last index
      + grab element at inner
      + create Array with outer and inner elements
      + add Pair to Array of Pairs
  + out : Array of all possible consecutive pairs

> sum_of_vowel_pairs
  + split input String on spaces to generate Array of Words
  + generate Array of Valid Words by selecting from Words
  + generate Pairs Array
  + generate Array of Lengths by transforming Pairs
    + concatenate both words
    + get length of new word
    + add length Array of Lengths

+ generate sum of Array of Length and return

=end
def is_valid?(word)
  vowels = 'aeiou'
  vowels.include?(word[0].downcase) ? true : false
end

def all_pairs(words)
  pairs = []

  0.upto(words.length - 2) do |outer_i|
    outer_word = words[outer_i]

    (outer_i + 1).upto(words.length - 1) do |inner_i|
      inner_word = words[inner_i]
      pairs << [outer_word, inner_word]
    end
  end

  pairs

end


def sum_of_vowel_pairs(str)
  words = str.split
  valid_words = words.select {|word| is_valid?(word)}
  pairs = all_pairs(valid_words)
  lengths = pairs.map {|pair| pair.first.length + pair.last.length}
  lengths.sum

end

p sum_of_vowel_pairs("An apple a day keeps the doctor away")  == 36 
puts sum_of_vowel_pairs("Every engineer enjoys innovative algorithms")  == 156