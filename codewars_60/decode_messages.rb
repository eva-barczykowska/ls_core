# We're receiving a set of messages in code. The messages are sets of text strings, like:
# "alakwnwenvocxzZjsf"
# Write a method to decode these strings into numbers. The decoded number should be the number of lowercase characters between the first two uppercase characters. If there aren't two uppercase characters, the number should be 0.
#
# P
# -method takes an array of strings
# -arg could be an empty array
# -strings have to be decoded into numbers
# -the decoded number should be the number of lowercase characters between the first two
# uppercase characters
# -if no 2 uppercase chars, the number should be zero
#
# E:
# p decode(['ZoL', 'heLlo', 'XX']) == [1, 0, 0]
# =>1 char: o,        0       0
#
# p decode(['foUrsCoreAnd', 'seven', '']) == [2, 0, 0]
# =>           U 2 C          0       0
#
# p decode(['lucYintheskyWith', 'dIaMonDs']) == [8, 1]
# =>              8                1
# p decode([]) == []
#
# N
# -get rid of all uppercase chars after the first 2
# -if no upperase chars => 0
# -empty str => 0
# -no chars in between =>0
# -no 2 chars but less =>0
# - for each word, I need a score
# -empty arr arg returns []
#
# DS:
# input: array of strings
# output: array of numbers
#
# A:
# initialize `result` []
# -empty arr arg returns []
#
# -ITERATE
# -if no upperase chars => 0
# -empty str => 0
# -no 2 chars but less =>0
#
# -init uppercase alphabet
# -iterate over the arr of strings
# -determine the index of 2nd uppercase letter in the string
# -get rid of all uppercase chars after the first 2 --range
#
# -WHAT IS IN BETWEEN 'foUrsC'
# -find index of the `st captal letter
# -determine 2 5
# -subtract last index number - first capital letter index (line 91) + 1  (5 - (2+1)) = 2
# -add it to result
#
# -what if there's nothing XX 1-(0+1)
# -no chars in between =>0
# - add this score to `result`
#
#
#
# Test cases:
# p decode(['ZoL', 'heLlo', 'XX']) == [1, 0, 0]
# p decode(['foUrsCoreAnd', 'seven', '']) == [2, 0, 0]
# p decode(['lucYintheskyWith', 'dIaMonDs']) == [8, 1]
# p decode([]) == []
UPPERCASE_ALPHABET = ('A'..'Z').to_a
def count_uppercase(str)
  str.chars.count { |letter| UPPERCASE_ALPHABET.include?(letter) }
end

# p count_uppercase("Hello")

def decode(array)
  result = []
  return [] if array.empty?

  array.each do |s|
    if s.empty? || s.size <= 2 || count_uppercase(s) < 2
      result << 0
    else
      indices_of_caps = [] # gives me index of 1st and 2nd capital letter
      s.chars.find_all.with_index { |l, i| indices_of_caps << i if UPPERCASE_ALPHABET.include?(l) }
      second_cap = indices_of_caps[1]

      s = s[0..second_cap] # sliced off what I don't need
      first_cap = indices_of_caps[0]
      count = second_cap - (first_cap + 1)
      result << count
    end
  end
  result
end
p decode(%w[ZoL heLlo XX]) == [1, 0, 0]
p decode(['foUrsCoreAnd', 'seven', '']) == [2, 0, 0]
p decode(%w[lucYintheskyWith dIaMonDs]) == [8, 1]
p decode([]) == []

puts
# refactored
UPPERCASE_ALPHABET = ('A'..'Z').to_a
def count_uppercase(str)
  str.chars.count { |letter| UPPERCASE_ALPHABET.include?(letter) }
end

# p count_uppercase("Hello")

def decode(array)
  result = []
  return [] if array.empty?

  array.each do |s|
    if s.empty? || s.size <= 2 || count_uppercase(s) < 2
      result << 0
    else
      indices_of_caps = []
      s.chars.find_all.with_index { |l, i| indices_of_caps << i if UPPERCASE_ALPHABET.include?(l) }

      first_cap = indices_of_caps[0]
      second_cap = indices_of_caps[1]

      result << second_cap - (first_cap + 1)
    end
  end

  result
end
p decode(%w[ZoL heLlo XX]) == [1, 0, 0]
p decode(['foUrsCoreAnd', 'seven', '']) == [2, 0, 0]
p decode(%w[lucYintheskyWith dIaMonDs]) == [8, 1]
p decode([]) == []

puts
puts "Amar's solution"
# --- A
# - RETURN empty array if given array is empty
# - INITIALIZE results array
# - INITIALIZE lowercase chars variable to represent lowercase chars between two uppercase
# - INITIALIZE upperchase chars to represent the amount of uppercase chars encoutnered
#   so far in the given string
# - COUNT the number of lowercase chars between two uppercase chars
#   - ITERATE over each string
#     - in each string, iterate over every char
#       - if the current char is uppercase
#         - increment uppercase count by +=1
#       - if the current char is lowercase and uppercase count is > 0
#         - increment lowercase count by +=1
#       - if uppercase count is equal to 2, break out of the loop
#       - at the last char in the string, if uppercase count is less than 2
#         - assign lowercase count to 0
#     - at the end of the string iteration
#       - append the current value of lowercase_count to results array
#       - reassign uppercase_count and lowercase_count to 0
# - RETURN results array

