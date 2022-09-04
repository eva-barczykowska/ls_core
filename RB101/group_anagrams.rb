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
-I got stuck on this and finally saw the solution
-how I am going to do this
---pay attention-- this never said it needs to be a METHOD!!!
-initialize a result hash, key is a word, value is an array(of future anagrams)
-push on the hash the first words from the input array, so the hash will be hash = {"demo" => []}
-check the second word - all its letters
-so iterate over this word letter by letter
-see if this word is an anagram with any of the keys in the hash
-all letters from the word in question have to be present in the word we compare it with(hash key)
-if it is an anagram with any of the keys in the hash, add it to the values array for that key
-othewise, push to the hash this word as another key, with value as an empty array
-after I've exhausted the words in the input array, it's time to return
-return from the hash only the values - these are the anagrams

Code
=end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']
          
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

puts ""
# ls solution
=begin
Algorithm
-iterate over the array
-the key of the hash is going to be a word alphabetically sorted
-thye value of that key is going to be an array of anagrams associated with this word, like {"demo"=>["dome", "mode"]}
-so sort the word in alphabetical order
-if key already exists, append the current word into the value array
-otherwise create a new key with the sorted word
=end

result = {}

words.each do |word|
  key = word.split('').sort.join
  if result.has_key?(key)
    result[key].push(word) #we don't care about the keys, they won't be printed out so we can have them sorted as only reference, values are going to be printed
  else
    result[key] = [word]
  end
end

result.each_value do |v|
  puts "------"
  p v
end
=begin
What we are doing here is amazing:) We are sorting the word alphabetically for our purposes only. That's how we know if words are anagrams,
Because when they're sorted - they're exacly same, right?
So that's one thing solved - anagrams.
Now for the hash.
If the hash has that sorted version of the word as a key, it means we need to add this word (i.e. its not sorted version) to the values array.
If the hash does not have that sorted version as a key, we will add it. And it does not matter that it's sorted coz we're not printing it!!!
In the end, we print only the values from the hash, just as the exercise requires us to do.
=end
words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']
