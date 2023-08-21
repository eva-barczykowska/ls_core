# 10.Most frequently used words in a text
# # (https://www.codewars.com/kata/51e056fe544cf36c410000fb/train/ruby)
# # 4 kyu
# =begin
# Write a function that, given a string of text (possibly with punctuation and line-breaks),
# returns an array of the top-3 most occurring words, in descending order of the number of occurrences.

# Assumptions:
# A word is a string of letters (A to Z) optionally containing one or more apostrophes (') in ASCII.
# (No need to handle fancy punctuation.)
# Matches should be case-insensitive, and the words in the result should be lower-cased.
# Ties may be broken arbitrarily.
# If a text contains fewer than three unique words, then either the top-2 or top-1 words
# should be returned, or an empty array if a text contains no words.

# Goal: intake a string and output an array that contains the most frequently appearing
# case insensitive words in the string.

# input: String
# output: Array

# Rules:
# - the top words are case insensitive, 'Aa' == 'aa'
# - ignore all special characters except for apostrophes.
# - special characters don't count as words (probably stripping them)
# - the top 3 words are returned
# - if there's less than 3 words:
#   - return top 2
#   - return top 1
#   - return [] if the text is empty
# - avoid sorting the unique Array
#
# Examples:
# top_3_words("In a village of La Mancha, the name of which I have no desire to call to
# mind, there lived not long since one of those gentlemen that keep a lance
# in the lance-rack, an old buckler, a lean hack, and a greyhound for
# coursing. An olla of rather more beef than mutton, a salad on most
# nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
# on Sundays, made away with three-quarters of his income.")
# # => ["a", "of", "on"]
#
# top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e")
# # => ["e", "ddd", "aa"]
# 'DDD' == 'ddd'
# DdD: ==> remove any special characters except for '
# top_3_words("  //wont won't won't")
# # => ["won't", "wont"]
#
# Bonus points (not really, but just for fun):
# Avoid creating an array whose memory footprint is roughly as big as the input text.
# Avoid sorting the entire array of unique words.
#
# D:
# string --> array of words --> array of top words (0 - 3 elements)
#
# A:
# input: `string`
# - return empty array if the stripped string's characters are all special characters
# - initialize an `top_three_array`
# - split the input string into an array of words  -> '....'
# - iterate over this Array
#   - for every word, downcase the word
#   - for every word, remove the special characters that aren't apostrophes  -> ''
#   - push the current down-cased string into `top_three_array --> ['a', 'b', 'c']
#   - sort the `top_three_array` based on the count
#   - if current word has a higher count than one of the elements currently in the array,
#     then replace the first element with the current down-cased word.
# - return the `top_three_array`
# =end

def top_3_words(string)
  return [] if string.strip.chars.all? { |char| char =~ /[^a-z]/}

  top_three_array = []
  word_array = string.split.map(&:downcase)
  # p word_array.count('on') > word_array.count('in')
  # p word_array.count('on') # => 4
  # p word_array.count('in') # => 2

  word_array.uniq.each do |word| #iterate over the word! ["a", "b", "c","d", "e"]
    word = word.delete("^'a-z")
    if top_three_array.size < 3 && word != ''
      top_three_array << word
      top_three_array.uniq!
      top_three_array = top_three_array.sort_by { |word| word_array.count(word) }.reverse
    elsif word_array.count(word) > word_array.count(top_three_array[2]) && word != ''
      top_three_array.pop
      top_three_array << word  # a, in, of ==> a, of, in
      top_three_array = top_three_array.sort_by { |word| word_array.count(word) }.reverse
    end
  end

  top_three_array#.sort_by { |word| word_array.count(word) }.reverse
end
#
# # [a, b, c]
# # [3, 1, 2]
# # [a, c, b] --> b
# # [3, 2, 1]

