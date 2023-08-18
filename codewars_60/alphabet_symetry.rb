# 
# https://www.codewars.com/kata/59d9ff9f7905dfeed50000b0)
# 7 kyu
#
# Alphabet symmetry
# Consider the word "abode". We can see that the letter a is in position 1 and b is in position 2.
# In the alphabet, a and b are also in positions 1 and 2.
# Notice also that d and e in abode occupy the positions they would occupy in the alphabet,
# which are positions 4 and 5. Given an array of words,
# return an array of the number of letters that occupy their positions in the alphabet for each word.
# For example:
# solve(["abode","ABc","xyzD"]) = [4, 3, 1]
#
# Input will consist of alphabet characters, both uppercase and lowercase. No spaces.
#
# *************Problem********************
# Overall goal: count the number of letters that are in the same position that they are in the alphabet
# initial input: array of string or strings
# overall output: array of integers/integers are the count
#
# explicit requirements:
# only alphabetical chars, both upper and lower cases
# count uppercase as lowercase, A == a same count
#
# 
# implicit requirements:
# output array has same length as input array(3 string => 3 elements)
# questions:
#
# **********Examples/Test cases************
# p solve(["abode","ABc","xyzD"]) == [4,3,1]
# => 4 chars in the correct position => 4, 3 in the correct position => 3, 1 in the correct position => 1
# p solve(["abide","ABc","xyz"]) == [4,3,0]
# if nothing correct position => 0
# p solve(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"])== [6,5,7]
#
# p solve(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]
#
# 
#
# *************Data Structure**************
# array >
#
# ***************Algorithm*****************
# 1. initialize alphabet array [a,b,c..], array[0] == a, array[1]==b
# details: ('a..'z').to_a
# 2.string 'abide' string[0] == a, string [1] == b
# details:
# 3.iterate over array 'abide' using map
# details:downcase string, initialize count = 0
# 4. iterate over string using each char with index a b i d e
# details: if char == alphabet array[index], count += 1
# 5. return count
# details:
# 6.
# details:

def solve(array)
  alphabet = ('a'..'z').to_a
  array.map do |word|
    count = 0
    word.downcase.each_char.with_index do |char, index|
      count += 1 if char == alphabet[index]
    end
    count
  end
end

p solve([ 'abode', 'ABc', 'xyzD' ]) == [4,3,1]
p solve([ 'abide', 'ABc', 'xyz' ]) == [4,3,0]
p solve([ 'IAMDEFANDJKL', 'thedefgh', 'xyzDEFghijabc' ]) == [6,5,7]
p solve([ 'encode', 'abc', 'xyzD', 'ABmD' ]) == [1, 3, 1, 3]

#session with Rebecca
#
# Alphabet symmetry
# Consider the word "abode". We can see that the letter a is in position 1 and b is in position 2. In the alphabet, a and b are also in positions 1 and 2. Notice also that d and e in abode occupy the positions they would occupy in the alphabet, which are positions 4 and 5.
#
# Given an array of words, return an array of the number of letters that occupy their positions in the alphabet for each word. For example,
#
# solve(["abode","ABc","xyzD"]) = [4, 3, 1]
# See test cases for more examples.
#
# Input will consist of alphabet characters, both uppercase and lowercase. No spaces.
#
# P:
# write a method that takes an array of strings and returns an array of integers. Each integer should be a count of letters in the string whose position mirrors their position in the alphabet
#
# input: array of strings
# return: array of integers
#
# rules:
# -input strings can have upper or lower case letters (no spaces)
# -find count of letters that share alphabet position and place count into an Array
#
# E:
# p solve(["abide","ABc","xyz"]) == [4,3,0]
#
# D:
# -array of lowercase letters from a to z
# -iterative structure to find and return count for each string
#
# A:
# -initialize alphabet to range a..z and convert to array
# -iterate over input array (#map) - word
#   -convert word to array of characters (#chars) (#select)
#   -iterate over characters with index positions (#with_index) and save return value to selected_letters
#     -check if index of current character is equal to index of that character in alphabet array
#     -return count of selected letters
#

def solve(array)
  alphabet = ('a'..'z').to_a
  array.map do |word|
    selected_letters = word.downcase.chars.select.with_index do |letter, index|
      index == alphabet.index(letter)
    end
    selected_letters.count
  end

