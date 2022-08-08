=begin
Double Char (Part 2)
Write a method that takes a string, and returns a new string in which
every consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation,
and whitespace should not be doubled.

PEDAC
Problem
-I have to write a method that takes a string and returns a NEW STRING
-that new string has the consonants from the original string doubled
-vowels, spaces, digis and punctuation is not doubled in the new string

Examples:
double_consonants('String') == "SSttrrinngg"
double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
double_consonants("July 4th") == "JJullyy 4tthh"
double_consonants('') == ""

Data Structures
-input: string
-middle: array
-output: string

Algorighm
define consonants, lowercase and uppercase
-divide the string into single characters
-look at every character and if it is a consonant, add it to the result
-return the result

Code
=end

LOWERCASE = ['b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'p', 'r', 's', 't', 'w', 'v', 's', 't', 'x', 'y', 'z']
UPPERCASE = LOWERCASE.map { |c| c.upcase  }
CONSONANTS = LOWERCASE + UPPERCASE

def double_consonants(str)
  res = []
  str = str.split("").map! do |character|
     if CONSONANTS.include?(character)
       res << character << character
     else
       res << character
     end
   end
   res.join("")
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""

puts ""

# ls solution:

CONSONANTS_1 = %w(b c d f g h j k l m n p q r s t v w x y z)

def double_consonants(string)
  result = ''
  string.each_char do |char|
    result << char
    result << char if CONSONANTS_1.include?(char.downcase)
  end
  result
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""

puts ""

# other solutions:
CONSONANTS_2 = /[A-z&&[^aeiou]]/

def double_consonants(string)
  string.chars.each_with_object("") do |char, new_string|
    char.match?(CONSONANTS_2) ? new_string << char * 2 : new_string << char
  end
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""

puts ""

CONSONANTS_3 = ('a'..'z').to_a - %w(a e i o u)

def double_consonants(string)
  string.chars.map do |chr|
    CONSONANTS_3.include?(chr.downcase) ? chr * 2 : chr
  end.join
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""

puts ""

def double_consonants(string)
  string.chars.inject('') do |sum, char|
    sum += char.match?(/[^aeiou\d\W]/i) ? char * 2 : char
  end
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""

puts ""

CONSONANTS_4 = 'bcdfghjklmnpqrstvwxyz'

def double_consonants(str)
  result = ''

  str.each_char do |char|
    if CONSONANTS.include?(char.downcase)
      result << char << char
    else
      result << char
    end
  end

  result
end
p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""
