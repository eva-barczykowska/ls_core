=begin
Complete the solution so that it returns the number of times the search_text is found within the full_text.

Example:
solution('aa_bb_cc_dd_bb_e', 'bb') # should return 2 since bb shows up twice
solution('aaabbbcccc', 'bbb') # should return 1


# p solution('abcdeb','b') == 2
# p solution('abcdeb', 'a') == 1
# p solution('abbc', 'bb') == 1

P:
-write a method that returns the number of times that the search text was found
in the arg string

  E:
p solution('abcdeb','b') == 2
=>b is 2 times in the str argument

p solution('abcdeb', 'a') == 1
=> a is found 1 time

p solution('abbc', 'bb') == 1
=> bb is found 1 time

DS:
input: 2 strings
output: integer

A:
-scan the input str and save the result to an array
-return the size of that array
=end

def solution(str, search_text)
  str.scan(search_text).size
end
p solution('abcdeb','b') == 2
p solution('abcdeb', 'a') == 1
p solution('abbc', 'bb') == 1