end

p solve(['abode','ABc','xyzD']) == [4,3,1]

p solve(['abide','ABc','xyz']) == [4,3,0]
p solve(['IAMDEFANDJKL','thedefgh','xyzDEFghijabc'])== [6,5,7]
p solve(['encode','abc','xyzD','ABmD']) == [1, 3, 1, 3]


puts
puts 'second try'
# PEDAC TEMPLATE
#
# ************** Problem **************
# -we are given an array of words
# -we need to analyze each word looking at its characters
# -and return the number of characters that hold the same position in a word like they do in an alphabet
# ************** Examples **************
# solve(["abode","ABc","xyzD"] == [4,3,1])
# =>abode has 4: a, b, d, e
# =>ABc has 3: A, B, c
# =>xyzD has 1: D
#
# solve(["abide","ABc","xyz"]) ==[4,3,0]
# =>abide has 4: a, b, d, e
# =>ABc has 3: A, B, c
# =>xyz has 0
#
# solve(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"]) == [6,5,7]
# =>IAMDEFANDJKL has 6: D, E, F, J, K, L
# =>thedefgh has 5: d, e, f, g, h
# =>xyzDEFghijabc has 7: D, E, F, g, h, i, j
#
# solve(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3])
#
# ************** Data Structures **************
# Input: an array of words
#
# Output: an array of numbers signifying how many letters in a given word have the same position in that word
# like they have in the alphabet
# ************** Algorithm *************
# -initialize LOWERCASE and UPPERCASE alphabet constants
# -write a method `get_same_position` for finding out the number of letters which have the same position in the word and in the alphabet
# -- split the word into characters
# --iterate over each character and its index
# --check if the index is same as the index of this letter in the LOWER or UPPER alphabet
# --if it is, add 1 to the result
# --return the result once iterated through all the letters int the word argument
#
# - now write the main method
# -initialize `result` variable
# - iterate over the input array/words
# -call the helper method on every word in the array
# -append the return value of calling the helper method on each word to the final `result` array
# -return that array once iterated through all the words in the array
# ************** Code **************
#
# ************** Refactor **************
LOWER = *('a'..'z')
UPPER = *('A'..'Z')

def get_same_position(word)
  result = 0
  characters = word.split('')
  characters.each_with_index do |char, index|
    result += 1 if index == LOWER.index(char) || index == UPPER.index(char)
  end
  result
end

# p get_same_position('IAMDEFANDJKL') == 6

def solve(arr)
  result = []
  arr.each do |word|
    result << get_same_position(word)
  end
  result
end

p solve(["abode","ABc","xyzD"]) == [4,3,1]
p solve(["abide","ABc","xyz"]) == [4,3,0]
p solve(['IAMDEFANDJKL','thedefgh','xyzDEFghijabc']) == [6,5,7]
p solve(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]

puts
# -convert every downcased character to an array of 2 characters: the one that exists and the one that would be at this index in the alphabet
# -that means zip the characters with their corresponding letters in the alphabet
# then count how many of them are same in each array
# [[["a", "a"], ["b", "b"], ["o", "c"], ["d", "d"], ["e", "e"]], [["a", "a"], ["b", "b"], ["c", "c"]], [["x", "a"], ["y", "b"], ["z", "c"], ["d", "d"]]]
# -this will give convert the above arrays into just numbers
#
# # [[["a", "a"], ["b", "b"], ["o", "c"], ["d", "d"], ["e", "e"]],
# 2nd word [["a", "a"], ["b", "b"], ["c", "c"]],
# 3rd word[["x", "a"], ["y", "b"], ["z", "c"], ["d", "d"]]]
#
# what will be counted is every strings same letters in the string and alphabet by this => .count{ |a, b| a == b }
# [[["a", "a"], ["b", "b"], ["d", "d"], ["e", "e"]], [["a", "a"], ["b", "b"], ["c", "c"]], ["d", "d"]]]
def solve(strings)
  strings.map{ |s| s.downcase.each_char.zip('a'..'z').count{ |a, b| a == b } }
end
p solve(["abode","ABc","xyzD"]) == [4,3,1]
p solve(["abide","ABc","xyz"]) == [4,3,0]
p solve(['IAMDEFANDJKL','thedefgh','xyzDEFghijabc']) == [6,5,7]
p solve(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]

