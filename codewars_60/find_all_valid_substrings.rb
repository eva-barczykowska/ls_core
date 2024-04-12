# # Write a method that finds all substrings that donâ€™t contain any of the prohibited characters given in the second argument.
#
# Test cases
# puts find_valid_substrings("test", "t").inspect # [ 'e', 'es', 's' ]
# t
# te
# tes
# test
# --e
# --es
# ---s
#
# ==
#
# e
# es
# es it wants unique
#
# ==>[ 'e', 'es', 's' ]
# puts find_valid_substrings("hello", "el").inspect # [ 'h', 'o' ]
# hello
# h
# hel x
# hell X
# hello x
# --e x
# --el X
# --l x
# --o
# ---l x
# ---l X
# ---o
#
# puts find_valid_substrings("12345", "3").inspect # [ '1', '12', '2', '4', '45', '5' ]
# puts find_valid_substrings("abcde", "xyz").inspect
# [
#   'a', 'ab', 'abc', 'abcd', 'abcde', 'b',
#   'bc', 'bcd', 'bcde', 'c', 'cd', 'cde',
#   'd', 'de', 'e'
# ]
# ======
# Problem:
# -method takes 2 args, str and forbidden character
# -method finds and returns ALL POSSIBLE SUBSTRINGS that don't contain prohibited characters
#
# Hypotheis:
# 1. iterate over the characters and if a char is forbidden don't include it in the current substring that you will add to `substrings`
# 2. take all substrings and remove those that contain forbidden characters
#
# DS:
# input: str, forbidden char
# output: an array of ALL POSSIBLE UNIQUE SUBSTRINGS
#
# A:
# -split the forbidden character(s) so that you have an array
# - INIT `all_substrings` to []
#
# -ITERATE over the str
# --start with 0 up to str lenth - 1 - OUTER ITERATION, starting index # str.size.lenth times do?
# --start with starting index and up to str size -1, -INNER ITERATION, finishing index
# --save substring to `all_substrings`, substrings of increasing lengh UNLESS it contains any of the forbidden characters
#
#
# -return uniq `all_substrings`
# =
def find_valid_substrings(str, forbidden_char)
  forbidden_characters = forbidden_char.split('')
  all_substrings = []

  (0...str.size).each do |starting_index|
    (starting_index...str.size).each do |finishing_index|
      substring = str[starting_index..finishing_index]
      all_substrings << substring unless forbidden_characters.any? { |fc| substring.include?(fc) }
    end
  end

  all_substrings
end
# puts find_valid_substrings("test", "t").inspect # [ 'e', 'es', 's' ]
# puts find_valid_substrings("hello", "el").inspect # [ 'h', 'o' ]
puts find_valid_substrings('12345', '3').inspect # [ '1', '12', '2', '4', '45', '5' ]
puts find_valid_substrings('abcde', 'xyz').inspect # [ 'a', 'ab', 'abc', 'abcd', 'abcde', 'b', 'bc', 'bcd', 'bcde', 'c', 'cd', 'cde', 'd', 'de', 'e']
