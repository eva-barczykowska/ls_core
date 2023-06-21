=begin
35. Mexican Wave
(https://www.codewars.com/kata/58f5c63f1e26ecda7e000029/train/ruby)
6 kyu

In this Kata your task is to create a function that turns a string into a Mexican Wave.
You will be passed a string and you must return that string in an array where an uppercase letter is a person standing up.

 Rules:
1. The input string will always be lower case but maybe empty.
2. If the character in the string is whitespace then pass over it as if it was an empty seat.
  PEDAC TEMPLATE

************** Problem **************
-write a method that takes a string
-this method returns 'mexican wave':
                       -is a string argument is a word of 5 letters, I'll get 5 words BUT
-the first word starts with the capital letter and the rest chars are lowercase
-the second's word 2nd letter is capital
-the 3rd word's 3rd letter is capital
-the 4th word's 4th letter is capital
-the 5th word's 5th letter is capital

-if the str is empty, method returns will return an empty array
-if the character in the string is whitespace then pass over it as if it was an empty seat.

SPEND MORE TIME HERE, what if the string contains a space?
-the space is not counted as a character (so it is as if there was an empty seat)

Questions:

************** Examples **************
p wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
p wave("codewars") == ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs", "codewarS"]
p wave("") == []
p wave("two words") == ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]
-this string has 8 characters if we exclude the space so we will print this string 8 times
-> T-1, W-2, O-3 space-4 W-5
p wave(" gap ") == [" Gap ", " gAp ", " gaP "]
-space is ignored, we don't take it into consideration when upcasing a letter

************** Data Structures **************
input: string, could be empty, could have spaces
middle: an array
output: a long string of strings, where in every word the next letter is capitalize, so in 1st word, first letter, etc.

************** Algorithm **************
-get rid of space from the string first and see what is the size of this string now
-use that number to print the string that many times (the original string, so with the space)

-now we need to divide this string into an array and
-loop - upcase in every word the character at the consecutive counter that is equal to the index
["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]
  0-------------1-------------2--------------3-------------5(space)------6-------------7-------------8

-["two words", "two words", "two words", "two words", "two words", "two words", "two words", "two words"]
-iterate through this array and upcase the letter in each string that is at its consecutive counter
-but if the counter is a space, go to next iteration without upcasing the current element (the space that is!)

-so go over the array of strings
-in every string look at all the chars and their indexes
-if the char at the current counter is not equal to a space, capitalize this character and increase the counter
-else if the char at the current counter is equal to space, don't increase the counter
-otherwise go to next counter

-go to next word and next counter
-delete the space???

-check for the index value in the 1st word, it is a space " gap " => [" Gap ", " gAp ", " gaP "]
-if it is not equal to space, capitalize it and move to the next word
-else move on to the next character
-if it is, move to the next

************** Code **************
=end
def wave(str)
  res = []
  return [] if str.empty?

  target_str_size = str.chars.select { |char| char != ' ' }.size
  res << str until res.size == target_str_size
  ['two words', 'two words', 'two words', 'two words', 'two words', 'two words', 'two words', 'two words']
  final = []
  phrase = 0
  char = 0
  loop do
    if res[phrase][char] != ' '
      # p "Phrase counter is #{phrase} and char is #{char}"
      # p "Phrase is -#{phrase}- and character is -#{res[phrase][char]}-"
      # s[0] = s[0].upcase!
      # how to change a word capitalizing the right letter???
      capitalized = res[phrase].sub(res[phrase][char], res[phrase][char].capitalize!) # problem that the are are 2 "W" in "two words" # -------> THIS IS THE PROBLEM
      # capitalized = res[phrase].chars.map! { |char| char.upcase! if res.index(char) == res.index(phrase)}
      final << capitalized

      phrase += 1
      char += 1
    elsif res[phrase][char] == ' '
      char += 1
    end
    break if phrase >= res.size
  end
  # puts " 0-------------1-------------2--------------3-------------5(space)------6-------------7-------------8"

  final
end

p wave('hello') == ['Hello', 'hEllo', 'heLlo', 'helLo', 'hellO']
p wave('codewars') == ['Codewars', 'cOdewars', 'coDewars', 'codEwars', 'codeWars', 'codewArs', 'codewaRs', 'codewarS']
p wave('') == []
p wave('two words') == ['Two words', 'tWo words', 'twO words', 'two Words', 'two wOrds', 'two woRds', 'two worDs', 'two wordS']
p wave(' gap ') == [' Gap ', ' gAp ', ' gaP ']

puts

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
# =end
#

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
  [] if str.empty?
  results = []
  original_string = str
  sub = str.split('')
  (0 ... sub.size).each do |i|
    next if sub[i] == ' '

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
puts "Adil's solution my code according to his algorithm"
=begin
restate the problem:
  given a string return an array of words with each element having the string with consecutive letters capitalized

Explicit rules
  always lower case or empty
  ignore whitespace

implicit rules

  if an empty string is passed in then return an empty array
  keep the whitespace in the string
io
  string -> array of strings

mental model
  " gap " => [" Gap ", " gAp ", " gaP "] initialize empty array =>
  [" ", "g", "a", "p", " "] => [" ", "G", "a", "p", " "] => join => " Gap " => append to a results arr=>
  results_arr => [" Gap "] after first iteration

ds:
  input: string
  working: array
  output: array

algo:
  return an empty array if the input string is empty
  initialize a results array
  split the string into characters with whitespaces preserved and save it to a variable
  iterate through a range of numbers 0 ... subarray size
    if its a whitespace then go to next iteration
    capitalize the character at that Index
    join the subarray
    append to results
  return results array
=end
def wave(arr_of_strings)
  return [] if arr_of_strings.empty?

  results = []
  chars_array = arr_of_strings.split('')
  (0...chars_array.size).each do |index|
    next if chars_array[index] = ' '

    (index...chars_array.size).each do |index2|
      chars_array[index2].upcase
      results << chars_array.join
    end
  end
  results
end
# p wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
# p wave("codewars") == ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs", "codewarS"]
# p wave("") == []
# p wave("two words") == ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]
p wave(' gap ') #== [" Gap ", " gAp ", " gaP "]

puts "Adil's solution - incorrect"
def wave(str)
  return [] if str.empty?

  results = []

  sub = str.split('')
  (0...sub.size).each do |i|
    next if sub[i] == ' '

    (i ... sub.size).each do |ii|
      sub[ii].upcase
      results << sub.join
    end

  end
  results
end

p wave('hello') #== ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
# p wave("codewars") == ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs", "codewarS"]
# p wave("") == []
# p wave("two words") == ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]
# p wave(" gap ") #== [" Gap ", " gAp ", " gaP "]


puts
puts 'My try, from scratch'
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

p wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
p wave("codewars") == ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs", "codewarS"]
p wave("") == []
p wave("two words") == ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]
p wave(' gap ') == [" Gap ", " gAp ", " gaP "]
