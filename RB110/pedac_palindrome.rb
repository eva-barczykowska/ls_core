=begin
PROBLEM:

Given a string, write a method change_me which returns the same
string but with all the words in it that are palindromes uppercased.

change_me("We will meet at noon") == "We will meet at NOON"
change_me("No palindromes here") == "No palindromes here"
change_me("") == ""
change_me("I LOVE my mom and dad equally") == "I LOVE my MOM and DAD equally"

PEDAC TEMPLATE

************** Problem **************

- I have to write a method `change_me`
- the method takes a string as an argument
- the method returns the same string BUT
- the words that are palindromes are upper-cased
- all inputs are strings

Questions:
Any questions to this?
-the words that already are upcase, stay upcase, right? Yes.

************** Examples **************
Analyse. Is all clear?
change_me("We will meet at noon") == "We will meet at NOON"
change_me("No palindromes here") == "No palindromes here"
change_me("") == ""
change_me("I LOVE my mom and dad equally") == "I LOVE my MOM and DAD equally"

************** Data Structures **************
Input: string
Output: string with palindromes upper-cased
************** Algorithm **************
-overall approach:
- find out which words are palindromes
--how to find out which words are palindromes?

#  - initialize a result variable to an empty array
#  - create an array named substring_arr that contains all of the
#    substrings of the input string that are at least 2 characters long.
#  - loop through the words in the substring_arr array.
#  - if the word is a palindrome, append it to the result
#    array
#  - return the result array

hallo
h
ha
hal
halo
 a
 al
 alo
  l
  lo
   0

# - create an empty array called `result` that will contain all required substrings
# - create a `starting_index` variable (value `0`) for the starting index of a substring
# - start a loop that iterates over `starting_index` from `0` to the length of the string minus 2
#   - create a `num_chars` variable (value `2`) for the length of a substring
#   - start an inner loop that iterates over `num_chars` from `2` to `string.length - starting_index`
#     - extract a substring of length `num_chars` from `string` starting at `starting_index`
#     - append the extracted substring to the `result` array
#     - increment the `num_chars` variable by `1`
#   - end the inner loop
#   - increment the `starting_index` variable by `1`
# - end the outer loop
# - return the `result` array

PSEUDOCODE
# input: a string
# output: an array of substrings
# rules: palindrome words should be case sensitive, meaning "abBA"
#        is not a palindrome

# Algorithm:
# PSEUDOCODE

#  substrings method
#  =================
#    - create an empty array called `result` that will contain all required substrings
#    - create a `starting_index` variable (value `0`) for the starting index of a substring
#    - start a loop that iterates over `starting_index` from `0` to the length of the string minus 2
#      - create a `num_chars` variable (value `2`) for the length of a substring
#      - start an inner loop that iterates over `num_chars` from `2` to `string.length - starting_index`
#        - extract a substring of length `num_chars` from `string` starting at `starting_index`
#        - append the extracted substring to the `result` array
#        - increment the `num_chars` variable by `1`
#      - end the inner loop
#      - increment the `starting_index` variable by `1`
#    - end the outer loop
#    - return the `result` array

#  is_palindrome? method
#  =====================
# - Inside the `is_palindrome?` method, check whether the string
#   value is equal to its reversed value. You can use the
#   String#reverse method.

#  palindrome_substrings method
#  ============================
#  - initialize a result variable to an empty array
#  - create an array named substring_arr that contains all of the
#    substrings of the input string that are at least 2 characters long.
#  - loop through the words in the substring_arr array.
#  - if the word is a palindrome, append it to the result
#    array
#  - return the result array
************** Code **************

************** Refactor **************
=end

def substrings(str)
  result = []
  starting_index = 0

  while (starting_index <= str.length - 2)
    num_chars = 2
    while (num_chars <= str.length - starting_index)
      substring = str.slice(starting_index, num_chars)
      result << substring
      num_chars += 1
    end
    starting_index += 1
  end
  result
end

def is_palindrome?(str)
  str == str.reverse
end

def palindrome_substrings(str)
  result = []
  substrings_arr = substrings(str) # I don't have to worry about this in my last method, generating substrings is taken care of in this method, which calls the substrings method, neat!
  substrings_arr.each do |substring|
    result << substring if is_palindrome?(substring)
  end
  result
end

p palindrome_substrings("supercalifragilisticexpialidocious") # ["ili"]
p palindrome_substrings("abcddcbA")   # ["bcddcb", "cddc", "dd"]
p palindrome_substrings("palindrome") # []
p palindrome_substrings("")           # []

puts

