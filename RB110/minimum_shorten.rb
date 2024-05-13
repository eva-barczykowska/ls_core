# # Implement the function/method, minimum shorten. The function shortens a
# sentence such that it will fit within the character limit set. It shortens
# by removing vowels in the sequence of a, e, i, o, and u. Start removing from
# the end of the sentence. If it can not be shortened to fit within character limit,
# return an empty string. Spaces don’t count for the limit.

# Input : String ; Integer (the limit)
# Output: String (that is the input String shortened to fit within the limit)
#
# Rules:
#   - IF the input String is already within the limit THEN RETURN the input String
#   - We can only remove vowels in the sequence of a e i o u
#   - We have to start by removing letters from the back to the front
#   - IF the input String cannot be shortened to fit within the char limit THEN RETURN an empty String
#   - Spaces don't count for the limit (only letters do)
#   - Double spaces are okay
#
# DS
#   Input String
#
#   => Integer (to hold the number of chars removed)
#   => Integer (to hold the number of chars to be removed)
#
# ** count_letters()
#
# => VOWELS
# => String Vowels
#
# ALGO:
#   1. GET letter count of the input String
#   2. RETURN input IF the letter count is equal to or less than the limit
#   3. GO OVER each vowel
#     a) UNTIL the string DOES NOT include the current vowel ... do this loop
#       THEN GET the index from the back of that letter in the String
#       THEN DELETE/REMOVE that vowel at that index from the input String
#       IF the letter count is equal to or less than the limit THEN RETURN the input String
#       ELSE
#         go to NEXT vowel
#
#   4. RETURN implicitly an empty string

def minimum_shorten(str, limit)
  return str if letter_count(str) <= limit

  'aeiou'.each_char do |vowel|
    while str.chars.include?(vowel)
      letter_ind = str.rindex(vowel)
      str[letter_ind] = ''
      return str if letter_count(str) == limit
    end
  end

  ''
end

def letter_count(str)
  str.scan(/[a-z]/i).size
end

p minimum_shorten('eeea', 3) == 'eee'
p minimum_shorten('This is a test sentence', 18) == 'This is  test sentence'
p minimum_shorten('Hello World', 8) == 'Hllo Wrld'
# Hllo Wrld (8)
p minimum_shorten('Short', 10) == 'Short'
p minimum_shorten('A very long sentence with many vowels', 10) == ''
