=begin
35. Mexican Wave
(https://www.codewars.com/kata/58f5c63f1e26ecda7e000029/train/ruby)
6 kyu

In this Kata your task is to create a function that turns a string into a Mexican Wave.
You will be passed a string and you must return that string in an array where an uppercase letter is a person standing up.

 Rules:
1. The input string will always be lower case but maybe empty.
2. If the character in the string is whitespace then pass over it as if it was an empty seat.

#Kim's PEDAC

# =begin
# 35. Mexican Wave
# (https://www.codewars.com/kata/58f5c63f1e26ecda7e000029/train/ruby)
# 6 kyu
# In this simple Kata your task is to create a function that turns a string into a Mexican Wave.
# You will be passed a string and you must return that string in an array where an uppercase letter is a person standing up.
# Rules
# 1.  The input string will always be lower case but maybe empty.
# 2.  If the character in the string is whitespace then pass over it as if it was an empty seat.
# =begin pedac
# *************Problem********************
# Overall goal: to take a string and return copies of the string in an array. each copy will have a diff ltr capitalized
# initial input: string
# overall output: array of strings
# explicit requirements:
# input string: all lowercase char, can be empty. if space, skip it, do not count it
# implicit requirements:
# array will contain the number of strings == to string size
#     if string has 5 chars, there will be 5 strings
# first string has first ltr capitalized
# 2nd string has 2nd ltr capitalized
# 3rd string has 3rd ltr capitalized
# 4th string has 4th ltr cap
# 5th string has 5th ltr cap
# array[0] has string[0] capitalized
# empty string returns empty array
# need to completely skip spaces - a word should not be added to the return array if curr
#   iteration is a space
# questions:
# ********** Examples/Test cases ************
# p wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
# ** H the E the L the L then O is cap
# p wave("codewars") == ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs", "codewarS"]
# ** C the O then D etc is capitalized
# p wave("") == []
# ** empty string returns empty array
# p wave("two words") == ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]
# ** the space is ignored
# p wave(" gap ") == [" Gap ", " gAp ", " gaP "]
# ** There is 1 space before and after gap. The space is ignored, no string is returned for that iteration.
# then G then A then P is upcased, then ending space is ignored So only 3 strings are returned, one for
# each letter. no string returned if ther eis a space in orig string,
# *************Data Structure**************
# string > array of strings
# ***************Algorithm*****************
# Overall approach: initialize return array > 0 up to string size  as index> iterate over int > take string and capitalize
# the indexed char > add to return array > return return array
# */ initialize result array to empty

# details:
# */ iterate 0 to string size, with block
# details: upto

# */ inside block: need to skip the iteration if the current iterated char is empty string
# details: next if word[int] == ' '

# */ inside block: take string and upcase the element of current iteration number
# details: assign string[0] to string[0].upcase

# */ add word to result array
# details:
# */ then downcase word to reset it/start with all downcase letters

# details:
# */ return value is result array (array of strings/Mexican wave)
# details:
=end


def wave(str)
  result = []
  0.upto(str.size - 1) do |int|
    next if str[int] == ' '

      str[int] = str[int].upcase
      result << str
      str = str.downcase
  end
  result
end


p wave('hello') == ['Hello', 'hEllo', 'heLlo', 'helLo', 'hellO']
p wave('codewars') == ['Codewars', 'cOdewars', 'coDewars', 'codEwars', 'codeWars', 'codewArs', 'codewaRs', 'codewarS']
p wave('') == []
p wave('two words') == ['Two words', 'tWo words', 'twO words', 'two Words', 'two wOrds', 'two woRds', 'two worDs', 'two wordS']
p wave(' gap ') == [' Gap ', ' gAp ', ' gaP ']

puts

def wave(str)
  return [] if str.empty?

  results = []
  original_string = str
  sub = str.split('') # splitting on a character
  (0...sub.size).each do |i|
    next if sub[i] == ' ' # skipping if it's a space

    sub[i].upcase!
    results << sub.join
    sub = original_string.split('')
  end
  results
end

p wave('hello') == ['Hello', 'hEllo', 'heLlo', 'helLo', 'hellO']
p wave('codewars') == ['Codewars', 'cOdewars', 'coDewars', 'codEwars', 'codeWars', 'codewArs', 'codewaRs', 'codewarS']
p wave('') == []
p wave('two words') == ['Two words', 'tWo words', 'twO words', 'two Words', 'two wOrds', 'two woRds', 'two worDs', 'two wordS']
p wave(' gap ') == [' Gap ', ' gAp ', ' gaP ']

puts
puts 'solving again from scratch:'
# In this Kata your task is to create a function that turns a string into a Mexican Wave.
#  You will be passed a string and you must return that string in an array where an uppercase letter is a person standing up.
#
#  Rules:
# 1. The input string will always be lower case but maybe empty.
# 2. If the character in the string is whitespace then pass over it as if it was an empty seat.
# PEDAC TEMPLATE
#
# ************** Problem **************
# write a method
# -the method takes a string as an argument (1 lowercase string, could be consisting of multiple words like test case 4)
# -the method returns an array of strings such as that the array string is repeated but when it's repeated, the next
# consecutive letter is upcased, as if this was Mexican wave at a football stadium and the person was standing up
# -however, when upcasing, spaces within the string have to be ignored, like in the last example
# ************** Examples **************
# p wave("hello") #== ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
# => coz every consecutive letter has been upcased in every consecutive word
# => specifically, in word at index 0, it is letter at index 0, in word at index 1 it is letter at index 1, etc.

# p wave("codewars") == ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs", "codewarS"]
# => same as above but it is basically a longer word

# p wave("") == []
# => here we are accounting for an empty string

# p wave("two words") == ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]
# => here we actually have 2 words and we need to ignore the space so that we can upcase correctly
# => if there is an empty seat, it is ignored while doing a mexican wave at a football stadium

# p wave(" gap ") #== [" Gap ", " gAp ", " gaP "]
# => one word but there is a space before and after so we need to ignore it
#
# ************** Data Structures **************
# Input: a string, always lowercase
#   Middle: how I’m going to get from where I am to where I want to be
# Output: an array of strings, in which every consecutive letter is upcased, spaces are ignored while upcasing
# ************** Algorithm **************
# -account for an empty string and later see if maybe the code accounts for it by default (refactor)
# -create an empty `results` array
# -start iteration (using rage for example) and get access to the index
# -skip a given index in the string if the character at that index is a space
# -upcase character at that index (which you got from iteration using rage (0...str.size))
# -add string with the upcased index to the `results` array
# -now downcase the string so that we have a string like an original string argument to work with
# ************** Code **************
#
# ************** Refactor **************

def wave(str)
  results = []

  (0...str.size).each do |int| # this is an important way how to grab indexes in a string or array, int is my index which now I have access to
    next if str[int] == ' ' # ignore spaces while iterating and upcasing

    str[int] = str[int].upcase # this is how with every iteration I will upcase the consecutive letter in the same word because I have access to index
    results << str
    str = str.downcase # very important to have a downcase string to work with again
  end
  results
end
puts "test"

p wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
p wave("codewars") == ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs", "codewarS"]
p wave("") == []
p wave("two words") == ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]
p wave(' gap ') == [" Gap ", " gAp ", " gaP "]