puts

# Jesus Castello solution
# -create a hash of letters and their positions
# -transform the word in the following way
# -downcase it
# -look at every characters
# -with index
# -now that I have access to character and its index I can compare it with the hash reference I created at the beginning
# -count how many characters with their indexes are equal to the character's index in the hash (but add 1 coz)

ALPHA = ("a".."z").to_a.zip(1..26).to_h
p ALPHA

def solve(array)
  array.map do |word|
    word
      .downcase
      .each_char
      .with_index
      .count { |char, index| ALPHA[char] == index + 1 }
  end
end
p solve(["abode","ABc","xyzD"]) == [4,3,1]
p solve(["abide","ABc","xyz"]) == [4,3,0]
p solve(['IAMDEFANDJKL','thedefgh','xyzDEFghijabc']) == [6,5,7]
p solve(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]

#solving according to Ilke's algo
# =begin
# --------------------------Algorithm-------------------------
# - initialize an ALPHABET constant assigned to an array of letters from a-z
# - initialize `result_array`
# - initialize `count`
#
# - iterate through the input array and downcase each word
#
# -now assign count to the result of:
# 	- iterate through each character of the word and its index
#  - and count how many times this is true:
# 		- if the index of the current char is the same as it is in the alphabet
# 	- add this count to the output array
#
# 	- return the output array
# ----------------------------Code----------------------------
# =end
ALPHABET = ('a'..'z').to_a

def solve(arr)
  output_array = []
  count = 0

  arr.each do |word|
    word = word.downcase
    count = word.each_char.with_index.count do |char, index| #grab the index and compare it with the alphabet index
      index == ALPHABET.index(char)
    end
    output_array << count
  end
output_array
end
p solve(["abode","ABc","xyzD"]) == [4,3,1]
p solve(["abide","ABc","xyz"]) == [4,3,0]
p solve(['IAMDEFANDJKL','thedefgh','xyzDEFghijabc']) == [6, 5 ,7]
p solve(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]

puts
=begin
"You are absolutely correct! My apologies for the confusion in the previous response.
You are right in pointing out that each_char returns an enumerator when no block is passed to it.

When you call each_char without a block, it returns an enumerator object, which allows you to chain other methods like with_index.
This behavior is not specific to each_char; it applies to other Ruby methods as well, such as each_line and each_byte.

So, when you do "hello".each_char.with_index { |char, index| puts "#{char}, #{index}" }, it works because each_char returns an enumerator,
and then you chain the with_index method to it.
On the other hand, chars returns an array and not an enumerator.
Since with_index is a method available for enumerators but not for arrays, you cannot directly chain with_index to the result of "hello".chars.
To use with_index with the chars method, you need to convert the string into an enumerator first, which you can do using the to_enum method:
"hello".chars.to_enum.with_index { |char, index| puts "#{char}, #{index}" }"

Acha. It is confusing because the names of method are very similar. For example, we’re talking here about each_char, which is chained with with_index.
Each char is called on a string and returns an enumerator, on which it is possible, in turn, to call with_index.

But there is another method that exists in the Enumerable, which is a part of Array class, and that method is called each_with_index,
I think I wanted to use this one.
But since it’s an Array method, I need an array to use it. Or I can use chars and then I have an array… let me look into that…
I realized I actually used each_with_index on the characters array in my helper method. Frankly speaking I was baffled why ‘it worked this time’.
It worked because I used another method!
=end

ALPHABET = *('a'..'z')

def solve(array)
  return_array = []
  result = 0

  array.each do |word|
    word.downcase.chars.each_with_index do |char, index|
      result += 1 if index == ALPHABET.index(char)
    end

    return_array << result
    result = 0
  end

  return_array
end

p solve(["abode","ABc","xyzD"]) == [4, 3, 1]
p solve(["abide","ABc","xyz"]) == [4, 3, 0]
p solve(['IAMDEFANDJKL','thedefgh','xyzDEFghijabc']) == [6, 5, 7]
p solve(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]

# Sedricks solution
=begin



