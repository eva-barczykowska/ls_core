=begin
[Train: Typoglycemia Generator \|
# Codewars](https://www.codewars.com/kata/55953e906851cf2441000032/train/ruby)
5 kyu
Background
There is a message that is circulating via public media that claims a reader
can easily read a message where the inner letters of each words is scrambled,
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

1) words are seperated by single spaces
2) only spaces separate words, special characters do not, for example:
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
# - strip all the words of first and last characters
# - find out if there are any special characters
# - if yes, find out their position
# - remove special characters
# - sort the remaining characters in words alphabetically
#
# - insert special characters where they used to be
# - add first and last characters of the word where they used to be
# - return the word
# -- then split the sentence into words and do the same for each word
# split the methods into scramble and unscramble and call other methods inside
# those 2 methods
# -- then see into special cases / test cases

def scramble_words(words)
  special_characters = ["-", "'", ",", "."]
  if words.size == 1 || words.size == 2
    return words
  elsif words.empty?
    return ""
  else
    array = words.chars
    p words
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

# p scramble_words('professionals') == 'paefilnoorsss'
# p scramble_words('i') == 'i'
# p scramble_words('') == ''
# p scramble_words('me') == 'me'
# p scramble_words('you') == 'you'
# p scramble_words('card-carrying') == 'caac-dinrrryg'
# p scramble_words("shan't") == "sahn't"
p scramble_words('-dcba') == '-dbca'
# p scramble_words('-dcba')
# p scramble_words('dcba.') == 'dbca.'
# p scramble_words("you've gotta dance like there's nobody watching, love \
#                  like you'll never be hurt, sing like there's nobody listening,\
#                  and live like it's heaven on earth.") == "you've gotta dacne\
#                  like teehr's nbdooy wachintg, love like ylo'ul neevr be hrut,\
#                  sing like teehr's nbdooy leiinnstg, and live like it's haeevn\
#                  on earth."