# session w/Sedrick
=begin
6 kyu
In this simple Kata your task is to create a function that turns a string into a Mexican Wave. You will be passed a string
and you must return that string in an array where an uppercase letter is a person standing up.
Rules
1. The input string will always be lower case but maybe empty.
2. If the character in the string is whitespace then pass over it as if it was an empty seat.
=end
# PEDAC
# ************** Problem **************
# -create a method that takes a string returns a Mexican wave
# -this means, 1 letter is capital and the next one is lowercase
# -the input is lower case str
# -the str coould be empty
# -ignore white spaces
# ************** Examples **************
# p wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
# =>                   H         E.        L.         L.        O
# p wave("codewars") == ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs",
# "codewarS"]
# p wave("") == []
# => empty str returns an empty array
# p wave("two words") == ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]
# "two words"
# "Two words"
# "tWo words"
# "twO words"
# "two Words" => skipping space
# "two wOrds"
# "two woRds"
# "two worDs"
# "two wordS"
# 9 characters = - '' = 8
# p wave(" gap ") == [" Gap ", " gAp ", " gaP "]

# ************** Data Structures **************
# Input: str, could be empty, can contain spaces

# Output: a string in which every second character (excluding e)

# ************** Notes **************
# -as many characters as the string has, we will print that many strings
# -in each string, the consecutive character will be upcased
# -spaces get ignored
# ************** Algorithm **************
# -initialize `result` array
# iterate from 0 to str.size -1 and grab that index
# move to the next index if character at that index is a space
#
# then using String element reference grab the character at a certain index and upcase it
# append the string with the upcased character to the results array
# downcase the string so that we have a clean string to work with next
# return the result array
# ************** Code **************
# ************** Refactor **************
puts
def wave(str)
  res = []
  (0...str.size).each do |index|
    next if str[index] == ' '

    str[index] = str[index].upcase
    res << str
    str = str.downcase
  end

  res
end

p wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
p wave("codewars") == ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs", "codewarS"]
p wave("") == []
p wave("two words") == ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]
p wave(" gap ") == [" Gap ", " gAp ", " gaP "]

puts
def wave(str)
  result = []

  (0...str.size).each do |i| #getting the index of char in a str
    next if str[i].match?(/\s|\d/) # skipping the space

    str[i] = str[i].upcase! #upcasing the char at this index IN THE STRING
    result << str.dup # appending to the result a copy of the string with that upcased character -- why copy and not the string?
    str[i] = str[i].downcase! #downcasing that character IN THE STRING
  end
  result
end

p wave("wave") == ["Wave", "wAve", "waVe", "wavE"]
p wave("  groovy man  ") == ["  Groovy man  ", "  gRoovy man  ", "  grOovy man  ", "  groOvy man  ", "  grooVy man  ", "  groovY man  ", "  groovy Man  ", "  groovy mAn  ", "  groovy maN  "]

puts
puts "what happens if we use the same string, and not a copy?"
puts "it doesn't upcase!!!"
def wave(str)
  result = []

  (0...str.size).each do |i| #getting the index of char in a str
    next if str[i].match?(/\s|\d/) # skipping the space
    # p "char at the current index is #{str[i]}"
    str[i] = str[i].upcase! #upcasing the char at this index IN THE STRING...we have what we need...
    # p "upcased char is #{str[i]}"
    # p "string is #{str}"
    result << str # appending to the result the string with upcased char - so far so good...
    # p "result has now the str with upcased char: #{result}"
    str[i] = str[i].downcase! # but now we've downcased that same char again lol...
    # p "downcased char is #{str[i]}"
  end
  result
end

# p wave("wave")
# p wave("  groovy man  ")
# p wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
# p wave("codewars") == ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs", "codewarS"]
# p wave("") == []
# p wave("two words") == ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]
# p wave(" gap ") == [" Gap ", " gAp ", " gaP "]

#third try
# Problem(restate the problem)
# - I need to write a method that takes a string or an array of strings as an argument
# - the array may be empty
# - the method returns a 'mexican wave' an array where with as many words as the input argument has characters
# - but with every next letter in the next word being capitalized (see examples)
# - spaces in input string are like empty seats, they are ignored
# Examples(analyze examples)
# p wave("wave") == ["Wave", "wAve", "waVe", "wavE"]
# =>each consecutive letter is capitalized in each consecutive word
# p wave("  groovy man  ") == ["Groovy man", "gRoovy man", "grOovy man", "groOvy man", "grooVy man", "groovY man", "groovy Man", "groovy mAn", "groovy maN"]
# =>space at the beginning and end of the input string is ignored
# p wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
# p wave("codewars") == ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs", "codewarS"]
# p wave("") == []
# =>empty string returns an empty array
# p wave("two words") == ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]
# =>space in between the input string is ignored, my target array has as many strings as the size of the input string without spaces
# p wave(" gap ") == [" Gap ", " gAp ", " gaP "]
# # =>space at the beginning and end of the input string is ignored
#
# Data Structures(analyze input, output and maybe the middle to get from input to output)
# input: a string, may be empty, may contain spaces, no special characters
# output: an array of strings, array size is equal to the input string minus space at index the beginning and end
#
# Algorithm (how I am going to solve it step by step)
# - initialize result array
# - remove spaces from index 0 and - 1 if any
# - iterate over the string
# - at each iteration upcase consecutive letter in the string and add this string to the result
#
# Code(implement the algorithm)
# In this simple Kata your task is to create a function that turns a string into a Mexican Wave. You will be passed a string and you must return that string in an array where an uppercase letter is a person standing up.
# 1. The input string will always be lower case but maybe empty.
# 2. If the character in the string is whitespace then pass over it as if it was an empty seat
#
#
puts

=begin
[Train: Mexican Wave \| Codewars](https://www.codewars.com/kata/58f5c63f1e26ecda7e000029/train/ruby)
6 kyu

In this simple Kata your task is to create a function that turns a string into a Mexican Wave.
You will be passed a string and you must return that string in an array where an uppercase letter is a person standing up.
  Rules
1.  The input string will always be lower case but maybe empty.
  2.  If the character in the string is whitespace then pass over it as if it was an empty seat.
  =end

p wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
p wave("codewars") == ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs", "codewarS"]
p wave("") == []
p wave("two words") == ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]
p wave(" gap ") == [" Gap ", " gAp ", " gaP "]

P:
- write a method that turns the string into Mexican wave
- methods gets a str as an arg
- method must return that string in an array where an uppercase letter is a person standing up
- input will be always lowercase but may be empty
- if a char is a whitespave, pass it over as if it was an empty seat

