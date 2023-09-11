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