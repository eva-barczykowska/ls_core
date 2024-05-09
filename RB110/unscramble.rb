# Problem 13
# Create a method that takes two strings as arguments and returns true if some portion of the characters in the first string can be rearranged to match the characters in the second. Otherwise, the method should return false.
#
# You may assume that both string arguments only contain lowercase alphabetic characters. Neither string will be empty.
# p unscramble('ansucchlohlo', 'launchschool') == true
# p unscramble('phyarunstole', 'pythonrules') == true
# p unscramble('phyarunstola', 'pythonrules') == false
# p unscramble('boldface', 'coal') == true
#
# Problem
# ========
# -method takes 2 strings as arguments
# -method returns true / false
# -true if some portion of the 1st str can be rearanged to match the characters in the 2nd str
# -Otherwise false
# -inly lowercase characters
# -strings are non-empty
#
# Examples
# ========
# p unscramble('ansucchlohlo', 'launchschool') == true
# p unscramble('phyarunstola', 'pythonrules') == false
# p unscramble('boldface', 'coal') == true
#
# + all the characters from str2 should exist in str 1
#
# p 'phyarunstole'.chars.sort
# p 'pythonrules'.chars.sort
#
# p 'pythonrules'.chars.sort.all? { |ch| 'phyarunstole'.chars.sort.include?(ch) }
#
# puts
#
# p 'phyarunstola'.chars.sort
# p 'pythonrules'.chars.sort.all? { |ch| 'phyarunstola'.chars.sort.include?(ch) }
#
# Algorithm
# ==========
# TRANSFORM s1 and s2 into array of characters and sort them
#
# VERIFY that all of characters from the 2nd s2 are present in s1

def unscramble(s1, s2)
  s2.chars.sort.all? { |ch| s1.chars.sort.include?(ch) }
end
p unscramble('ansucchlohlo', 'launchschool') == true
p unscramble('phyarunstole', 'pythonrules') == true
p unscramble('phyarunstola', 'pythonrules') == false
p unscramble('boldface', 'coal') == true