E:
p wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
=>                   X         X         X         X         X

p wave("codewars") == ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs", "codewarS"]
=> same as above, each consecutive letter gets upcased

p wave("") == []
=> empty str returns empty array

p wave("two words") == ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]
                         X             X             X             -X             x             X             X             X
=> this one is ignoring spaces

p wave(" gap ") == [" Gap ", " gAp ", " gaP "]
=> this one is ignoring spaces as well
=end

=begin
=begin

Create a method that turns a string into a Mexican Wave. You will be passed a string and you must return that string
in an array where an uppercase letter is a person standing up.

P:
- method takes a str arg
- str can contain spaces
- method returns an array with the arg str which occurs as many times as the size of the arg string. In every word the consecutive character is upcased,
in 1st word, character at index 0, in the 2nd word, char at index 1, etc....
- spaces are ignored, just like empty seats

E:
p wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
=>                   X         x         X.        X.        x

p wave("codewars") == ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs", "codewarS"]


p wave("") == []
=> return an [] when str arg is empty

p wave("two words") == ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]
=> we upcase charactes ignoring the space

p wave(" gap ") == [" Gap ", " gAp ", " gaP "]
=> we upcase charactes ignoring the space


A:
# p wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
# p wave("codewars") == ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs", "codewarS"]
# p wave("") == []
# p wave("two words") == ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]
# p wave(" gap ") == [" Gap ", " gAp ", " gaP "]

A:
- initialize `return_array_target_size` where I will store target size of the return array, store there size after you've deleted spaces from the string
- return [] if str arg is empty

- initialize `result`which will be populated with strings

- initialize a counter
- start a loop
 -- increase counter if the char at the current counter is a space
 -- upcase the char at the current counter in the arg string
 -- add the str with upcased char to the `result` array
 --downcase the string because you'll need it as it originally was for the next loop iteration
 -- add 1 to counter
 -- break if counter is equal or greater from the `return_array_target_size` because this means that I have required number of strings in my `result` array

-return `result`

=end
def wave(str)
  return_array_target_size = str.delete(" ").size
  return [] if str.empty?

  result = []
  counter = 0

  loop do
    counter += 1 if str[counter] == " "
    str[counter] = str[counter].upcase
    result << str
    str = str.downcase
    counter += 1
    break if result.size >= return_array_target_size
  end
  result
end
p wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
p wave("codewars") == ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs", "codewarS"]
p wave("") == []
p wave("two words") == ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]
p wave(" gap ") == [" Gap ", " gAp ", " gaP "]

puts

def wave(str)
  return_array_target_size = str.delete(" ").size
  return [] if str.empty?

  result = []
  counter = 0

  loop do
    if str[counter] == " "
      counter += 1
      next
    end
    str[counter] = str[counter].upcase
    result << str
    str = str.downcase
    counter += 1
    break if result.size >= return_array_target_size
  end
  result
end
p wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
p wave("codewars") == ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs", "codewarS"]
p wave("") == []
p wave("two words") == ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]
p wave(" gap ") == [" Gap ", " gAp ", " gaP "]

# from Ji Hea
# - initialize `result` to store the return array
# - iterate over each character with index
# - skip character if character is a space
# - initialize `temp_string` where you will store the duplicate of the string
# - upcase the character at the index in that string
# - add that string (with the upcased char) to `result`
# - return `result`
def wave(string)
  result = []
  string.each_char.with_index do |char, index|
    next if char == ' '
    temp_string = string.dup
    temp_string[index] = char.upcase
    result << temp_string
  end
  result
end
p wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
p wave("codewars") == ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs", "codewarS"]
p wave("") == []
p wave("two words") == ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]
p wave(" gap ") == [" Gap ", " gAp ", " gaP "]

puts
# from Graham
def wave(string)
  lowercase_string = string.downcase
  array_of_strings = []
  return array_of_strings if string.length == 0

  # iterate through array of strings
  array_index = 0

  loop do # array element loop
    string_index = 0
    temp_string = ''

    loop do # string loop
      if string_index == array_index
        temp_string << lowercase_string[string_index].upcase
      else
        temp_string << lowercase_string[string_index]
      end

      string_index += 1
      break if string_index == lowercase_string.size
    end

    array_of_strings << temp_string# if lowercase_string[array_index].match?(/[A-Za-z]/)
    array_index += 1
    break if array_index == lowercase_string.size
  end

  # return array
  array_of_strings
end

p wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
  p wave("codewars") == ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs", "codewarS"]
  p wave("") == []
  p wave("two words") #== ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]
  p wave(" gap ") #== [" Gap ", " gAp ", " gaP "]




















