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
    (0...arg1.size).each do |index| #this retrieves ALL substrings
      (index...arg1.size).each do |index2|
     substrings << arg1[index..index2]
    end
  end
  # p substrings
  # for 3rd example: ["a", "ab", "abb", "abbc", "b", "bb", "bbc", "b", "bc", "c"]
  # .. on line 45:   ["a", "ab", "abb", "abbc", "abbc", "b", "bb", "bbc", "bbc", "b", "bc", "bc", "c", "c"]
  substrings.map { |substring| substring == arg2 }.count(true)
  #or substrings.select { |s| s == arg2 }.size
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
