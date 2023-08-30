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
















