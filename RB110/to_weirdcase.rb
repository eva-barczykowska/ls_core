# # Write a method named to_weird_case that accepts a string, and
# returns the same sequence of characters with every 2nd character
# in every third word converted to uppercase. Other characters
# should remain the same.
#
# PEDAC
# P:
# - write a method that takes a string
# - method returns the same sequence of characters, with every 2nd character in every 3rd word upcased, other characters remain the same
#
# Examples:
# p to_weird_case('Lorem Ipsum is simply dummy text of the printing') ==
#                 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
# 'Lorem Ipsum is simply dummy text of the printing'
#               |               |           |
# 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
# => word index 2, always count to 2 and work with the 2nd word
# => in that word, start with index 1(odd) and upcase every odd character
#
# p to_weird_case(
#   'It is a long established fact that a reader will be distracted') ==
#   'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
# p to_weird_case('aaA bB c') == 'aaA bB c'
# p to_weird_case(
#   'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
#   'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'
#
# The tests above should print "true".
# DS:
# input: str
# output: new str
#
# A:
# - change word to array
# - initialize `return_array` to []
#
# - initialize an array of `special_counters`, where you start with 2 and go up to arr.size
# - save all those numbers
#
# - iterate over the array using a loop and `counter`
# - if the index of word at the current counter is included in `special_counters`
# - change that word to array of characters
# - iterate over this array of characters and get access to index
# - upcase every character at the odd index
#
# - else add word to `return_array` just as it is
#
# - join the array on a space in order to return a string
#
# N:
# - each with index

def to_weird_case(str)
  return_array = []

  arr = str.split

  special_counters = []
  counter = 2
  while counter < arr.size
    special_counters << counter
    counter += 3
  end

  counter = 0
  while counter < arr.size
    return_array << if special_counters.include?(counter)
                      arr[counter].chars.each_with_index { |ch, index| ch.upcase! if index.odd? }.join
                    else
                      arr[counter]
                    end
    counter += 1
  end

  return_array.join(' ')
end
p to_weird_case('Lorem Ipsum is simply dummy text of the printing') ==
  'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
# 'Lorem Ipsum is simply dummy text of the printing'
#               |               |           |
# 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
# => word index 2, always count to 2 and work with the 2nd word
# => in that word, start with index 1(odd) and upcase every odd character

p to_weird_case(
  'It is a long established fact that a reader will be distracted'
) ==
  'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case(
  'Miss Mary Poppins word is supercalifragilisticexpialidocious'
) ==
  'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'

# =begin
# Problem 3
# Create a method that takes a string argument and returns a copy of the string with every second character in every third word converted to uppercase. Other characters should remain the same.
#
# original = 'Lorem Ipsum is simply dummy text of the printing world'
# expected = 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG world'
# p to_weird_case(original) == expected
#
# original = 'It is a long established fact that a reader will be distracted'
# expected = 'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
# p to_weird_case(original) == expected
#
# p to_weird_case('aaA bB c') == 'aaA bB c'
#
# original = "Mary Poppins' favorite word is supercalifragilisticexpialidocious"
# expected = "Mary Poppins' fAvOrItE word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS"
# p to_weird_case(original) == expected
#
# Problem
# =======
# -method takes a string as an argument
# -method returns a COPY of the string with every second character in every third word converted to
# uppercase
# -other characters remain the same
#
# Examples
# =========
# original = 'Lorem Ipsum is simply dummy text of the printing world'
# expected = 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG world'
#                         *                *              *
# =>we count to 2 and we process each word that falls on index 2 ON CONDITION
# p to_weird_case(original) == expected
#
# original = 'It is a long established fact that a reader will be distracted'
# expected = 'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
#                   *                    *            *               *
# => the condition is that every second character, but the first word to process has only 1 character so
# it remains unchanged
# p to_weird_case(original) == expected
#
# p to_weird_case('aaA bB c') == 'aaA bB c'
# =>                                     *
# =>unchanged because only 1 character
# original = "Mary Poppins' favorite word is supercalifragilisticexpialidocious"
# expected = "Mary Poppins' fAvOrItE word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS"
# =>                            *                            *
# p to_weird_case(original) == expected
#
# Algorithm
# =========
# DEFINE a helper method to process word, `process_word`
# -takes a str as an argument
# -iterate over word characters with index
# -upcase every second character, so index 1
# -if index is not odd, do nothing just add char to result as it is
# -return processed word
#
#
# MAIN METHOD
# -INIT `result` to array
# -INIT `counter`
# -INIT `upcasing_counter` to 0
# -TRANSFORM str to an array
# -ITERATE over the array with `counter` starting from 0
# --at each iteration where `upcasing_counter` is not 2,
# --just add the word as it is to `result`
# --increase the `counter` by 1
# --increase the `upcasing_counter` by 1
# --when counter reaches 2, use the helper method `process_word`
# --add the processed word to `result`
# --reassign the `upcasing_counter` to -1
#
# -join the `result` array to form a string
# -RETURN `result`

def process_word(word)
  result = []
  word.chars.map.with_index do |char, index|
    result << if index.odd?
                char.upcase
              else
                char
              end
  end

  result.join
end

p process_word('printing') == 'pRiNtInG'
p process_word('a') == 'a'

def to_weird_case(str)
  result = []
  counter = 0
  upcasing_counter = 0

  arr = str.split
  while counter < arr.size
    if upcasing_counter == 2
      result << process_word(arr[counter])
      upcasing_counter = -1
    else
      result << arr[counter]
    end
    counter += 1
    upcasing_counter += 1
  end

  result.join(' ')
end
original = 'Lorem Ipsum is simply dummy text of the printing world'
expected = 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG world'
p to_weird_case(original) == expected

original = 'It is a long established fact that a reader will be distracted'
expected = 'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case(original) == expected

p to_weird_case('aaA bB c') == 'aaA bB c'

original = "Mary Poppins' favorite word is supercalifragilisticexpialidocious"
expected = "Mary Poppins' fAvOrItE word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS"
p to_weird_case(original) == expected
