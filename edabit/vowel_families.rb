=begin
Write a method that selects all words that have all the same vowels (in any order and/or number) as the first word,
including the first word.

Examples
same_vowel_group(["toe", "ocelot", "maniac"]) == ["toe", "ocelot"]

same_vowel_group(["many", "carriage", "emit", "apricot", "animal"]) == ["many"]

same_vowel_group(["hoops", "chuff", "bot", "bottom"]) == ["hoops", "bot", "bottom"]

Notes
Words will contain only lowercase letters, and may contain whitespaces.
Frequency does not matter (e.g. if the first word is "loopy", then you can include words with any number of o's,
so long as they only contain o's, and not any other vowels).

PEDAC
P:
- write a method that takes an array of strings as an argument
- strings are lowercase and only numbers, can contain spaces
- method returns an array with words from the input which contain the same vowels as the first word(including the
  first word)

E:
same_vowel_group(["toe", "ocelot", "maniac"]) == ["toe", "ocelot"]
=> toe has 'o' and 'e', out of other words only "ocelot" has both

same_vowel_group(["many", "carriage", "emit", "apricot", "animal"]) == ["many"]
=> "many" has "a" and "y", no other word has both so only "many" is returned in an array

same_vowel_group(["hoops", "chuff", "bot", "bottom"]) == ["hoops", "bot", "bottom"]
=> "hoops" has "o" twice and only words which have "o" are returned in an array

DS:
input: array of words
middle: hash
output: array of words
A:
- define vowels
- count vowels and their occurrences from the first word and store results in `first_word_vowels` hash
- get only unique values

- iterate over the input array
- transform the input array words into characters, you get inner arrays with characters representing each word
- if the input first_word_vowels converted to array_of_chars has all the keys from the `count` hash
- add it to result


- return `result`
=end

VOWELS = %w( a e o u i y)

def same_vowel_group(arr)
  res = []
  first_word_vowels = arr[0].chars.delete_if { |char| !VOWELS.include?(char) }.uniq

  input = arr.map { |word| word.chars }
  #[["t", "o", "e"], ["o", "c", "e", "l", "o", "t"], ["m", "a", "n", "i", "a", "c"]]

  input.each do |subarr|
    if first_word_vowels.all? { |v| subarr.include?(v) }
      res << subarr
    end
  end
  res
end
p same_vowel_group(["toe", "ocelot", "maniac"]) #== ["toe", "ocelot"]
p same_vowel_group(["many", "carriage", "emit", "apricot", "animal"]) #== ["many"]
p same_vowel_group(["hoops", "chuff", "bot", "bottom"]) #== ["hoops", "bot", "bottom"]
