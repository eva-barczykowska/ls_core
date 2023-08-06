# Write a method named to_weird_case that accepts a string, and
# returns the same sequence of characters with every 2nd character
# in every third word converted to uppercase. Other characters
# should remain the same.

# Examples:

# p to_weird_case('Lorem Ipsum is simply dummy text of the printing') ==
#                 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
# p to_weird_case(
#   'It is a long established fact that a reader will be distracted') ==
#   'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
# p to_weird_case('aaA bB c') == 'aaA bB c'
# p to_weird_case(
#   'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
#   'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'

# The tests above should print "true".

# PEDAC TEMPLATE

# ************** Problem **************
# -write a method that takes a string as an argument
# -take every third word
# -from that word take every 2nd character and upcase it
# -if the 3rd word has just 1 character, do nothing
# ************** Examples **************
# p to_weird_case('Lorem Ipsum is simply dummy text of the printing') ==
#                 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
#                 => 3rd word: is = > iS, 6th word is text => tExT, 9th word is printing => pRiNtInG
#
# p to_weird_case(
#   'It is a long established fact that a reader will be distracted') ==
#   'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
#
# p to_weird_case('aaA bB c') == 'aaA bB c'
# p to_weird_case(
#   'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
#   'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'

# ************** Data Structures **************
# Input: a string
# Middle: how I’m going to get from where I am to where I want to be
# Output: a transformed string
# ************** Algorithm **************
# -divide the string into words

# -iterate over the words

# -find every 3rd word, that is word at index 2, 4, 6, etc.

# -in that word, find every2nd character, so character at index 1, 3, 5, 7, etc.
# -upcase the character at that index BUT only if it is there... so only if its size is more than 1

# -I would split this into 2 methods, one with dealing with upcasing odd indices in a word
# -and the main one that takes every third word and processes it

# ************** Code **************

def process(word)
  return word if word.size <= 2

  processed = ''

  word.chars.each_with_index do |_, index|
    processed << if index.odd?
                   word[index].upcase
                 else
                   word[index]
                 end
  end
  processed
end

# p "Processed:"
# p process_word("lorem")

def to_weird_case(str)
  index = 2
  array_of_words = str.split

  loop do
    break if index > array_of_words.size
    array_of_words[index] = process(array_of_words[index])
    index += 3
  end
  array_of_words.join(" ")
end

p to_weird_case('Lorem Ipsum is simply dummy text of the printing') #==
'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case(
  'It is a long established fact that a reader will be distracted') ==
  'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case('Miss Mary Poppins word is supercalifragilisticexpialidocious') == 'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'

puts
# ************** Refactor **************

# Differentiate between EXPLICIT AND IMPLICIT requirements?
#
#
#
# # Write a method named to_weird_case that accepts a string, and
# # returns the same sequence of characters with every 2nd character
# # in every third word converted to uppercase. Other characters
# # should remain the same.
#
#  return same sequence of chars with every 2nd char in every third word converted to its uppercase equivalent
#
#  Explicit Requirements
#  input: string
#  output: new string
#  access the third word and convert 2nd char to uppercase
#  chars that are not the above should be the same
#
#  implicit requirments
#  skip whitespace chars
#
#  examples and test case
# Lorem Ipsum is simply dummy text of the printing
# 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
#
# Data strucutures
# is => iS
# text => tExT
# printing => pRiNtInG
#
# supercalifragilisticexpialidocious
# sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS

# Algorithm
# -build a new array(the problem doesn't say that it has to be the same string but the same sequence of characters)
# -initialize an empty `new_str` to store the result
#
# -split string into words
# -iterate over each word
# -if the word is not every third word, just add it to the new array as it is
# -how to find out that the word is every third???
# -initialize `target_indices` and append the right numbers there, going from 2 to string size.
#  i.e. 2, 5, 8, 11 (num + 3) - these are indices
# -once calculated the target_indices, iterate over the words with index and if index of a given word doesn't belong to target_indices,
#  just add the word as it is to new_str array
# -if index of the word does belong to indices, iterate over this word's chars with index and upcase every char at odd index
#  then join characters append this word to new_str

