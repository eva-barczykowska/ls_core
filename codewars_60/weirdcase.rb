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

def process_word(word)
  return word if word.size <= 2

  processed = ''

  word.chars.each_with_index do|char, index|
    if index.odd?
      processed << word[index].upcase
    else
      processed << word[index]
    end
  end
  processed
end

# p "Processed:"
# p process_word("lorem")

def to_weird_case(str)
  result = []
  index = 2
  array_of_words = str.split

  loop do
    break if index > array_of_words.size
    array_of_words[index] = process_word(array_of_words[index])
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

# ************** Refactor **************

# Differentiate between EXPLICIT AND IMPLICIT requirements?
