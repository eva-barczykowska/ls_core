=begin
33. Replace With Alphabet Position
(https://www.codewars.com/kata/546f922b54af40e1e90001da)
6 kyu
In this kata you are required to, given a string, replace every letter with its position in the alphabet.

If anything in the text isn't a letter, ignore it and don't return it.

"a" = 1, "b" = 2, etc.

Example
alphabet_position("The sunset sets at twelve o' clock.")
Should return "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11" (as a string)
PEDAC TEMPLATE

************** Problem **************
-write a method that takes a string argument
-the string will have letters and special characters
-return a string but instead of letters, it will have each letter's position in the alphabet
-if a character is not a letter, it will be ignored
-if a string doesn't contain letters but only other characters, an empty string will be returned by the method

Questions:

************** Examples **************
p alphabet_position("The sunset sets at twelve o' clock.") == "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11"
p alphabet_position("-.-'") == ""

************** Data Structures **************
input: String
output: also String

************** Algorithm **************
-take the string argument and split it into characters
-downcase the string argument
-get rid of anything that is not a letter
-initialize alphabet of all English letters from - to 26
-map the str argument to the strings letter index in the alphabet, i.e.
-look at each letter in the string argument - which index does it have in the alphabet?
-once you find out which index it has in the alphabet, replace the current letter with its position in the alphabet (so with its index)
-do it for every letter in the string
-join the array into a string and return it

************** Code **************
=end

def alphabet_position(words)
  conversion_hash = {'a' => 1, 'b' => 2, 'c' => 3, 'd' => 4, 'e' => 5, 'f' => 6, 'g' => 7, 'h' => 8, 'i' => 9, 'j' => 10, 'k' => 11, 'l' => '12', 'm' => '13', 'n' => '14', 'o' => '15', 'p' => '16', 'q' => '17', 'r' => '18', 's' => '19', 't' => '20', 'u' => '21' , 'v' => '22', 'w' => '23' , 'x' => '24', 'y' => '25', 'z' => '26'}

  words.downcase.gsub(/[^a-z]/, '').chars.map do |char|
    char = conversion_hash[char]
  end.join(' ')

end

p alphabet_position("The sunset sets at twelve o' clock.") == "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11"
p alphabet_position("-.-'") == ""

puts

ALPHABET = ('a'..'z').to_a

def alphabet_position(str)
  arr = str.downcase.split(//).select { |char| char =~ /[a-z]/ }
  arr.map { |letter| ALPHABET.index(letter)}.map { |num| num + 1 }.join(" ")
end
p alphabet_position("The sunset sets at twelve o' clock.") == "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11"
p alphabet_position("-.-'") == ""