def decode(array)
  return [] if array == []

  results_arr = []

  array.each do |str|
    uppercase_count = 0
    lowercase_count = 0 # nice!

    str.chars.each_with_index do |letter, idx|
      break if uppercase_count == 2 # break can be used for each, not only for a loop

      uppercase_count += 1 if letter == letter.upcase
      lowercase_count += 1 if uppercase_count > 0 && letter == letter.downcase
      lowercase_count = 0 if idx == (str.size - 1) && uppercase_count < 2
    end

    results_arr << lowercase_count
    lowercase_count = 0
    uppercase_count = 0
  end

  results_arr
end
p decode(%w[ZoL heLlo XX]) == [1, 0, 0]
p decode(['foUrsCoreAnd', 'seven', '']) == [2, 0, 0]
p decode(%w[lucYintheskyWith dIaMonDs]) == [8, 1]
p decode([]) == []

puts
puts "Justin's solution"

CAPITALS = 'A'..'Z'

def decode_string(string) # takes care at 1 str
  index = 0
  num_caps = 0
  lower_chars = ''

  loop do
    # Return the empty string right away
    if index == string.size # so if this is an empty string
      return 0 # ********************************************************
    end

    char = string[index]
    # On capital letters, increment the number of capitals
    if CAPITALS.include?(char)
      num_caps += 1
      return lower_chars.size if num_caps == 2 # *******************************
    # Add lowercase letters to the substring after the first capital
    elsif num_caps == 1
      lower_chars << char
    end
    index += 1
  end
end

def decode(array)
  array.map { |str| decode_string(str) }
end

p decode(%w[ZoL heLlo XX]) == [1, 0, 0]
p decode(['foUrsCoreAnd', 'seven', '']) == [2, 0, 0]
p decode(%w[lucYintheskyWith dIaMonDs]) == [8, 1]
p decode([]) == []

puts

# Problem
# ++++++++
# -method takes an array of strings
# -method decodes strings into numbers
# -the decoded number should be the number of lowercase characters between the first two uppercase characters
# -If there aren't two uppercase characters, the number should be 0.
#
# Examples
# ==========
# p decode(['ZoL', 'heLlo', 'XX']) == [1, 0, 0]
#             1.      0.      0
# p decode(['foUrsCoreAnd', 'seven', '']) == [2, 0, 0]
#               2               0.    0
# p decode(['lucYintheskyWith', 'dIaMonDs']) == [8, 1]
#                   8              1
# p decode([]) == []
# => empty [] returns []
#
# Test cases:
# p decode(['ZoL', 'heLlo', 'XX']) == [1, 0, 0]
# p decode(['foUrsCoreAnd', 'seven', '']) == [2, 0, 0]
# p decode(['lucYintheskyWith', 'dIaMonDs']) == [8, 1]
# p decode([]) == []
#
# process_word
# -is the word empty?
# -if yes, return 0
# -are there 2 uppercase chars?
# -if not, return 0
# otherwise ITERATE over the worc chars with index
# --if yes, get the index of the first and second uppercase char
# 'lucYintheskyWith'
# -   3.       12 => 12 - 3 - 1
# 'ZoL' 2-0-1 = 1
# [0, 2]
#
# main method
# -return [] if arg is empty
# -ITERATE over the array of strings and call process_word on each string
# -save the return value to `codes`
# RETURN `codes`
#
# Notes
# word.chars.each do |c|
# count += 1 if uppercase.include?(c)
# end
UPPERCASE = *('A'..'Z')
def process(word)
  return 0 if word.empty?

  count = 0
  word.chars.each do |c|
    count += 1 if UPPERCASE.include?(c)
  end
  return 0 if count < 2

  indices = []
  word.chars.each_with_index do |char, index|
    indices << index if UPPERCASE.include?(char)
  end

  indices[1] - indices[0] - 1
end

p process('') == 0
p process('Zooo') == 0
p process('foUrsCoreAnd') == 2

def decode(arr)
  return [] if arr.empty?

  codes = []
  arr.each do |word|
    codes << process(word)
  end

  codes
end
p decode(%w[ZoL heLlo XX]) == [1, 0, 0]
p decode(['foUrsCoreAnd', 'seven', '']) == [2, 0, 0]
p decode(%w[lucYintheskyWith dIaMonDs]) == [8, 1]
p decode([]) == []

puts

def process(word)
  indices = []

  word.chars.each_with_index { |char, index| indices << index if ('A'..'Z').include?(char) }
  return 0 if indices.size < 2

  indices[1] - indices[0] - 1
end

def decode(arr)
  arr.map { |word| process(word) }
end
p decode(%w[ZoL heLlo XX]) == [1, 0, 0]
p decode(['foUrsCoreAnd', 'seven', '']) == [2, 0, 0]
p decode(%w[lucYintheskyWith dIaMonDs]) == [8, 1]
p decode([]) == []

# this is a Medium article
