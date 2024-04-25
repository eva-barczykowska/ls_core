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

puts
# Ekerin's solution

# ALGORITHM - sliding window
# ==========================
# + generate Array of invalid characters from bad_chars

# > generate Array of consecutive valid characters

# + generate `start_i`, 0
# + generate `end_i`, 0

# + iterate until start_i and end_i are greater than or equal to length of String
#   + generate `start_char`
#   + generate `end_char`

#   + break loop if `start_i` and `end_i` are same last index

#   + check if `end_char` is valid
#     + if so,
#       + add slice from `start_i` to `end_i` to substrings
#       + increment `end_i` by `1`

#       + if `j` is greater than or equal to length of String
#         + reassign `i` and `j` to character following `i`

#     + if not,
#       + start_i && end_i are (current end_i + 1)

# + return Array of Substrings

# =end

def valid_char?(char, bad_chars)
  !bad_chars.include?(char)
end

def find_valid_substrings(start_str, bad_chars)
  valid_substrings = []
  invalid_chars = bad_chars.chars

  i = 0
  j = 0

  loop do
    break if (i >= (start_str.length)) && (j >= (start_str.length))

    i_char = start_str[i]
    j_char = start_str[j]

    if valid_char?(j_char, invalid_chars)
      valid_substrings << start_str[i..j]
      j += 1

      i = j = i + 1 if j >= start_str.length
    else
      i = j = i + 1
    end
  end

  valid_substrings
end
p find_valid_substrings('test', 't') == %w[e es s]
p find_valid_substrings('hello', 'el') == %w[h o]
p find_valid_substrings('12345', '3') == %w[1 12 2 4 45 5]
p find_valid_substrings('abcde', 'xyz') == %w[a ab abc abcd abcde b bc bcd bcde c cd cde d de e]
