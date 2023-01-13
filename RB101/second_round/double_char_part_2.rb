=begin
Question:
Double Char (Part 2)
Write a method that takes a string, and returns a new string in which every
consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and
whitespace should not be doubled.
-----------------------
Questions:

Problem (Rewrite if needed else skip):

Input: String literal
Output: New transformed string literal
Rules:
  Explicit Requirements
  - Method returns a new string with every consonant char doubled
    - Vowels, digits, punctuation, and spaces should not be doubled
  - Method returns a new string

  Implicit Requirements
  - Empty string returns empty string
-----------------------
Examples:
double_consonants('String') == "SSttrrinngg"
double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
double_consonants("July 4th") == "JJullyy 4tthh"
double_consonants('') == ""

-----------------------
Data Structure: String to array of characters, characters to be
transformed as needed, then converting back to string
Algorithm:
- Define `double_consonants` with param `str`
- Initialize an `alphabet` array that includes all upper and lowercase letters
- Initialize a `consonant` variable equal to selecting all letters
  except vowels in the `alphabet` array
- Initialize `new_str` to return value of iterating through `str`
  characters and transforming them into a new array
- If the character is a consonant, double it into the new array;
  otherwise move single character into new array
-Implicitly return result of mapping characters joined back together


-----------------------
Code:
=end

def double_consonants(str)
  alphabet = ('a'..'z').to_a + ('A'..'Z').to_a
  consonants = alphabet.reject do |letter|
    letter =~ /[aeiouAEIOU]/ #checks every letter if it is in this group, if it is, it rejects it
  end
  new_str = str.chars.map do |char|
    if consonants.include?(char)
      char * 2
    else
      char
    end
  end
  new_str.join
end


p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""

puts
# refactored the if statement
def double_consonants(str)
  alphabet = ('a'..'z').to_a + ('A'..'Z').to_a
  consonants = alphabet.reject do |letter|
    letter =~ /[aeiouAEIOU]/
  end
  new_str = str.chars.map do |char|
    consonants.include?(char) ? char * 2 : char
  end
  new_str.join
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""


puts
# Double Char (Part 2)
# Write a method that takes a string, and returns a new string in which every
# consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and
#   whitespace should not be doubled.
# Algorithm
# -define consonants (lower case and upper case)
# -iterate over the string argument
# -if a character is a consonant, add it twice to the new string,
# -return the new string

def double_consonants(str)
  new_str = ''
  consonants = ('A'..'Z').to_a + ('a'..'z').to_a.reject { |char| char =~ /[aoueiAEOUI]/
                                 }
  new_str = str.chars.map do |char|
    consonants.include?(char) ? char * 2 : char
  end
  new_str.join
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""