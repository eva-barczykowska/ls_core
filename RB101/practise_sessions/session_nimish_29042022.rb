# Object Mutability / Mutating Methods

def fix(value)
  value = value.upcase
  value.concat('!')
end

s = 'hello'
t = fix(s)

# What values do `s` and `t` have? Why?

# On `lines 3 to 6` a method named `fix` is defined with one parameter `value`.
# On `line 8` a local variable `s` is initialized to the string object `'hello'`.
# On `line 9` local variable `t` is initialized to the return value of the method `fix`
# with the object being referenced by local variable `s` as the argument.
#
# After the method call, the parameter `value` points to the string object being referenced by local variable `s`,
# and `value` is availabe as a local variable within the scope of the method definition.
#
# On `line 4` the local variable `value` is reassigned to the return value of the method `upcase` being called on the object being referenced by `value`.
# After this, local variable points to a new string object with value `HELLO`,
# whereas the local variable `s` continues to point to the string object `hello`.
#
# On `line 5` the method `concat` is called on the object being referenced by
# local variable `value` and the string `'!'` is passed as an argument.
# The method `concat` being a mutating method modifies the object to the value `'HELLO!'`.
# Since this is the last line of the method, the method returns the string `'HELLO!'`.

=begin

Write a function that, given a string of text (possibly with punctuation and line-breaks), returns an array of the top-3 most occurring words, in descending order of the number of occurrences.

Assumptions:
A word is a string of letters (A to Z) optionally containing one or more apostrophes (') in ASCII. (No need to handle fancy punctuation.)
Matches should be case-insensitive, and the words in the result should be lowercased.
Ties may be broken arbitrarily.
If a text contains fewer than three unique words, then either the top-2 or top-1 words should be returned, or an empty array if a text contains no words.
Examples:
top_3_words("In a village of La Mancha, the name of which I have no desire to call to
mind, there lived not long since one of those gentlemen that keep a lance
in the lance-rack, an old buckler, a lean hack, and a greyhound for
coursing. An olla of rather more beef than mutton, a salad on most
nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
on Sundays, made away with three-quarters of his income.")
# => ["a", "of", "on"]

top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e")
# => ["e", "ddd", "aa"]

top_3_words("  //wont won't won't")
# => ["won't", "wont"]
Bonus points (not really, but just for fun):
Avoid creating an array whose memory footprint is roughly as big as the input text.
Avoid sorting the entire array of unique words.
=end

# Input: String
# Output: array of strings

# Rules:
# - array of most frequently occuring words in descending order
# - case insensitive
# - words can include (')
# - top three words to be returned
# - if less then top 2 or top 1
# - if none then empty Array

# Algorithm:
# - init var `clean_str` -> string with all special characters removed apart from (') and spaces and lowercased
# - split the string into words in an array -> var `words`
# - sort the array in the descending order of appearance.
# - return top 3 / top 2 / top 1 value


def top_3_words(string)
  words = string.delete("^a-zA-Z' ").downcase.split(' ') #delete everything except a-z and apostrophy and space, then make it an array
  words = words.select { |word| word =~ /[a-z]/ } # select words, taking care of the edge case when it's just an apostrophy as in top_3_words("  '  ") == []
  result = words.uniq.sort_by do |word|
    words.count(word)
  end
  result.reverse[0..2]
end


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
