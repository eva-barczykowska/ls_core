=begin
[Train: Typoglycemia Generator \|
# Codewars](https://www.codewars.com/kata/55953e906851cf2441000032/train/ruby)
5 kyu
Background
There is a message that is circulating via public media that claims a reader
can easily read a message where the inner letters of each str is scrambled,
as long as the first and last letters remain the same and the word contains
all the letters.

Another example shows that it is quite difficult to read the text where all
the letters are reversed rather than scrambled.

In this kata we will make a generator that generates text in a similar pattern,
but instead of scrambled or reversed, ours will be sorted alphabetically

Requirement
return a string where:

1) the first and last characters remain in original place for each word
2) characters between the first and last characters must be sorted
alphabetically
3) punctuation should remain at the same place as it started, for example:
shan't -> sahn't

Assumptions

1) str are seperated by single spaces
2) only spaces separate str, special characters do not, for example:
tik-tak -> tai-ktk
3) special characters do not take the position of the non special characters,
for example: -dcba -> -dbca DO NOT FULLY UNDERSTAND THIS
4) for this kata puctuation is limited to 4 characters:
hyphen(-), apostrophe('), comma(,) and period(.)
5) ignore capitalisation

for reference: http://en.wikipedia.org/wiki/Typoglycemia
=end

# algorithm:
# - split the word into characters
# - strip all the str of first and last characters
# - find out if there are any special characters
# - if yes, find out their position
# - remove special characters
# - sort the remaining characters in str alphabetically
#
# - insert special characters where they used to be
# - add first and last characters of the word where they used to be
# - return the word
# -- then split the sentence into str and do the same for each word
# split the methods into scramble and unscramble and call other methods inside
# those 2 methods
# -- then see into special cases / test cases
# if the first or last character is a special character, remove it store in a
#   speical array,
# then proceed like normal but after processing add that special character
# lastly, split the longest string into str and feed every word into the
# generator

def scramble_str(str)
  special_characters = ["-", "'", ",", "."]
  if str.size == 1 || str.size == 2
    str
  elsif str.empty?
    ""
  elsif str.start_with?("-", "'", ",", ".")
    puts "YES, it starts with a special character"
    str_and_their_first_special_characters = {}
    str_and_their_first_special_characters[str] = str.chr
    p str_and_their_first_special_characters
    p str
  elsif str.end_with?("-", "'", ",", ".")
    puts "YES, it finishes with a special character"
    str_and_their_last_special_characters = {}
    str_and_their_last_special_characters[str] = str[-1]
    p str_and_their_last_special_characters
    array = str.chop.chars
    p "this is my array"
    p array
    first_and_last = []
    first_and_last << array.first
    first_and_last << array.last
    p first_and_last
    array.shift
    array.pop
    p array
    special_characters_and_their_indexes = {}

    array.each_with_index do |character, index|
      if special_characters.include?(character)
        special_characters_and_their_indexes[index] = character
      end
    end
    p special_characters_and_their_indexes
    array.delete_if { |char| char == "-" || char == "'" || char == "," || char == "." }
    p array
    sorted_array = array.sort!
    p sorted_array
    #now insert at what position co tam jest, it would be good to have a hash
    special_characters_and_their_indexes.each do |k, v|
      sorted_array.insert(k, v)
    end
    p "At this point we have this sorted array, now "
    p sorted_array
    p sorted_array.unshift(first_and_last[0]).push(first_and_last[-1]).join

  else
    array = str.chars
    p str
    p special_characters
    p array
    first_and_last = []
    first_and_last << array.first
    first_and_last << array.last
    p first_and_last
    array.shift
    array.pop
    p array
    special_characters_and_their_indexes = {}

    array.each_with_index do |character, index|
      if special_characters.include?(character)
        special_characters_and_their_indexes[index] = character
      end
    end
    p special_characters_and_their_indexes
    array.delete_if { |char| char == "-" || char == "'" || char == "," || char == "." }
    p array
    sorted_array = array.sort!
    p sorted_array
    #now insert at what position co tam jest, it would be good to have a hash
    special_characters_and_their_indexes.each do |k, v|
      sorted_array.insert(k, v)
    end
      p sorted_array
      p sorted_array.unshift(first_and_last[0]).push(first_and_last[-1]).join
      # p sorted_array
      # p sorted_array.join("")
    end
