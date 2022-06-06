# Write a method that takes a string as an argument and returns a new string in which every uppercase letter is replaced by its lowercase version, and every lowercase letter by its uppercase version. All other characters should be unchanged.

# You may not use String#swapcase; write your own version of this method.

# PEDAC
# Problem
# -a method that takes a string
# -this method returns a string as well BUT
# -the case of characters is swapped
# -cannot use String#swapcase
# Examples
# swapcase('CamelCase') == 'cAMELcASE'
# swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
# Data Structures
# input: String
# output: String

# Algorithm
# -initialize a counter variable
# -initialize result = ""
# -loop over the string until I reach the last character
# -if it is just 1 word, split it on character and loop over
# -if the string is more than 1 word, split it on the space and loop over
# -check if a character is upper case and if it is, change it to lowercase
# -check if a character is lower case and if it is, change it to uppercase
# -when there are no more characters to loop over, return the result string
# Code


# ====Solve this once again with loop, all the loop kinds==get comfortable with them
def swapcase(str)
  counter = 0
  result = []
  if !str.include?(" ")
    array = str.split("")
    p '==='
    array.each do |char|
      if char == char.upcase
        result << char.downcase
      else
        result << char.upcase
      end
    end
    p result
      result.join

  else
    return "HELLO"
   array = str.split(" ")
   print array


  end

end


# def swapcase(str)
#   result = str.split("").map do |char|
#     (str[char] == str[char].upcase) ? str[char].downcase : str[char].upcase
#   end
#   result.join
# end
# p swapcase('CamelCase') == 'cAMELcASE'
# p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'



# -------------------------------
#  Knowing what methods are available on data types - both their names and what they return.
#   - Flashcards or any memorization tactic can help you with remembering what method names are available to what data types.
#   - Knowing not only names, but:
#     - What arguments they can take.
#     - What they will return under various circumstances.

#  String
#  method | inputs | outputs |
#  split  | nothing | return the whole string as a single element in an array |
#  split  | empty string | returns an array of the characters in that string |
#  split  | a single space | returns an array of words split on each space in the input string |
#  split | character on which to split | an array of elements separated each time the input character occurs |

#  ------------------------------
#  recognizing what an error message is communicating.
# p 'abc'.uppercase - NoMethodError: undefined method (I have the name wrong)
# map do |char|     - NameError: undefined local variable or method `map`
#  Take some time to look at documentaion with the goal of recognizing the names of errors and what they might mean.
#  Keep some sort of record of - when you get an error; log the error message AND a description of the problem.

# ------------------------------
#  The problem that you ran into was: you assumed that you would need to split the input string differently based on whether it contained more than one word.
#  - Getting comfortable with thinking of sentences as groups of characters and not words.
#     - In the case of this particular problem, spaces and other non-alphabetical characters are unchanged by the use of `upcase` and `downcase`.
#  - Getting comfortable with looping over a string and accessing all characters, one by one, with that loop.

#  Use as many loops as you can think of to print the characters of a given string one line at a time.
