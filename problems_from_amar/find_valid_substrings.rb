#  Write a function that finds all substrings that doesn’t contain any of the
# prohibited characters given in the second argument.
#
# Problem
# =======
# -method takes 2 arguments, strings
# -method returns all substrings that don't contain forbidden characters from the 2nd arguemnt
#
#
# Test cases
# puts find_valid_substrings("test", "t").inspect # [ 'e', 'es', 's' ]
# =>
# t, te, tes, test
# -e, es, est
# --s, st
# ---t => e, es, s
#
# puts find_valid_substrings("hello", "el").inspect # [ 'h', 'o' ]
# =>
# h, he, hel, hell, hello
# -e, el, ell, ello
# --l,ll, llo
# ---l, lo
# ----o => h, o
#
# puts find_valid_substrings("12345", "3").inspect # [ '1', '12', '2', '4', '45', '5' ]
# =>
# 1, 12, 123, 1234, 12345,
# -2, 23, 234, 2345
# --3, 34, 345
# ---4, 45
# ----5 => 1, 12, 2, 4, 45, 5
#
# puts find_valid_substrings("abcde", "xyz").inspect
# =>ALL SUBSTRINGS are allowed
#
# [
#   'a', 'ab', 'abc', 'abcd', 'abcde', 'b',
#   'bc', 'bcd', 'bcde', 'c', 'cd', 'cde',
#   'd', 'de', 'e'
# ]
#
# ALgorithm
# =========
# -INIT valid_substrings = []
#
# -ITERATE over the str argument
# --start from elemnt at index 0 and continue until the last element (starting index)
# --start from starting index and continue until the last element
# ---retrieve increasingly longer substrings
# ---store them valid substrings
#
# -ITERATE over valid_substrings and
# --REJECT the substrings that contains the 2nd argument, split the 2nd arg into letters and reject 1 by 1
# -check the size of forbidden and 1 by 1 remove forbidden characters
def find_valid_substrings(str, forbidden)
  valid_substrings = []

  (0...str.size).each do |start|
    (start...str.size).each do |finish|
      valid_substrings << str[start..finish]
    end
  end

  forbidden = forbidden.split('')
  valid_substrings.reject { |s| s.chars.any? { |letter| forbidden.include?(letter) } }
end
p find_valid_substrings('test', 't') == %w[e es s]
p find_valid_substrings('hello', 'el') == %w[h o]
p find_valid_substrings('12345', '3') == %w[1 12 2 4 45 5]
p find_valid_substrings('abcde',
                        'xyz') == %w[a ab abc abcd abcde b bc bcd bcde c cd cde d de e]
