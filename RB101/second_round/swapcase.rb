=begin
Question:
Swap Case
Write a method that takes a string as an argument and returns a new string
in which every uppercase letter is replaced by its lowercase version,
and every lowercase letter by its uppercase version.
All other characters should be unchanged.

You may not use String#swapcase; write your own version of this method.

-----------------------
Questions:

Problem (Rewrite if needed else skip):
- Return new string with uppercase/lowercase letters all swapped
- All other characters should remain the same
Input: String
Output: New string with character case swapped
Rules:
  Explicit Requirements
  - Returns a NEW String
  - Uppercase chars replaced with lowercase, and lowercase char with uppercase
  - All others remain the same

  Implicit Requirements

-----------------------
Examples:
swapcase('CamelCase') == 'cAMELcASE'
swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

-----------------------
Data Structure: Array to convert characters
Algorithm:
- initialize a result array
- split the str into an array of characters
- define alphabet of lowercase and uppercase letters
- for every character ask if it is belongs to any of the aphabets
- if it belongs to the lowercase alphabet, upcase it and add to the result array
- if it belongs to the uppercase alphabet, lowercase it and add to the result array
- if it doesn't belong anywhere, just add it as it is to the result array
-join the result array and return it

-----------------------
Code:
=end

LOWERCASE = ('a'..'z').to_a
UPPERCASE = ('A'..'Z').to_a

def swapcase(str)
  res = []
  arr = str.split("")
  arr.each do |char|
    if LOWERCASE.include?(char)
      res << char.upcase
    elsif UPPERCASE.include?(char)
      res << char.downcase
    else
      res << char
    end
  end
  res.join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'