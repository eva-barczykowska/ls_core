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

 puts

#from Syed
 LOWER = ("a".."z").to_a
 p LOWER[23]
 UPPER = ("A".."Z").to_a

 def get_letter(letter)
   current_index = LOWER.index(letter.downcase) # this is just to get index
   current_index = current_index - 26 if current_index > 22 # this is to shift index to the beginning if index > 22 (x, y z)
   letter == letter.downcase ? LOWER[current_index + 3] : UPPER[current_index + 3]
 end

 p get_letter("x") == "a"
 p get_letter("y") == "b"
 p get_letter("z") == "c"

 p get_letter("X") == "A"
 p get_letter("Y") == "B"
 p get_letter("Z") == "C"

 def letter_changes(str)
   result = ""
   str.each_char do |char|
     result << get_letter(char) if LOWER.include?(char.downcase)
     result << char unless LOWER.include?(char.downcase)
   end
   result
 end

 p letter_changes("this long cake@&") == "wklv orqj fdnh@&"
 p letter_changes("Road trip9") == "Urdg wuls9"
 p letter_changes("EMAILZ@gmail.com") == "HPDLOC@jpdlo.frp"
 p letter_changes('xyz') == ('abc')

 puts
# from Saurabh Kamboj
=begin
  Breakdown
    - Every word in the given string has to be iterated over
    - Every letter in the word is to be replaced
    - The letter is replaced by the letter 3 spaces ahead of it
    - Only operate over alphabets and account for case
    - Input: String
    - Output: String

  Data structure
    - 'abc' > 'def'
    - a = 1, d = 4, 1 + 3
    - b = 2, 2 + 3 = 5, e = 5
    - 1, 2, 3 > 4, 5, 6
    - End of the string needs to repeat
    - English alphabets - 26
    - If letter_number + 3 > 26
     - new_letter_number = letter_number + 3 - 26
     - Z = 26, 26 + 3 - 26, 3 = c

  Problem
    - Iterate over each word
    - Iterate over each letter in the word
    - Replace each letter based on algorithm
    - Join the letters and words, return that as result

  Algorithm
    - Iterate over each word of the given string
      - Iterate over each letter of letter of the current word
      - If the letter is an alphabet
        - Replace the letter
      - Else return letter
      - Join the resultant array
    - Join the resultant array with spaces as separator
    - To replace the letter
      - If ALPHABET_NUMBERS[letter] + 3 > 26
        new_letter_number = ALPHABET_NUMBERS[letter] + 3 - 26
      - Else
        new_letter_number = ALPHABET_NUMBERS[letter] + 3
      - ALPHABET_NUMBER.key(new_letter_number)
=end

 ALPHABETS = ('a'..'z').zip(1..26).to_h
 p ALPHABETS
 def letter_changes(string)
   string.split.map do |word|
     word.chars.map do |letter|
       if ALPHABETS.key?(letter.downcase)
         new_letter = change_letter(letter.downcase)
         letter.downcase == letter ? new_letter : new_letter.upcase
       else
         letter
       end
     end.join
   end.join(' ')
 end

 def change_letter(letter)
   letter_value = ALPHABETS[letter]
   if letter_value + 3 > 26
     ALPHABETS.key((letter_value - 26) + 3)
   else
     ALPHABETS.key(letter_value + 3)
   end
 end

 p letter_changes("this long cake@&") == "wklv orqj fdnh@&"
 p letter_changes("Road trip9") == "Urdg wuls9"
 p letter_changes("EMAILZ@gmail.com") == "HPDLOC@jpdlo.frp"
 p letter_changes('xyz') == ('abc')

 puts

# Alternate 1

 def letter_changes(string)
   string.chars.map do |letter|
     if ALPHABETS.key?(letter.downcase)
       new_letter = change_letter(letter.downcase)
       letter.downcase == letter ? new_letter : new_letter.upcase
     else
       letter
     end
   end.join
 end

 puts
# Alternate 2 based on Syed's input

 def letter_changes(string)
   string.chars.map do |letter|
     ALPHABETS.key?(letter.downcase) ? change_letter(letter) : letter
   end.join
 end

 def change_letter(letter)
   value = ALPHABETS[letter.downcase] + 3
   value = value - 26 if value > 23

   letter.downcase == letter ? ALPHABETS.key(value) : ALPHABETS.key(value).upcase
 end

 p letter_changes("this long cake@&") == "wklv orqj fdnh@&"
 p letter_changes("Road trip9") == "Urdg wuls9"
 p letter_changes("EMAILZ@gmail.com") == "HPDLOC@jpdlo.frp"
 p letter_changes('xyz') == ('abc')

 puts
#eljan
 def letter_changes(str)
   arr = Array("a".."z")
   new_str = []
   for i in str.chars #below he's looking for i == i.downcase to evaluate as true and if it does,
     down = i == i.downcase #down = i, this assigns every char in the string to the variable `down` but what is the purpose of the further ==?
     i = i.downcase # this assigns every char in the string to its lowercase version

     if arr.include?(i) # if the char we're looking at is an alphabet letter?
       index = arr.index(i) # get the current index so that we can increase it by 3
       char = arr[index + 3 - 26] #get the target letter
       new_str.push(down ? char : char.upcase) # ternary statement as an argument - we're deciding what to push
     else
       new_str.push(i)
     end

   end
   new_str.join
 end
 p letter_changes("this long cake@&") == "wklv orqj fdnh@&"
 p letter_changes("Road trip9") #== "Urdg wuls9"
 p letter_changes("EMAILZ@gmail.com") == "HPDLOC@jpdlo.frp"
 p letter_changes('xyz') == ('abc')

 puts
#from Travis Linville
 def letter_changes(str)
   new_str = ''
   str.each_char do |letter|
     if ('a'..'w').cover?(letter.downcase) #the range is not full alphabet, clever!
       new_str << (letter.ord + 3).chr #ord gives me a number, I'm increasing it by 3 and once I have that number, I'm asking what LETTER it is
     elsif ('x'..'z').cover?(letter.downcase)
       new_str << (letter.ord - 23).chr # - 23 works for all 3 letters!
     else
       new_str << letter
     end
   end
   new_str
 end

 p letter_changes("this long cake@&") == "wklv orqj fdnh@&"
 p letter_changes("Road trip9") == "Urdg wuls9"
 p letter_changes("EMAILZ@gmail.com") == "HPDLOC@jpdlo.frp"
 p letter_changes('xyz') == ('abc')
