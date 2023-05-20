 # INTERVIEW ASSESSMENT
#
# - Zoom & Coderpad
# - One hour. Two problems.
# - Focus: Structured problem-solving approach, Ruby fluency, Communication ability.
# - No documentation but personal notes okay.
# - Don't be afraid to spend lots of time on PEDA before jumping into C.
# - Make sure you understand the problem.
#   - Feel free to ask questions.
#   - ***Check test cases for implicit rules***.
#   - Write down what you find out to refer back to later.
# - Develop your algorithm from a top-down approach.
# - Test code frequently and verbally explain your expectations.
# - Preparation: RB101-RB109 Small Problems, Pair up with other students.
# - Codewars, esp. the problem set that circulates around

# Practice
# Re-order the characters of a string, so that they are concatenated into
# a new string in "case-insensitively-alphabetical-order-of-appearance" order.
# Whitespace and punctuation shall simply be removed!
# The input is restricted to contain no numerals and only words containing
# the english alphabet letters.
#
# PEDAC TEMPLATE
#
# ************** Problem **************
# -write a method that takes a string as an argument
# -the method returns a string as well, but it's reordered
# -it's supposed to be case-insensitive order of appearance like in the alphabet
# non-alphabet characters are removed
# spaces get removed
# ************** Examples **************
# p alphabetized("The Holy Bible") == "BbeehHilloTy"
# # =>capital B comes before b
# p alphabetized("!@$%^&*()_+=-`,") == ""
# # => no alphabetical characters, hence an empty string is returned
# p alphabetized("CodeWars can't Load Today") == "aaaaCcdddeLnooorstTWy"
# # =>removed apostrophe and sorted alphabetically
# ************** Data Structures **************
# Input: string
# Output: string, non-alphabetical characters removed, string sorted alphabetically, capital letters first
# ************** Algorithm **************
# -remove non-alphabetical characters
# -if there aren't any characters left, return an empty string
# -organize character in alphabetical way, capital letters first
# ************** Code **************
#
# ************** Refactor **************
def alphabetized(str)
  alphabet = ("a".."z").to_a + ("A".."Z").to_a
  str.chars.each do |char|
    if !alphabet.include?(char)
      str.delete!(char)
    end
  end
  str.chars.sort { |a, b| a.downcase <=> b.downcase }.join
end

p alphabetized("The Holy Bible") #== "BbeehHilloTy"
# =>capital B comes before b
p alphabetized("!@$%^&*()_+=-`,") #== ""
# # => no alphabetical characters, hence an empty string is returned
p alphabetized("CodeWars can't Load Today") #== "aaaaCcdddeLnooorstTWy"
# =>removed apostrophe and sorted alphabetically
#
 puts
 puts

# Have the method letter_changes(str) take the str parameter being passed and
# modify it using the following algorithm.
#Replace every letter in the string
# with the 3rd letter following it in the alphabet
# (ie. c becomes f, Z becomes C).
# Then return this modified string.
# PEDAC TEMPLATE
#
# ************** Problem **************
#  -write a method that takes a string
#  -the method returns a string that is changed
#  -it is changed in the following way:
#  -every letter is replaced with the the 3rd letter that follows it in the alphabet
# (ie. c becomes f, Z becomes C)
# -special characters stay where they are (that includes spaces)
# ************** Examples **************
# p letter_changes("this long cake@&") == "wklv orqj fdnh@&"
# p letter_changes("Road trip9") == "Urdg wuls9"
# p letter_changes("EMAILZ@gmail.com") == "HPDLOC@jpdlo.frp"
# p letter_changes('xyz') == ('abc')
# ************** Data Structures **************
# Input: string
# Middle: array
# Output: string
# ************** Algorithm **************
# initialize 2 alphabets, lowercase and upper case
# letters in both arrays are 26 in each
# iterate over the characters in the array
# if the letters are xyz or XYZ, then the corresponding will be abc and ABC, otherwise it's 3 letters ahead

# -write to separate methods for getting the right lower letter and the right upper letter
# if the index is out of bounds, i.e. it exceeds 26 we have to start counting from the beginning of the alphabet

# ask if a character at the current index is a member of the uppercase or lowercase alphabet
# when we find out the respective alphabet, check for the index of the current character in that alphabet

# if a character at the current index is not a part of the array, add it to the new string as it is in the original string
# return the newly created string
# ************** Code **************
#
# ************** Refactor **************

 LOWER = ("a".."z").to_a
 UPPER = ("A".."Z").to_a

 def get_lowercase(letter)
   if letter == "x"
     return "a"
   elsif letter == "y"
     return "b"
   elsif letter == "z"
     return "c"
   else
     current_index = LOWER.index(letter)
     return LOWER[current_index + 3]
     end
 end

 p get_lowercase("x")
 p get_lowercase("y")
 p get_lowercase("z")
 p get_lowercase("r")

 def get_uppercase(letter)
   if letter == "X"
     return "A"
   elsif letter == "Y"
     return "B"
   elsif letter == "Z"
     return "C"
   else
     current_index = UPPER.index(letter)
     return UPPER[current_index + 3]
   end
 end

 p get_uppercase("X")
 p get_uppercase("Y")
 p get_uppercase("Z")
 p get_uppercase("R")

 puts
# at this point I have 2 helper methods to get the right uppercase or lowercase letter

 def letter_changes(str)
   result = []
   str.chars.each do |char|
     if LOWER.include?(char)
       result << get_lowercase(char)
     elsif UPPER.include?(char)
       result << get_uppercase(char)
     else
       result << char
     end
   end
   result.join
 end

p letter_changes("this long cake@&") == "wklv orqj fdnh@&"
p letter_changes("Road trip9") == "Urdg wuls9"
p letter_changes("EMAILZ@gmail.com") == "HPDLOC@jpdlo.frp"
p letter_changes('xyz') == ('abc')
