# Given 2 strings, a and b, return a string of the form short+long+short,
# with the shorter string on the outside and the longer string on the inside.
# The strings will not be the same length, but they may be empty ( zero length ).
#
#   Hint for R users:
#
# The length of string is not always the same as the number of characters
# For example: (Input1, Input2) --> output
# p solution("1", "22") == "1221"
# p solution("22", "1") == "1221"
# p solution("a", "bb"), "abba"
# p solution("aa", "b"), "baab"

# PEDAC
# ************** Problem **************
#-argument passed to the method is 2 strings, a and b
# -method returns a string, where a and b are concatenated
# -the pattern of concatenation is short_string + long_string + short_string
# -strings will not be the same length so I don't have to account for that
# -but strings may be empty
#
# -what happens if a string is empty? I add an empty string to the result?
# ************** Examples **************
# p solution("1", "22") == "1221"
# =>1 is shorter so it will go first, then 22 then 1 again
# p solution("22", "1") == "1221"
# =>1 is shorter so it will go first, then 22 then 1 again
# p solution("a", "bb"), "abba"
# =>a is shorter so it will go first, then bb then 1 again
# p solution("aa", "b"), "baab"
# =>b is shorter so it will go first, then aa then b again
# ************** Data Structures **************
# Input: 2 strings
#
# Output: 1 string
#   ************** Notes **************
# ************** Algorithm **************
# -initialize `result` str
# -check what is the length of a and b
# -if a is shorter, append it first then append b and follow by a => s1 + s2 + s1
# - if b is shorter, append it first, then append a and follow by b => s2 + s1 + s2
#
# how to account for an empty string?
# -no need, just check for the size and add it normally
#
# ************** Code **************
#
# ************** Refactor **************
def solution(a, b)
  result = ''
  if a.size < b.size
    result << a << b << a
  else
    result << b << a << b
  end

  result
end
p solution("1", "22") == "1221"
p solution("22", "1") == "1221"
p solution("a", "bb") == "abba"
p solution("aa", "b") == "baab"

puts
def solution(a, b)
  a.size < b.size ? a+b+a : b+a+b
end
p solution("1", "22") == "1221"
p solution("22", "1") == "1221"
p solution("a", "bb") == "abba"
p solution("aa", "b") == "baab"

