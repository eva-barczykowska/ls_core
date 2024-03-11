# [Train: Alphabetized \| Codewars](https://www.codewars.com/kata/5970df092ef474680a0000c9/train/ruby)
# 6 kyu
# The alphabetized kata
# Re-order the characters of a string, so that they are concatenated into a new string in
# "case-insensitively-alphabetical-order-of-appearance" order.
# Whitespace and punctuation shall simply be removed!
#
# The input is restricted to contain no numerals and only words containing the english alphabet letters.
#
# Example:
#
# alphabetized("The Holy Bible") # "BbeehHilloTy"
# =end
# p alphabetized("") == ""
# p alphabetized(" ") == ""
# p alphabetized(" a") == "a"
# p alphabetized("a ") == "a"
# p alphabetized(" a ") == "a"
# p alphabetized("A b B a") == "AabB"
# p alphabetized(" a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z") == "aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ"

# P: Given a str, return a new str with all characters concatenated regardless of their case but in order in which they appear
# -spaces and punctuation should be removed
# -chars are added into the new str in order of appearance in the str argument
# -downcase the str and sort it and
#
# DS:
# input: str
# output: str with all the letters how they appear alphabetically
#
# A:
# find every char from the lowercase/upper case alphabet
# find a or A
# if found, count first - how?
# create a hash with alphabet keys - lowercase chars and empty arrays as values
# iterate through the string and if a char is corresponding to the key or key.downcase?, add it to the value array for that key
# retrieve all the values, they will be multiple arrays
# join and return a str
# Code

puts "my try"
def alphabetized(str)
  keys = ('a'..'z').to_a

  hsh = keys.each_with_object({}) { |letter, hsh| hsh[letter] = [] } # an array to accumulate each letter of the alphabet as keys and empty [] as values

  arr = str.chars
  arr.each do |char|
    if hsh.keys.include?(char.downcase) # if the lowercase version of the current character is in the alphabet, add this character(whichever case it is in)
      hsh[char.downcase] << char
    end
  end

  hsh.values.join
end
p alphabetized("") == ""
p alphabetized(" ") == ""
p alphabetized(" a") == "a"
p alphabetized("a ")== "a"
p alphabetized(" a ") == "a"
p alphabetized("A b B a")== "AabB"
p alphabetized(" a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z") == "aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ"
p alphabetized("!@$%^&*()_+=-`,") == ""
p alphabetized("CodeWars can't Load Today") == "aaaaCcdddeLnooorstTWy"

puts
# -initialize a hash with a default value as an empty array
# This means that if you try to access a key in the hash that doesn't exist(the key doesn't exist!), instead of returning nil,
# the hash will return an empty array as the default value.
# convert str to array
# iterate over the string and populate the hash's keys and values:
# go over each char in the array, upcase it and add it as a key
# def alphabetized(s)
#   result = Hash.new { [] }
#   s.chars.each { |c| result[c] += [c] if /[a-z]/i =~ c } #very nice! -keys will be upcased chars, values will be arrays that contain all consecutive chars
#   result.sort.map { |_, v| v.join }
#   result.sort.map { |k, v| v.join } .join
# end
# # "CodeWars can't Load Today"
# result hash after 2nd line, we are adding all characters into the arrays corresponding to the letters but also organizing alphabetically
# {"C"=>["C", "c"], "O"=>["o", "o", "o"], "D"=>["d", "d", "d"], "E"=>["e"], "W"=>["W"], "A"=>["a", "a", "a", "a"], "R"=>["r"], "S"=>["s"], "N"=>["n"], "T"=>["t", "T"], "L"=>["L"], "Y"=>["y"]}
#result sorted:
# [["A", ["a", "a", "a", "a"]], ["C", ["C", "c"]], ["D", ["d", "d", "d"]], ["E", ["e"]], ["L", ["L"]], ["N", ["n"]], ["O", ["o", "o", "o"]], ["R", ["r"]], ["S", ["s"]], ["T", ["t", "T"]], ["W", ["W"]], ["Y", ["y"]]]
# result mapped to the joined value, so keys are discarded, and all the values (which are arrays) are joined
# ["aaaa", "Cc", "ddd", "e", "L", "n", "ooo", "r", "s", "tT", "W", "y"]
# and finally we are joining this array:
# "aaaaCcdddeLnooorstTWy"