end

p scramble_str('professionals') == 'paefilnoorsss'
p scramble_str('i') == 'i'
p scramble_str('') == ''
p scramble_str('me') == 'me'
p scramble_str('you') == 'you'
p scramble_str('card-carrying') == 'caac-dinrrryg'
p scramble_str("shan't") == "sahn't"
p scramble_str('-dcba') == '-dbca'
p scramble_str('-dcba') == '-dbca'
p scramble_str('dcba.') == 'dbca.'
p scramble_str("you've gotta dance like there's nobody watching, love like you'll never be hurt, sing like there's nobody listening, and live like it's heaven on earth.") == "you've gotta dacne like teehr's nbdooy wachintg, love like ylo'ul neevr be hrut, sing like teehr's nbdooy leiinnstg, and live like it's haeevn on earth."

puts "************************************************************************"
# how Nimish solved it:

# Input: String
# Output: String
#
# Rules:
# - 1st and last characters to remain as it is
# - all characters in between to be sorted alphabetically
# - punctuations should appear as they do in the original String
# - punctuations are -> [-',.]

# Examples:
# - tik-tak -> tai-ktk
# - -dcba -> -dbca

# Algorithm:
# - split the input string into words - array assigned to `words`
# - iterate thorugh `words` and transform
#     - get the `clean_string` -> all punctuations removed
#     - alphabetically sort the `clean_string` from index 1 to -2
#     - add back the punctuations to the sorted `clean_string`
# - join the `words` array with a ' ' and return

def scramble_str(string)
  words = string.split(' ')
  words = words.map do |word|
    clean_chars = word.delete(",.'-").chars
    clean_chars[1..-2] = clean_chars[1..-2].sort
    sorted_word = ''
    word.size.times do |index|
      if word[index] =~ /[.',-]/
        sorted_word << word[index]
      else
        sorted_word << clean_chars.shift
      end
    end
    sorted_word
  end
  words.join(' ')
end

p scramble_str('professionals') == 'paefilnoorsss'
p scramble_str('i') == 'i'
p scramble_str('') == ''
p scramble_str('me') == 'me'
p scramble_str('you') == 'you'
p scramble_str('card-carrying') == 'caac-dinrrryg'
p scramble_str("shan't") == "sahn't"
p scramble_str('-dcba') == '-dbca'
p scramble_str('-dcba') == '-dbca'
p scramble_str('dcba.') == 'dbca.'
p scramble_str("you've gotta dance like there's nobody watching, love like you'll never be hurt, sing like there's nobody listening, and live like it's heaven on earth.") == "you've gotta dacne like teehr's nbdooy wachintg, love like ylo'ul neevr be hrut, sing like teehr's nbdooy leiinnstg, and live like it's haeevn on earth."

# Nimish - refactoring, split into 2 methods:

def scramble_str(string)
  words = string.split(' ')
  words = words.map { |word| sort_word(word) }
  words.join(' ')
end

def sort_word(word)
  clean_chars = word.delete(",.'-").chars
  p "these are the clean chars"
  p clean_chars
  clean_chars[1..-2] = clean_chars[1..-2].sort
  p "now sorted"
  p clean_chars
  sorted_word = '' # defining the resulting word
  word.size.times do |index|   # do it for as long as the word is
    if word[index] =~ /[.',-]/ # asking where the special characters are and
      sorted_word << word[index] #  then inserting them in the same position in the new word
    else
      sorted_word << clean_chars.shift
    end
  end
  sorted_word
end

p scramble_str('professionals') == 'paefilnoorsss'
p scramble_str('i') == 'i'
p scramble_str('') == ''
p scramble_str('me') == 'me'
p scramble_str('you') == 'you'
p scramble_str('card-carrying') == 'caac-dinrrryg'
p scramble_str("shan't") == "sahn't"
p scramble_str('-dcba') == '-dbca'
p scramble_str('-dcba') == '-dbca'
p scramble_str('dcba.') == 'dbca.'
p scramble_str("you've gotta dance like there's nobody watching, love like you'll never be hurt, sing like there's nobody listening, and live like it's heaven on earth.") == "you've gotta dacne like teehr's nbdooy wachintg, love like ylo'ul neevr be hrut, sing like teehr's nbdooy leiinnstg, and live like it's haeevn on earth."
