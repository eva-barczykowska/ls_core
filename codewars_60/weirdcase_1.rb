#Write a function toWeirdCase (weirdcase in Ruby) that accepts a string,
# and returns the same string with all even indexed characters in each word upper cased,
# and all odd indexed characters in each word lower cased. The indexing just explained is zero based,
# so the zero-ith index is even, therefore that character should be upper cased and you need to start over for each word.

#The passed in string will only consist of alphabetical characters and spaces(' ').
# Spaces will only be present if there are multiple words. Words will be separated by a single space(' ').

# Examples:
# weirdcase( "String" )#=> returns "StRiNg"
# weirdcase( "Weird string case" );#=> returns "WeIrD StRiNg CaSe"
# PEDAC
# ************** Problem **************
#-write a method that takes a str as an argument
# -the method returns THE SAME STRING with all even indexed characters in each word upper-cased
#  and all odd indexed characters lowercased
# -the indexing is zero based, zero is even so the first character will be upper-cased in each word because
# -we start over with each word, we do not consider spaces
# -spaces separate multiple words, words are separated with only 1 space
# ************** Examples **************
# weirdcase( "String" )#=> returns "StRiNg"
# weirdcase( "Weird string case" );#=> returns "WeIrD StRiNg CaSe"
# ************** Data Structures **************
# Input: string
#
# Output: transformed string, all even-indexed characters are UPPERCASED, all odd-indexed characters are LOWERCASED
# ************** Notes **************
# String Element Reference method to change characters at a certain index
# ************** Algorithm **************
#-convert the str into an array
# -iterate over the array accessing the word
# -if the word's index is even, iterate over the characters of the word with index
# -if the index of the character is positive, upcase character at that index
# -else, lowercase character at that index
#     ************** Code **************
#
# ************** Refactor **************
#
# not working example
puts "my not working example that I fixed by assigning the return value of lines 2-10 to `result`:"
def weirdcase(str)
  result = str.split(" ").each do |word| # the return value here => look at the next comment
             (0...word.size).each do |char_index|
               if char_index.even?
                 word[char_index] = word[char_index].upcase
               else
                 word[char_index] = word[char_index].downcase
               end
               #the return value here is ["WeIrD", "StRiNg", "CaSe"] but we haven't captured it anywhere and we can't process it further
             end
  end

  result.join(" ")
end
p weirdcase("String") == "StRiNg"
p weirdcase("Weird string case") == "WeIrD StRiNg CaSe"

puts
puts "Sedrick's solution"
def weirdcase(str)
  arr = str.split

  arr.each do |word|
    (0...word.size).each do |char_index|
      if char_index.even?
        word[char_index] = word[char_index].upcase
      else
        word[char_index] = word[char_index].downcase
      end
    end
    # arr.join(" ") # join here will not work, this is before I iterated through all the words, only then I can join the array
  end

  arr.join(" ") # here I can join the array into string, after I iterated over it
end
p weirdcase( "String" ) == "StRiNg"
p weirdcase( "Weird string case" ) == "WeIrD StRiNg CaSe"

puts

def weirdcase(str)
  arr = str.split
  arr.each do |word|
    (0...word.size).each do |indx_char|
      if indx_char.even?
        word[indx_char] = word[indx_char].upcase
      else
        word[indx_char] = word[indx_char].downcase
      end
    end
  end
  arr.join(" ")
end
p weirdcase( "String" ) == "StRiNg"
p weirdcase( "Weird string case" ) == "WeIrD StRiNg CaSe"

puts

=begin
Write a function that accepts a string, and returns the same string with all even indexed characters in each word upper cased, and all odd indexed characters in each word lower cased. The indexing just explained is zero based, so the zero-ith index is even, therefore that character should be upper cased and you need to start over for each word.

The passed in string will only consist of alphabetical characters and spaces(' '). Spaces will only be present if there are multiple words. Words will be separated by a single space(' ').

Examples:
"String" => "StRiNg"
"Weird string case" => "WeIrD StRiNg CaSe"
PEDAC
P:
- write a method that takes 1 argument, a String
- method returns the same string with:

- all even-indexed chars in each word upper cased
- all odd-indexed chars in each word lower cased

- indexing is 0 based, index 0 is even, index 1 is odd
- start over for each word

-str will have only letters and spaces, spaces are present when there are multiple words
- words are separated by a single space

E:
"String" => "StRiNg"
=> ix of S is 0 so even so capital
=> ix of t is 1 so odd so lowercase
=> ix of r is 2 so even so capital
=> ix of i is 3 so odd so lowercase

"Weird string case" => "WeIrD StRiNg CaSe"

DS:
input: str
output: mutated str

A:
- provide 2 solutions, 1 with new string, other one with the same String object but mutated
- what is required here?

A1
- if input_str includes " " it means it's a sentence:
  - split on space => you get an array of words
  - transform this array of words, each word into an array of ccharacters
  - iterate over this array of characters with index
  - transform char into capital if index is even, else into lowercase character
  - transofrm / join to get the words again
  - transofrm / join once gain to get the whole transformed sentence
- else if no space, then
  - split on a character
  - iterate over the string characters with index
  - transform / upcase characters at even indices
  - join on a character to get the word again
=end

def to_weird_case(str)
  if str.include?(" ")
    str
      .split(" ") # sentence split into array or words
      .map { |word| word.split("") } # each word split into an array or characters
      .map { |array_of_letters| array_of_letters.map.with_index do |char, index | # transform the characters
        if index.even?
          char.upcase
        else
          char.downcase
        end
      end }
      .map(&:join).join(" ")
  else
    str.split("").map.with_index do |char, index| # split the word into an array of characters
      if index.even?
        char.upcase
      else
        char.downcase
      end
    end.join("")
  end
end
p to_weird_case("String") == "StRiNg"
p to_weird_case("Weird string case") == "WeIrD StRiNg CaSe"

puts

# N:
# map.with_index

# A:
# - MUTATING THE OBJECT, RETURNS THE SAME OBJECT ALBEIT MUTATED
# - write a helper method to transform each word first

def even_upcase(word) # ~~~~ very nice!~~~~
  word.split(//).map.with_index { |v, k| k.even? ? v.upcase : v }.join()
end

# p even_upcase("String")

def weirdcase string
  string.split(" ").map { |v| even_upcase(v) }.join(" ")
end
str1 = "String"
p "str1_object_id is #{str1.object_id}"

str2 = "Weird string case"

p "str2_object_id is #{str2.object_id}"

p to_weird_case(str1) == "StRiNg"
p "str1_object_id is #{str1.object_id}"
p to_weird_case(str2) == "WeIrD StRiNg CaSe"
p "str2_object_id is #{str2.object_id}"


