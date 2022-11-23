=begin
https://launchschool.com/exercises/28ff0d86

Clean up the words
Given a string that consists of some words (all lowercased) and an assortment
of non-alphabetic characters, write a method that returns that string with all
of the non-alphabetic characters replaced by spaces. If one or
more non-alphabetic characters occur in a row, you should only have one space
in the result (the result should never have consecutive spaces).

# AJ
-----------------------
Problem:
- Write a method that returns string with non-alphabetic characters replaced by
spaces
- Only one space if mulitple non-alphabetic characters occur in a row
  - Should never be consecutive spaces

Input: String
Middle: Referencing a constant array
Output: Mutated string
Rules:
  Explicit Requirements
  - Method should return string with non-alphabetic characters replaced by spaces
  - No more than one consecutive space should occur in the result
  - Return mutated string, not new string
  - Spaces should also be reduced into a single space

  Implicit Requirements

-----------------------
Examples:
cleanup("---what's my +*& line?") == ' what s my line '

-----------------------
Data Structure / Algorithm:
**PSEUDO - Informal**
- Create a constant `ALPHABET` initialized to a string consisting of the full
  lowercased alphabet
- Create a counter for index iteration
- Create method `cleanup` with one param of `string`
# - Create a variable `cleanup` initialized to empty String
# - Create a varaible `index_pos_for_space` intitialized to nil
- Loop through the string
  - If index couter position is an a alphabetic character
    - Go to next iteration of Loop
  - Else
    - Replace character with a space

-----------------------
Code:
=end

puts "AJ"
require 'pry'
ALPHABET = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)

def cleanup(string)
  counter = 0
  loop do
    break if counter >= string.size
    if ALPHABET.include?(string[counter])
      counter += 1
      next
    else
      string.gsub!(string[counter], ' ')
    end
    counter += 1
  end
  string
end

p cleanup("---what's my +*& line?") #== ' what s my line '

puts
puts "Ewa"
# Ewa
# -initialize an `alphabet` variable containing all the lowercased letters of the alphabet
# -if string has non-alphabetic characters, transform them into the spaces
# -iterate though spaces and reduce them to one /delete extra spaces and always leave 1 space in place of multiple spaces
# -return the same but mutated string

# ALPHABET = ('a'..'z').to_a
#
def cleanup(str)
  counter = 0
  loop do
    if ALPHABET.include?(str[counter])
      counter += 1
      next
    else
      str.gsub!(str[counter], ' ')
      counter += 1
    end
    break if counter >= str.size
  end
  counter2 = 0 # this is 2 in one, I could actually split this method into 2
  loop do
    break if counter2 >= str.size
    if str[counter2] == ' ' && str[counter2.next] == ' '
      str[counter2] = ''
      # counter2 += 1 # do not increase the counter unless you want to skip characters!
    else
      counter2 += 1
    end
  end
    str
end

p cleanup("---what's my +*& line?") #== ' what s my line '

def reduce_spaces_to_one(str)
  counter = 0
  loop do
    if str[counter] == ' ' && str[counter.next] == ' '
      str[counter] = ''
      # counter += 1 # do not increase counter, otherwise if we have 2 or more spaces and reduce the counter, we loose 1 place
    else
      counter += 1
    end
    break if counter == str.size - 2
  end
  str
end

s = "  what s my   line " #why doesn't it reduce the 3 spaces between `my` and `line` to just 1 space?
p s.size
p reduce_spaces_to_one(s)
p s.size

# counter 10, 11 and 12 are spaces
#         ' ' ' '    ' '
# so counter 10 becomes ''(disappears or effectively becomes conunter 11) and we increase the counter to actually 12!

# examples
str = "  what s my   line "
p str[11]
p str[12]
p str[13]
p str[14]
puts
p str[11] = ''
puts
p str[11]
p str[12]
p str[13]
p str[14]
puts "removing the character reduces the COUNT of words so also the COUNTER is reduced"
puts "that's why we shouldn't increase the counter, if we increase it, we SKIP/lose one character(the space!)...:"
p str[12]
p str[13]
p str[14]
puts "so now the current character and the next are not both spaces and therefore the current character won't be removed:"

puts
puts
puts "Final solution:"

def cleanup(str)
  counter = 0
  loop do
    if ALPHABET.include?(str[counter])
      counter += 1
      next
    else
      str.gsub!(str[counter], ' ')
      counter += 1
    end
    break if counter >= str.size
  end
  reduce_spaces_to_one(str)
    str
end

p cleanup("---what's my +*& line?") #== ' what s my line '
