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
  hsh = {}
  keys.each_with_object({}) { |letter| hsh[letter] = [] }

  arr = str.chars
  arr.each do |char|
    if hsh.keys.include?(char.downcase)
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
def alphabetized(s)
  result = Hash.new { [] }
  s.chars.each { |c| result[c] += [c] if /[a-z]/i =~ c } #very nice! -keys will be upcased chars, values will be arrays that contain all consecutive chars
  result.sort.map { |_, v| v.join }
  result.sort.map { |k, v| v.join } .join
end
# "CodeWars can't Load Today"
# result hash after 2nd line, we are adding all characters into the arrays corresponding to the letters but also organizing alphabetically
# {"C"=>["C", "c"], "O"=>["o", "o", "o"], "D"=>["d", "d", "d"], "E"=>["e"], "W"=>["W"], "A"=>["a", "a", "a", "a"], "R"=>["r"], "S"=>["s"], "N"=>["n"], "T"=>["t", "T"], "L"=>["L"], "Y"=>["y"]}
#result sorted:
# [["A", ["a", "a", "a", "a"]], ["C", ["C", "c"]], ["D", ["d", "d", "d"]], ["E", ["e"]], ["L", ["L"]], ["N", ["n"]], ["O", ["o", "o", "o"]], ["R", ["r"]], ["S", ["s"]], ["T", ["t", "T"]], ["W", ["W"]], ["Y", ["y"]]]
# result mapped to the joined value, so keys are discarded, and all the values (which are arrays) are joined
# ["aaaa", "Cc", "ddd", "e", "L", "n", "ooo", "r", "s", "tT", "W", "y"]
# and finally we are joining this array:
# "aaaaCcdddeLnooorstTWy"

p alphabetized("") == ""
p alphabetized(" ") == ""
p alphabetized(" a") == "a"
p alphabetized("a ")== "a"
p alphabetized(" a ") == "a"
p alphabetized("A b B a")== "AabB"
p alphabetized(" a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z") == "aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ"
p alphabetized("!@$%^&*()_+=-`,") == ""
p alphabetized("CodeWars can't Load Today") #== "aaaaCcdddeLnooorstTWy"