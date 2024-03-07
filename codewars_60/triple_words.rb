=begin
# Find all triple of words in the sentence that have at least 2 vowels in them.

# # Test cases
# puts find_triple_with_vowels("This is a test sentence with some vowels").inspect # [["sentence", "some", "vowels"]]

# puts find_triple_with_vowels("The quick brown fox jumps over the lazy dog").inspect # []

# puts find_triple_with_vowels("Beautiful, bright, and sunnier days are lovely").inspect 
# [
#  ["Beautiful,", "bright,", "sunnier"],
#  ["Beautiful,", "bright,", "lovely"],
#  ["Beautiful,", "sunnier", "lovely"],
#  ["bright,", "sunnier", "lovely"]
# ]

P:
- what is triple of words: all possible combinations of 3 of the words found (according to specificaitons in string)
-find tripple of words, so 2 words that have at least 2 vowels in them 

E
p find_triple_with_vowels("This is a test sentence with some vowels") == [["sentence", "some", "vowels"]]
=>only 3 words so only 1 combination of 3

p find_triple_with_vowels("The quick brown fox jumps over the lazy dog") == []
=> no 3 words so empty array
quick

p find_triple_with_vowels("Beautiful, bright, and sunnier days are lovely") == [ ["Beautiful,", "bright,", "sunnier"],
["Beautiful,", "bright,", "lovely"],
["Beautiful,", "sunnier", "lovely"],
["bright,", "sunnier", "lovely"]]

beautiful, sunnier, are, lovely

Notes
target_words = ['beautiful', 'sunnier', 'are', 'lovely']
p target_words.combination(3).to_a

DS
input: string or words
output: all possible combinations of 3
H: Split array to words and select only those which have at least 2 vowels, then make a combination of 3 from these selected words.
A:
-change arg str to arr
-select words that have 2 or more vowels
-count the vowels

-make combinations of 3 and return them
=end

def find_triple_with_vowels(str)
  arr = str.split

  target_words = arr.select { |w| w.count('aeoui') >= 2 }

  target_words.combination(3).to_a
end

p find_triple_with_vowels("This is a test sentence with some vowels") == [["sentence", "some", "vowels"]]
p find_triple_with_vowels("The quick brown fox jumps over the lazy dog") == []
p find_triple_with_vowels("Beautiful, bright, and sunnier days are lovely") == [["Beautiful,", "sunnier", "are"], ["Beautiful,", "sunnier", "lovely"], ["Beautiful,", "are", "lovely"], ["sunnier", "are", "lovely"]]

puts

def is_vowel_word?(word)
  word.downcase.chars.any?{ |chr| %w(a e i o u).include?(chr) }
end

def words_with_two_vowels(word)
  vowels = ['a', 'e', 'i', 'o', 'u']
  
  word.each_char.count { |char| %w(a e i o u).include?(char) }
end

def find_triple_with_vowels(string)
  result = []

  strings = string.split(" ")

  strings.each { |word| result << word if is_vowel_word?(word) && words_with_two_vowels(word) >= 2 }

  result.combination(3).to_a

  #   (0...words_with_two_vowels.length - 2).each do |i|
#     (i + 1...words_with_two_vowels.length - 1).each do |j|
#       (j + 1...words_with_two_vowels.length).each do |k|
#         result.push([words_with_two_vowels[i], words_with_two_vowels[j], words_with_two_vowels[k]])
#       end
#     end
#   end

end
p find_triple_with_vowels("This is a test sentence with some vowels") == [["sentence", "some", "vowels"]]
p find_triple_with_vowels("The quick brown fox jumps over the lazy dog") == []
p find_triple_with_vowels("Beautiful, bright, and sunnier days are lovely") == [["Beautiful,", "sunnier", "are"], ["Beautiful,", "sunnier", "lovely"], ["Beautiful,", "are", "lovely"], ["sunnier", "are", "lovely"]]