# Algorithm:
#  substrings method
#  =================
#    - create an empty array called `result` that will contain all required substrings
#    - create a `starting_index` variable (value `0`) for the starting index of a substring
#    - start a loop that iterates over `starting_index` from `0` to the length of the string minus 2
#      - create a `num_chars` variable (value `2`) for the length of a substring
#      - start an inner loop that iterates over `num_chars` from `2` to `string.length - starting_index`
#        - extract a substring of length `num_chars` from `string` starting at `starting_index`
#        - append the extracted substring to the `result` array
#        - increment the `num_chars` variable by `1`
#      - end the inner loop
#      - increment the `starting_index` variable by `1`
#    - end the outer loop
#    - return the `result` array

#  is_palindrome? method
#  =====================
# - Inside the `is_palindrome?` method, check whether the string
#   value is equal to its reversed value. You can use the
#   String#reverse method.

#  palindrome_substrings method
#  ============================
#  - initialize a result variable to an empty array
#  - create an array named substring_arr that contains all of the
#    substrings of the input string that are at least 2 characters long.
#  - loop through the words in the substring_arr array.
#  - if the word is a palindrome, append it to the result
#    array
#  - return the result array

# Algorithm
# -I have 3 helper methods
# -a method to get substrings
# -a method to find out if a substring is a palinderome
# -a method to get all palindromes in one place (result array)
# -get palindrome_substrings
# -iterate over palindrome_substrings and if they exist in the give string,
#  upcase them
#  -return the string
def change_me(str)
  substrings = substrings(str)
  palindromes_substrings = palindrome_substrings(str)
  palindromes_substrings.each do |palindrome|
    if str.include?(palindrome)
      str.sub!(palindrome, palindrome.upcase)
    end
  end
  str
end
p change_me("We will meet at noon") == "We will meet at NOON"
# change_me("No palindromes here") == "No palindromes here"
# change_me("") == ""
# change_me("I LOVE my mom and dad equally") == "I LOVE my MOM and DAD equally"

puts

# generating substrings seems unnecessary since it's the words that are palindromes that need to be upcased
# this solution is based on the requirement to have the same string object before and after
def change_me(str)
  words = str.split
  palindromes = words.select{ |word| word == word.reverse }

  palindromes.each do |palindrome|
    if str.include?(palindrome)
      str.sub!(palindrome, palindrome.upcase)
    end
  end
  str
end
sentence = "We will meet at noon"
p sentence.object_id
change_me(sentence) == "We will meet at NOON"
p sentence.object_id

p change_me("No palindromes here") == "No palindromes here"
p change_me("") == ""
p change_me("I LOVE my mom and dad equally") == "I LOVE my MOM and DAD equally"

puts
# this solution allows to have new string as the output of the method
def change_me(str) #this method does not change the argument/original string passed to it
  result = []
  words = str.split


  words.each do |word|
    if is_palindrome?(word)
      result << word.upcase
    else
      result << word
    end
  end

  result.join(" ")
end
sentence = "We will meet at noon"
p sentence.object_id
new_sentence = change_me(sentence) #== "We will meet at NOON"
p sentence.object_id
p new_sentence.object_id

p change_me("No palindromes here") == "No palindromes here"
p change_me("") == ""

puts
# in my solution, I'm iterating over the palindromes, but I CAN also iterate through the words
# it's not the most efficient solution, but it's still possible


def change_me(str)
  palindromes = palindrome_substrings(str)
  str.split.each do |word|
    if palindromes.include?(word)
      str.sub!(word, word.upcase)
    end
  end # end.join(" ") -- if I did this, I get the return value of str.split.each, which is it's caller, so the string I started with, before changes!
  str
end

str = "We will meet at noon"
p str.object_id
p change_me(str) #== "We will meet at NOON"
p str.object_id
p change_me("No palindromes here") == "No palindromes here"
p change_me("") == ""
p change_me("I LOVE my mom and dad equally") #== "I LOVE my MOM and DAD equally"

puts

# refactored he he
def change_me(str)
  palindromes = palindrome_substrings(str) #this takes care of generating substrings and then extracting palindromes
  str.split.each do |word|
    palindromes.include?(word) ? str.sub!(word, word.upcase) : word
    end
  str
end

str = "We will meet at noon"
p str.object_id
p change_me(str) #== "We will meet at NOON"
p str.object_id

p change_me("We will meet at noon") == "We will meet at NOON"
p change_me("No palindromes here") == "No palindromes here"
p change_me("") == ""
p change_me("I LOVE my mom and dad equally") == "I LOVE my MOM and DAD equally"