# p alphabetized("") == ""
# p alphabetized(" ") == ""
# p alphabetized(" a") == "a"
# p alphabetized("a ")== "a"
# p alphabetized(" a ") == "a"
# p alphabetized("A b B a")== "AabB"
# p alphabetized(" a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z") == "aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ"
# p alphabetized("!@$%^&*()_+=-`,") == ""
# p alphabetized("CodeWars can't Load Today") == "aaaaCcdddeLnooorstTWy"

puts
# def alphabetized(string)
#   temp = string.chars.keep_if{|ele| ('a'..'z').to_a.include?(ele) or ('A'..'Z').to_a.include?(ele)}
#   # p temp #["C", "o", "d", "e", "W", "a", "r", "s", "c", "a", "n", "t", "L", "o", "a", "d", "T", "o", "d", "a", "y"]
#   result = "" # initialize a string result
#   for ele1 in ('a'..'z').to_a do #iterating over the alphabet!!!
#     for ele2 in temp do #iterating over the temp, with the inner and outer loop I have access to both!
#       result += ele2 if ele2.downcase == ele1 # add element(upper or lowercase) if it's downcased version exists in the alphabet
#     end
#   end
#   result
# end
# p alphabetized("") == ""
# p alphabetized(" ") == ""
# p alphabetized(" a") == "a"
# p alphabetized("a ")== "a"
# p alphabetized(" a ") == "a"
# p alphabetized("A b B a")== "AabB"
# p alphabetized(" a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z") == "aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ"
# p alphabetized("!@$%^&*()_+=-`,") == ""
# p alphabetized("CodeWars can't Load Today") == "aaaaCcdddeLnooorstTWy"
#
puts
=begin
45. Alphabetized
(https://www.codewars.com/kata/5970df092ef474680a0000c9/train/ruby)
6 kyu

The alphabetized kata
Re-order the characters of a string, so that they are concatenated into a new string in "case-insensitively-alphabetical-order-of-appearance" order. Whitespace and punctuation shall simply be removed!
** remove space and punctuation > order the chars in a case insensitive way

The input is restricted to contain no numerals and only words containing the english alphabet letters.

Example:

alphabetized("The Holy Bible") # "BbeehHilloTy"
=begin pedac

*************Problem********************
Overall goal: to write a method that takes a string of words and returns a new string containing one word which is ordered alphabetically ascending
initial input: string of words or word
overall output: new string/1 word sorted alphabetically

explicit requirements:
remove all spaces and punctuation
sort the chars ascending by char downcase



implicit requirements:
 empty string retns empty string
 string wtih 1 space returns empty string
questions:

**********Examples/Test cases************
p alphabetized("") == ""
** empty string retns empty string
p alphabetized(" ") == ""
** string wtih 1 space returns empty string > because the space was deleted
p alphabetized(" a") == "a"
** space + a > space is deleted > a is returned
p alphabetized("a ") == "a"
p alphabetized(" a ") == "a"
p alphabetized("A b B a") == "AabB"
** delete spaces > AabB
p alphabetized(" a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z") == "aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ"

*************Data Structure**************


***************Algorithm*****************
Overall approach: string  > delete all non alpha chars into word > convert string to array using chars > iterate over array using sort > sort ascending > convert back to a string w/o a space > return this string

delete all non alpha chars in the string


convert cleaned string to array


iterate over the array and sort ascending


 convert sorted array back to string


*/
details:

*/
details:

=end

def alphabetized(string)
  string.gsub(/[^a-zA-Z]/, '').chars.sort { |a, b| a.downcase <=> b.downcase}.join # last test case returns false
end
p alphabetized("")  == ""
p alphabetized(" ") == ""
p alphabetized(" a") == "a"
p alphabetized("a ") == "a"
p alphabetized(" a ") == "a"
p alphabetized("A b B a") == "AabB"
p alphabetized(" a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z") == "aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ"

puts "session with Uy"
=begin
[Train: Alphabetized \| Codewars](https://www.codewars.com/kata/5970df092ef474680a0000c9/train/ruby)
6 kyu
The alphabetized kata
Re-order the characters of a string, so that they are concatenated into a new string in "case-insensitively-alphabetical-order-of-appearance" order. Whitespace and punctuation shall simply be removed!

The input is restricted to contain no numerals and only words containing the english alphabet letters.

Example:

alphabetized("The Holy Bible") # "BbeehHilloTy"
=end

=begin


- PROBLEM
  - Input: string that contains characters
  - Output: new string with requirements below

  - Rules:
    -re-order the characters of a String
    - return a new string
      - not case sensitive
      - do not need to worry about the order of lowercase and uppercase letter
      - alphabetical order
      - remove the Whitespace and punctuation
    - dont need to verify the inputs

- EXAMPLE
  -alphabetized("The Holy Bible") # "BbeehHilloTy"

- DATA STRUCTURE
  - should be an array so we can iterate through all of the characters.

- ALGORITHM
  - convert string to array to have access to

- start building `return_string

 - iterate over the input array  ["T", "h", "e", " ", "H", "o", "l", "y", " ", "B", "i", "b", "l", "e"], remove spaces
- how to compare these characters with the alphabet? Do I need to compare them with the alphabet?
- iterate over the alphabet of both uppercase and lower case and see if A/a is included in the string
- get index of a and A
- see which index is smaller in the input string and get that one
- then remove that letter in the input string and add it to the `return string`
- repeat this process until there is no more uppercase/lowercase letters in the array - helper methoc

-move to the next letter in the array

- once done with all the letters, return the string

=end
alphabetized("The Holy Bible") # "BbeehHilloTy"
# p alphabetized("") == ""
# p alphabetized(" ") == ""
# p alphabetized(" a") == "a"
# p alphabetized("a ") == "a"
# p alphabetized(" a ") == "a"
# p alphabetized("A b B a") == "AabB"
# p alphabetized(" a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z") == "aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ"

puts
# solutions that I liked from Codewars
def alphabetized(s)
  alphabet = ("a".."z").to_a
  string = ""

  alphabet.each do |alpha|
    s.each_char do |char|
      if alpha == char.downcase
        string += char
      end
    end
  end
  return string
end
alphabetized("The Holy Bible") # "BbeehHilloTy"
p alphabetized("") == ""
p alphabetized(" ") == ""
p alphabetized(" a") == "a"
p alphabetized("a ") == "a"
p alphabetized(" a ") == "a"
p alphabetized("A b B a") == "AabB"

puts
=begin
--- A 
- return empty string if given_string.empty?
- return empty string if string is just whitespace
  - given_string.chars.all? { |char| char == ' ' }

- remove all whitespaces from string & create an array of just chars
  - array - array [ ' ' ]
- 
- SORT all characters by alphabetical order
  - #sort by alphabetical order 
  - #downcase help prioritize character appearance
- CONVERT my array back into a string
  - join
=end

puts

def alphabetized(string)
  return '' if string.empty?
  return '' if string.chars.all? { |char| char == ' ' }
  string =  string.split('') - [' ']
  string.sort_by { |char| char.downcase }.join
end

p alphabetized("The Holy Bible") == "BbeehHilloTy"
p alphabetized("") == ""
p alphabetized(" ") == ""
p alphabetized(" a") == "a"
p alphabetized("a ") == "a"
p alphabetized(" a ") == "a"
p alphabetized("A b B a") == "AabB"

p alphabetized(" a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z") == "aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ"