p top_3_words("a a a  b  c c  d d d d  e e e e e") == ["e", "d", "a"]
p top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e") == ["e", "ddd", "aa"]
p top_3_words("  //wont won't won't ") == ["won't", "wont"]
p top_3_words("  , e   .. ") == ["e"]
p top_3_words("  ...  ") == []
p top_3_words("  '  ") == []
p top_3_words("  '''  ") == []
p top_3_words("""In a village of La Mancha, the name of which I have no desire to call to
mind, there lived not long since one of those gentlemen that keep a lance
in the lance-rack, an old buckler, a lean hack, and a greyhound for
coursing. An olla of rather more beef than mutton, a salad on most
nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
on Sundays, made away with three-quarters of his income.""") == ["a", "of", "on"]
puts
=begin
************** Problem **************
-write a method that takes a str as an argument
-str can have punctuation or line breaks
-the method returns the 3 top most occurring words, in descending order if number of occurences
-words will consist of letters and apostrophes
-any other characters are not part of word and should be treated as whitespace

-matches should be case insensitive
-words in result should be lowercased

-if the text contains fewer than 3 unique words, return top 2 or 1
-return an empty array if text has no words
************** Examples **************
top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e") == ["e", "ddd", "aa"]
=> e occurs 7 times, ddd occurs 5 times, aa occurs 3 times

top_3_words("  //wont won't won't") = ["won't", "wont"]
=> fewer than 3 words, won't occurs twice and wont occurs once

top_3_words("a a a  b  c c  d d d d  e e e e e") == ["e", "d", "a"]
=> e ocurs 5 times, d occurs 4 times and a occurs 3 times

top_3_words("  , e   .. ") == ["e"]
=> just one word so return that word

top_3_words("  ...  ") == []
=> no words, retun an empty array
top_3_words("  '  ") == []

=> ' considered as a word but only 1 -- why empty array? possibly because no letters?

top_3_words("  '''  ") == []
=> possibly because no letters? => return empty array

top_3_words("""In a village of La Mancha, the name of which I have no desire to call to
mind, there lived not long since one of those gentlemen that keep a lance
in the lance-rack, an old buckler, a lean hack, and a greyhound for
coursing. An olla of rather more beef than mutton, a salad on most
nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
on Sundays, made away with three-quarters of his income.""") == ["a", "of", "on"]
************** Data Structures **************
Input: string

Output: array of strings

************** Algorithm **************
-divide the string on a space - that's a valid divider
-strip the string of special characters but leave apostrophe
-count occurences and store them in a hash

-if hash.size is less than 3, return all keys
else
-iterate over the hash and return the KEYS for the 3 topmost VALUES

************** Notes **************
-tally for counting strings and their occurences

************** Code **************

************** Refactor **************
=end

def top_3_words(text)
  text = text.downcase.split(" ").delete_if { |char| char =~ /[^A-Za-z]/ }
  p text
  counts = text.tally
  p counts

  if counts.size < 3 and counts.keys.none? {|char| char =~ /[A-Za-z]/}
    return []
  elsif
  counts.size < 3 and counts.keys.any?
  end
end
p top_3_words("a a a  b  c c  d d d d  e e e e e") #== ["e", "d", "a"]
p top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e") == ["e", "ddd", "aa"]
p top_3_words("  //wont won't won't ") #== ["won't", "wont"]
p top_3_words("  , e   .. ") #== ["e"]
# so if it's only special characters, whatever they are, return []
p top_3_words("  ...  ") #== []
p top_3_words("  '  ") #== []
p top_3_words("  '''  ") #== []
p top_3_words("\"\"In a village of La Mancha, the name of which I have no desire to call to
mind, there lived not long since one of those gentlemen that keep a lance
in the lance-rack, an old buckler, a lean hack, and a greyhound for
coursing. An olla of rather more beef than mutton, a salad on most
nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
on Sundays, made away with three-quarters of his income.\"\"") == ["a", "of", "on"]

puts "sedrick"
def to_weird_case(str)
  arr = str.split(" ")

  counter = 2

  loop do
    # break if counter >= arr.size
    word = arr[counter]
    word.each_char.with_index do |char, index|
      if index.odd?
        char.upcase!
      else
        char
      end
    end
    counter += 3

    break if counter >= arr.size
  end
  arr
end

str = "Lorem Ipsum is simply dummy text of the printing"
p to_weird_case(str) == 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'