≂≂≂≂≂≂≂≂≂≂≂≂≂≂≂◟ 𝓟roblem ◞≂≂≂≂≂≂≂≂≂≂≂≂≂≂≂≂≂≂≂
Alphabet symmetry
Consider the word "abode". We can see that the letter a is in position 1 and b is in position 2. In the alphabet, a and b are also in positions 1 and 2. Notice also that d and e in abode occupy the positions they would occupy in the alphabet, which are positions 4 and 5.

Given an array of words, return an array of the number of letters that occupy their positions in the alphabet for each word. For example,


Given a word, determine how many chars occupy their alphabetic positions

● implicit requirement
  ⚬ first char determines the order of the alphabet positions
  ⚬ case does not matter

≂≂≂≂≂≂≂≂≂≂≂≂≂≂≂◟ Examples ◞≂≂≂≂≂≂≂≂≂≂≂≂≂≂≂≂≂≂≂

"abode","ABc","xyzD" = [4, 3, 1]

Input will consist of alphabet characters, both uppercase and lowercase. No spaces.

≂≂≂≂≂≂≂≂≂≂≂≂≂≂≂◟ DS ◞≂≂≂≂≂≂≂≂≂≂≂≂≂≂≂≂≂≂≂

a,b,c,d,e,f,g
abc

["encode","abc","xyzD","ABmD"] => [1, 3, 1, 3]

{a => 1}

o, =>3 {o => 11}
≂≂≂≂≂≂≂≂≂≂≂≂≂≂≂◟ Algorithm ◞≂≂≂≂≂≂≂≂≂≂≂≂≂≂≂≂≂≂

● generate sequence of alphabetic chars from a to z
  ⚬ use hash letter as key and position alpha as value

● convert input substrings to downcase
● access each input substring
● determine the starting position against the alphabetic range
  ⚬ use index position beggining from 1 and compare index position of curr char
    with the hash value of the specified key
  ⚬ if char matches position
    ⚬ add one to count
    ⚬
    ⚬ after all chars in substring are matched
       place total count into separate result collection
       reset count
       repeat untill substring are processed

● return the count
≂≂≂≂≂≂≂≂≂≂≂≂≂≂≂◟ code ◞≂≂≂≂≂≂≂≂≂≂≂≂≂≂≂≂≂≂≂

=end

def solve(arr)
  count = 0
  result = []

  letter_map = ("a".."z").each_with_object({}).with_index(1) { |(letter, hsh), i| hsh[letter] = i }

  downcase_arr = arr.map { |letter| letter.downcase }

  downcase_arr.each do |substring|
    substring.each_char.with_index(1) { |letter, i| count += 1 if letter_map[letter] == i }
    result << count
    count = 0
  end

  result
end

p solve(["abode", "ABc", "xyzD"]) == [4, 3, 1]
p solve(["abide", "ABc", "xyz"]) == [4, 3, 0]
p solve(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"])== [6,5,7]
p solve(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]

puts
def alphabet_map(arr)
  ("a".."z").each_with_object({}).with_index(1) { |(letter, hsh), index| hsh[letter] = index }
end

def solve(arr)
  count = 0

  arr.map(&:downcase).map do |substring|
    count = 0
    substring.each_char.with_index(1) { |letter, i| count += 1 if alphabet_map(arr)[letter] == i }
    count
  end
end

p solve(["abode", "ABc", "xyzD"]) == [4, 3, 1]
p solve(["abide", "ABc", "xyz"]) == [4, 3, 0]
p solve(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"]) == [6, 5, 7]
p solve(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]

puts

# my refactor of Sedrick's code
#
arr = ["abode", "ABc", "xyzD"]
ALPHABET_REFERENCE = ("a".."z").each_with_object({}).with_index { |(letter, hsh), index| hsh[letter] = index }

def solve(arr)
  arr.map(&:downcase).map do |word|
    count = 0
    word.each_char.with_index { |letter, index| count += 1 if ALPHABET_REFERENCE[letter] == index }
    count
  end
end

p solve(["abode", "ABc", "xyzD"]) == [4, 3, 1]
p solve(["abide", "ABc", "xyz"]) == [4, 3, 0]
p solve(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"]) == [6, 5, 7]
p solve(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]

# another idea
p (["a", "b", "c", "d", "e"] & ["a", "b", "o", "d", "e"]).size



