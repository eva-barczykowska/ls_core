=begin

Group Anagrams

Given the array:

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

Write a program that prints out groups of words that are anagrams.
Anagrams are words that have the same exact letters in them but in a different order.
Your output should look something like this:

["demo", "dome", "mode"]
["neon", "none"]
#(etc)

PEDAC
Problem
-I have an array of words, they are all the same length
-I have to write a method that prints out groups of anagrams,
 so clusters of same letters but positions differetly

Examples
I have my array like this
words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']


and I will print groups of anagrams like this
["demo", "dome", "mode"]
["neon", "none"]

looks like a nested array

Data Structures
input - array
middle - hash
output - arrays of anagrams

Algorithm
-how I am going to do this
-initialize a result hash, key is a word, value is an array(of future anagrams)
-push on the hash the first words from the input array, so the hash will be hash = {"demo" => []}
-check the second word - all its letters
-so iterate over this word letter by letter
-see if this word is an anagram with any of the keys in the hash
-all letters from the word in question have to be present in the word we compare it with(hash key)
-if it is an anagram with any of the keys in the hash, add it to the values array for that key
 I could create a method to verify if a word is an anagram
-othewise, push to the hash this word as another key, with value as an empty array
-after I've exhausted the words in the input array, it's time to return
-return from the hash only the values - these are the anagrams

Code
=end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

# def anagrams?(first, second)
#   second.split("").all?{ |letter| first.include?(letter) }
# end


def anagrams(array)
  h = {}
  h[array.shift] = []
  array.each do |word|
   h.keys.each do |key|
      if word.split("").all?{ |letter| key.include?(letter)}
        h[key] << word
      else
        h[word] = []
      end
    end
  end
 p h
end

anagrams(words)