# -join the all words so that we have a string again
# -return `new_str`


# --
# -also could split this into 2 methods, change_word and main method, to_weird_case

def to_weird_case(str)
  new_str = []
  arr = str.split(" ")

  target_word_indices = [2]
  counter = 2
  loop do
    counter += 3
    target_word_indices << counter
    break if counter >= str.size
  end

  arr.each.with_index do |word, index|
    if !target_word_indices.include?(index)
      new_str << word
    else
      word = word.chars.each_with_index { |char, index| char.upcase! if index.odd? }
      new_str << word.join
    end
  end

  new_str.join(" ")
end
#the above took 55 min.
#
# shorted code for target_indices
def to_weird_case(str)
  new_str = []
  arr = str.split(" ")

  target_word_indices = []
  (2..str.size).step(3) { |num| target_word_indices << num } # step method :)

  arr.each.with_index do |word, index|
    if !target_word_indices.include?(index)
      new_str << word
    else
      word = word.chars.each_with_index { |char, index| char.upcase! if index.odd? }
      new_str << word.join
    end
  end

  new_str.join(" ")
end
p to_weird_case('Lorem Ipsum is simply dummy text of the printing') == 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case(
  'It is a long established fact that a reader will be distracted') ==
  'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case(
 'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
 'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'

# puts "solving with 2 methods"
# #trying to solve with 2 methods
# 1 method will deal only with the word so
# iterate over the word's chars with index and if index id odd, upcase the word
# method returns the transformed word
#
# 2nd method is the main method, to_weird_case
# -initialize new_str array
# this method iterates over words and if the word is every third, call the helper method on it and add the return
# -how to know that the word is every third? helper indices variable
# value of that method to the new_str
# else if the word is not every third, just add the word as it is to the

str = 'Lorem Ipsum is simply dummy text of the printing'
indices = []
(2..str.size).step(3) { |num| indices.push(num) }
p indices

puts "Sedrick's solution"
def to_weird_case(str)
  arr = str.split
  arr.each.with_index(1) do |word, i| # each_with_index can take an argument
    #p "word: #{word}: index #{i}"
    if i % 3 == 0
      puts
      (0...word.size).each do |ii| # iterate from index 0 to word size - 1, ii stands for the index of the character in a word
        print "char: #{word[ii].class}: index #{ii}"
        puts
        word[ii] = word[ii].upcase if ii % 2 == 1 # using String Element Reference method, upcase characters, if their indices are odd
      end
    end
  end
  arr.join(" ")
end
  # .with_index(1) will shift index so instead of
# ["Lorem", "Ipsum", "is", "simply", "dummy", "text", "of", "the", "printing"]
#     0        1       2      3         4        5      6     7        8
# we will have
# ["Lorem", "Ipsum", "is", "simply", "dummy", "text", "of", "the", "printing"]
#   1         2        3      4        5         6     7      8        9
#
# we need to upcase every third word so with old indices it was 2, 5, 8, with new ones it's 3, 6, 9, so it's always divisible by 3
p to_weird_case('Lorem Ipsum is simply dummy text of the printing') ==
    'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case(
    'It is a long established fact that a reader will be distracted') ==
    'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case(
    'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
    'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'

puts

def to_weird_case(str)
  arr = str.split

  2.step(arr.size, 3) do |word_idx| #index of every 3rd word
    (0...arr[word_idx].size).each do |char_idx| #index position of char in a word in every 3rd word
      arr[word_idx][char_idx] = arr[word_idx][char_idx].upcase if char_idx % 2 == 1
    end
  end
  arr.join(" ")
end

p to_weird_case('Lorem Ipsum is simply dummy text of the printing') ==
    'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case(
    'It is a long established fact that a reader will be distracted') ==
    'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case(
    'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
    'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'

