# second time
# =begin
#
# Given non empty string check if it can be constructed by taking a substring of it an appending multiple copies of substring
#   together.
#
#   Assume given string consists of lowercase English letters only.
#
# Example 1:
# Input: 'abab'
# Output: true
# Explanation: It's the substring 'ab' twice.
# Example 2:
# Input: 'aba'
# Output: false
# Explanation: String cannot be constructed from repeating substring.
# =begin pedac
#
# *************Problem********************
# Overall goal: To write a method that takes a string and detects whether it can be constructed by taking a substring and multiplying it by a number. return false if it cannot be constructed this way, true if it can be constructed this way
# initial input: string
# overall output: boolean
#
# explicit requirements:
# input string: lowercase chars only
# return value:
#   true: if substring * integer == string
#   false: if substring * integer != string
# rules for detection
#   generate substrings
#   check if substring * integer == substring return true
#   only looking for multiple copies, so integer we would check >=2
#
#
# implicit requirements:
#
# questions:
#
# **********Examples/Test cases************
# p repeated_substring_patten('abab')  == true
# **'ab' * 2 == 'abab'  so method returns true
# p repeated_substring_patten('aba') == false
# ** wont work, return false
# aba
# a ab aba
# b ba
# a
# p repeated_substring_patten('aabaaba') == false
# **no substrings will work
# p repeated_substring_patten('abaababaab') == true
# ** 'abaab' * 2 = 'abaababaab'. true is returned
# p repeated_substring_patten('abcabcabcabc') == true
# ** 'abc' * 4 == 'abcabcabcabc'
#
# *************Data Structure**************
# string > boolean
#
#
# *************SCRATCH PAD**************
# gen substrings: nested each structure. iterate (0...string.size)/ pass in start_idx to the block
#   iterate over range (start_idx...string.size) / pass in end_idx
#     3rd layer: 2.upto(string.size / 2) / pass in `int` to block
#     count += 1
#
#
#
#
# ***************Algorithm*****************
# define method, 1 parameter `string`
# initialize `count` to 0
# generate substrings
#   iterate 2 up to string size / 2 / passing in each integer
#     if substring * int == string
#         then return true
#     else return false
# ternary operator: count > 0 return true, else return false
#
#
# =end

def repeated_substring_patten(string)
  count = 0
  (0...string.size).each do |start_idx|
    (start_idx...string.size).each do |end_idx|
      2.upto(string.size / 2) do |int|
        count += 1 if string[start_idx..end_idx] * int == string
      end
    end
  end
  count > 0 ? true : false
end
p repeated_substring_patten('abab') == true
p repeated_substring_patten('aba') == false
p repeated_substring_patten('aabaaba') == false
p repeated_substring_patten('abaababaab') == true
p repeated_substring_patten('abcabcabcabc') == true