puts
puts "if combination method not allowed:"
def is_vowel_word?(word)
  word.downcase.chars.any?{ |chr| %w(a e i o u).include?(chr) }
end

def words_with_two_vowels(word)
  vowels = ['a', 'e', 'i', 'o', 'u']
  
  word.each_char.count { |char| %w(a e i o u).include?(char) }
end

def find_triple_with_vowels(string)
  result = []

  strings = string.split(" ")

  strings.each { |word| result << word if is_vowel_word?(word) && words_with_two_vowels(word) >= 2 }

  # result.combination(3).to_a

    (0...words_with_two_vowels.length - 2).each do |i|
    (i + 1...words_with_two_vowels.length - 1).each do |j|
      (j + 1...words_with_two_vowels.length).each do |k|
        result.push([words_with_two_vowels[i], words_with_two_vowels[j], words_with_two_vowels[k]])
      end
    end
  end

end
p find_triple_with_vowels("This is a test sentence with some vowels") == [["sentence", "some", "vowels"]]
p find_triple_with_vowels("The quick brown fox jumps over the lazy dog") == []
p find_triple_with_vowels("Beautiful, bright, and sunnier days are lovely") == [["Beautiful,", "sunnier", "are"], ["Beautiful,", "sunnier", "lovely"], ["Beautiful,", "are", "lovely"], ["sunnier", "are", "lovely"]]

puts

=begin
PROBLEM
=======
Given a String of Words, return an Array of Triplets, where each Triplet is an Array
of words that contain at least (2) vowels.

Rules
------
  + validation?
  + case-sensitivity : maybe..?
  + determine valid_words : words that contain at least 2 vowels

DS
=======
String --> ___ --> Array
Input : String
  + words separated by spaces

Intermediate
-------------
+ generate Array of Words
+ determine vowel count of each word
+ generate Array of valid_words
  + words with vowel counts of 2 or more
+ combine valid_words in 3s


Output : Array
  + elements : sub-Arrays -- `Triplets`
    + elements : words


ALGORITHM
=========
> helper -- `is_valid?`
  + in : string
  + out : Boolean
    - `true` : contains >=2 vowels
    - `false` otherwise

+ generate Array of Words by spitting input on spaces
+ generate Array of Valid_Words by selecting Words if they are valid
> generate Array of Triplets -- `#combination`?
> what if not `#combination?`
  + iterate over elements from first to 3rd-to-last with indices
    + iterate over remaining elements up to 2nd-to-last with indices
      + iterate over remaining elements
        + create Array with outermost element, second level element, and innermost element
        + add Array to Array of triplets

+ return Triplets

=end
def is_valid?(word)
  vowels = "aeiou"
  characters = word.chars

  count = 0
  characters.each {|char| count += 1 if vowels.include?(char)}

  count >= 2 ? true : false
end

def all_triplets(words)
  triplets = []

  0.upto(words.length - 3) do |a| #because targetting arrays of 3
    first_word = words[a]
    (a + 1).upto(words.length - 2) do |b|
      middle_word = words[b]
      (b + 1).upto(words.length - 1) do |c|
      last_word = words[c]
      triplets << [first_word, middle_word, last_word]
      end
    end
  end
  
  triplets
end


def find_triple_with_vowels(str)
  words = str.split
  valid_words = words.select {|word| is_valid?(word)}

  # trips = valid_words.combination(3).to_a OR lines 200-209 if combinations is not allowed
  trips = all_triplets(valid_words)

  trips
end
p find_triple_with_vowels("This is a test sentence with some vowels") == [["sentence", "some", "vowels"]]
p find_triple_with_vowels("The quick brown fox jumps over the lazy dog") == []
p find_triple_with_vowels("Beautiful, bright, and sunnier days are lovely") == [["Beautiful,", "sunnier", "are"], ["Beautiful,", "sunnier", "lovely"], ["Beautiful,", "are", "lovely"], ["sunnier", "are", "lovely"]]