# 3.Return substring instance count
# (https://www.codewars.com/kata/5168b125faced29f66000005/train/ruby)
# 7 kyu
=begin
Return substring instance count
Complete the solution so that it returns the number of times the search_text is found within the full_text.

Usage example:

solution('aa_bb_cc_dd_bb_e', 'bb') # should return 2 since bb shows up twice
solution('aaabbbcccc', 'bbb') # should return 1
PEDAC TEMPLATE

************** Problem **************
Questions:
-empty string? there will be no empty String
-only letters?
************** Examples **************
p solution('abcdeb','b') == 2
=> because 'b' is found twice in the arg1
p solution('abcdeb', 'a') == 1
=> becayse 'a' is found only once
p solution('abbc', 'bb') == 1
=> because 'bb' is found once in the arg1
************** Data Structures **************
input: a string, a substring to find
output: integer, the number of times that the arg2 is present in arg1
************** Algorithm **************
create substrings and count them
  'abbc'
  a, ab, abb, abbc
  b, bb, bbc
  b, bc, c

  -iterate over the array of substrings and check which ones are equal
  to the target substrings, transform the array according to the return value of the block AND count how many times does the `true` object appears in the transformed array

  -return that number
************** Code **************

=end
def solution(arg1, arg2)
  substrings = []
    (0...arg1.size).each do |index| # this retrieves ALL substrings
      (index...arg1.size).each do |index2|
     substrings << arg1[index..index2]
    end
  end
  # p substrings
  # for 3rd example: ["a", "ab", "abb", "abbc", "b", "bb", "bbc", "b", "bc", "c"]
  # .. on line 45:   ["a", "ab", "abb", "abbc", "abbc", "b", "bb", "bbc", "bbc", "b", "bc", "bc", "c", "c"]
  substrings.map { |substring| substring == arg2 }.count(true)
  # or substrings.select { |s| s == arg2 }.size
end

p solution('abcdeb','b') == 2
p solution('abcdeb', 'a') == 1
p solution('abbc', 'bb') == 1
p solution('aaabbbcccc', 'bbb') == 1

# (0..string.size - 1)
# (0...string.size)

puts

def solution(arg1, arg2)
  substrings = []
  (0..arg1.size - arg2.size).each do |index| # this retrieves only the substrings of the size that we need
    substrings << arg1[index, arg2.size]
  end
  # p substrings
  substrings.select { |s| s == arg2 }.size
end

p solution('abcdeb','b') == 2
p solution('abcdeb', 'a') == 1
p solution('abbc', 'bb') == 1
# so for this one above for example, which is 'abbc', we are saying 0..arg1.size - arg2.size, so (0..2)
# so line 69 will give us respectively arg1[index, arg2.size] so arg1[0, 2],  arg1[1, 2] arg1[2, 2] so 'ab', 'bb', bc
# (0..arg1.size - 1 ) -> (0..)
# a b b c
# ar1.size (4) - arg2.size (2) -> 2
p solution('aaabbbcccc', 'bbb') == 1


puts "codewars"
# Complete the solution so that it returns the number of times the search_text is found within the full_text.
# PEDAC
# ************** Problem **************
# -write a method that takes 2 arguments
# -text and substring to be searched in that text
# -return how many instances of the search text was found
# ************** Examples **************
solution('abcdeb','b') #== 2
solution('abcdeb', 'a') == 1
solution('abbc', 'bb') == 1
# ************** Data Structures **************
# Input: text, search text
#
# Output: integer
# ************** Algorithm **************
# -initialize `result`
# create substrings from the text BUT the substrings have to be the same size as of the search text
#
# --how to create all substrings
# --create a range from 0...text.size, iterate over each index, that's your start_index
# --now create a range from start_index...text.size, iterate over each of those indexes, gradually slicing substrings
#
# -but to the substrings array ONLY THOSE substrings, whose size is equal to the `search_text` size
#
# compare substrings to the search text and calculate how many of the substrings are equal to the search text
#
# return that number
# ************** Code **************
#
# ************** Refactor **************
def solution(text, search_text)  # this doesn't pass all the tests on Codewars
  substrings = []

  (0...text.size).each do |start_index|
    (start_index...text.size).each do |end_index|
      substring = text.slice(start_index, end_index) # THIS IS THE DIFFERENCE
      substrings << substring if substring.size == search_text.size
    end
  end

  substrings.select { |s| s == search_text }.size
end
p solution('abcdeb','b') #== 2
# a, b, c, d, e, b
p solution('abcdeb', 'a') #== 1
p solution('abbc', 'bb') #== 1

# Ilke's solution - passes all tests on Codewars
def solution(full_text, search_text)
  subs_array = []

  (0..full_text.size - 1).each do |index1|
    (index1..full_text.size - 1).each do |index2|
      substring = full_text[index1..index2] # THIS IS THE DIFFERENCE
      subs_array << substring if substring.size == search_text.size
    end
  end

  subs_array.count { |subs| subs == search_text }
end
p solution('abcdeb','b') #== 2
# a, b, c, d, e, b
p solution('abcdeb', 'a') #== 1
p solution('abbc', 'bb') #== 1

puts
# love the simplicity of this solution
def solution(text, search_text)
  text.scan(search_text).size
end
p solution('abcdeb','b') == 2
p solution('abcdeb', 'a') == 1
p solution('abbc', 'bb') == 1

puts

=begin
Complete the solution so that it returns the number of times the search_text is found within the full_text. Overlap is not permitted : "aaa" contains 1 instance of "aa", not 2.

Usage example:
full_text = "aa_bb_cc_dd_bb_e", search_text = "bb" == 2 since "bb"

full_text = "aaabbbcccc", search_text = "bbb" == 1
PEDAC:
P:
- write a method that takes 2 strings as arguments, string and search_string
- method returns how many times search_string is found in string
- overlap is not permitted

E:
p solution('abcdeb','b') == 2
=> 'a-b-cde-b-'

p solution('abcdeb', 'a') == 1
=>'-a-bcdeb'

p solution('abbc', 'bb') == 1
=> 'abbc'

DS:
input: 2 strings
output: integer

N: scan

A:
- count how many times a seach_string occurs and populate array with every instance of search_string occurs

- return the size of that array
=end

def solution(string, search_string)
  string.scan(search_string).count
end
p solution('abcdeb','b') == 2
p solution('abcdeb', 'a') == 1
p solution('abbc', 'bb') == 1

puts
# if I didn't have the scan method
# initialize `arr` to store substrings

# - iterate over the string and slice it from index 0 to index - 1: this gives me starting index of the substring
# - iterate from starting_index until array.size - 1, this gives me ending index of the substring
# - populate arr with substrings

# - in the substrings array, count how many times I have a certain subarray that is equal to the ssearch_string

# return its size

def solution(string, search_string)
  arr = []
  (0...string.size).each do |starting_index|
    (starting_index...string.size).each do |ending_index|
      arr << string[starting_index..ending_index]
    end
  end
  arr.select { |subarr| subarr == search_string }.size
end

p solution('abcdeb','b') #== 2
p solution('abcdeb', 'a') #== 1
p solution('abbc', 'bb')# == 1
