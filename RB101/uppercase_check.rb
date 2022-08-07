=begin
Uppercase Check
Write a method that takes a string argument, and returns true if all of the
alphabetic characters inside the string are uppercase, false otherwise.
Characters that are not alphabetic should be ignored.

Problem
-write a method that takes a str argument and returns true if all of the
alphabetic characters are uppercase, non-alphabetic characters are ignored.

Data Structures
input: string
output: boolean

Examples
uppercase?('t') == false
uppercase?('T') == true
uppercase?('Four Score') == false
uppercase?('FOUR SCORE') == true
uppercase?('4SCORE!') == true
uppercase?('') == true

Algorithm
declare a constant ALPHABET variable
-declare a constant array with alphabetic CAPITAL characters
-divide the string into single characters, this will give me an array
-iterate over the array and check if all the elements are present in the array of letters
-and if they are capital letters, return true

Code
=end
ALPHABET = ('a'..'z').to_a + ('A'..'Z').to_a
CAPITALS = ('A'..'Z').to_a

def uppercase?(str)
  str = str.split("")
  letters = str.select{ |letter| ALPHABET.include?(letter) }
  letters.all?{|letter| CAPITALS.include?(letter) }
end

def uppercase?(str)
  str = str.dup
  str.upcase! == nil #if no change was made, upcase method returns nil
end

def uppercase?(str)
  str == str.upcase #if change was made, upcase returns changed string
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true


puts ""

def uppercase?(string)
  return false if string.match?(/[a-z]/)
  true
end
p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true
