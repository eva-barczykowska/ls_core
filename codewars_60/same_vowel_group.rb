=begin
Write a method that selects all words that have all the same required_vowels (in any order and/or number) as the first word, including the first word.

Notes:
Words will contain only lowercase letters, and may contain whitespaces.
Frequency does not matter (e.g. if the first word is "loopy", then you can include words with any number of o's, so long as they only contain o's, and not any other required_vowels).

Examples:

same_vowel_group(["toe", "ocelot", "maniac"]) == ["toe", "ocelot"]

same_vowel_group(["many", "carriage", "emit", "apricot", "animal"]) == ["many"]

same_vowel_group(["hoops", "chuff", "bot", "bottom"]) == ["hoops", "bot", "bottom"]
P:
-write a method that takes an array of words as an argument
-the method returns all words that have ALL the same required_vowels
-the required_vowels can be more or less as long as they are same/there are no other required_vowels

-words are lowercase, can have spaces
-Frequency doesn't matter
-return the first words as well
E:
same_vowel_group(["toe", "ocelot", "maniac"]) == ["toe", "ocelot"]
=>toe has o, e => ocelot, toe,
-at least 1 o and 1 e should be there in other words AND no other required_vowels

same_vowel_group(["many", "carriage", "emit", "apricot", "animal"]) == ["many"]
=>many

same_vowel_group(["hoops", "chuff", "bot", "bottom"]) == ["hoops", "bot", "bottom"]
=>
DS:
input: an array of words/strings
output: an array of words/strings

A:
-initialize `result` empty array
-initialize `required_vowels`
-take the first word, remove it and save it into an array
-find out which required_vowels it has
-save it to `target_vowels`
-assumption: the first words WILL have a vowel

-iterate over the remaining words in the input array
-1. does this word contain all the target required_vowels?
-2. and it does NOT contain any other required_vowels from VOWELS reference
if 1 and 2 are true, add this word to the `result` array
  C:
  R:
=end

def same_vowel_group(array)
  vowels = ["a", "e", "o", "i", "u"]
  result = []

  first_word = array.shift
  result << first_word
  first_word = first_word.chars
  target_vowels = []

  first_word.each do |ch|
    if vowels.include?(ch)
      target_vowels << ch
    end
  end

  other_vowels = vowels - target_vowels

  array.each do |word|
    word1 = word.chars.select { |ch| vowels.include?(ch)}
    if word1.all? { |ch| target_vowels.include?(ch)} && word1.none? { |ch| other_vowels.include?(ch)}
      result << word
    end
  end
  result
end
p same_vowel_group(["toe", "ocelot", "maniac"]) == ["toe", "ocelot"]
p same_vowel_group(["many", "carriage", "emit", "apricot", "animal"]) == ["many"]
p same_vowel_group(["hoops", "chuff", "bot", "bottom"]) == ["hoops", "bot", "bottom"]

puts


def same_vowel_group(array)
  required_vowels = array[0].delete("^aeiou") # delete everything else but keep the required_vowels!
  output = []

  array.each do |word|
    if word.delete("^aeiou").chars.all? { |char| required_vowels.include?(char) }
      output << word
    end
  end
  output
end

p same_vowel_group(["toe", "ocelot", "maniac"]) == ["toe", "ocelot"]
p same_vowel_group(["many", "carriage", "emit", "apricot", "animal"]) == ["many"]
p same_vowel_group(["hoops", "chuff", "bot", "bottom"]) == ["hoops", "bot", "bottom"]
