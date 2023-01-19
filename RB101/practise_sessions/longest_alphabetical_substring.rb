=begin
Find the longest substring in alphabetical order.
# Example: the longest alphabetical substring in "asdfaaaabbbbcttavvfffffdf" is "aaaabbbbctt".
# The input will only consist of lowercase characters and will be at least one letter long.
# If there are multiple solutions, return the one that appears first.

p longest('asd') == 'as'
#p longest('nab') == 'ab'
#p longest('abcdeapbcdef') ==  'abcde'
#p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
#p longest('asdfbyfgiklag') == 'fgikl'
#p longest('z') == 'z'
#p longest('zyba') == 'z'

PEDAC
Problem
-write a method that takes a str as an argument
-the method returns the longest substring in alphabetical order
-assumptions: string will never be empty
-all letters are downcase letters

Example
"asdfaaaabbbbcttavvfffffdf" = "aaaabbbbctt"

Data Structures
input: string
middle: array
output: string

Algorithm
-define alphabet
-do lowercase and uppercase matter?
-in the alphabet to a string
-find all the substrings - how?
-go through video Amy posted about getting all substrings (double iteration)
-first iteration was iterating over the starting letter and second iteration was
 iterating over all the other letters
-first find out what is the first letter's index in the alphabet
-then look at the next letter and its index
-if the index is same or greater, add the letter to the current_substring
-else add the current_substring to all_substrings array
-continue looking and every letter until letters are over
-now compare substrings with the alphabet string, squeeze the substrings
-and see if the alphabet string includes them
-if yes, keep, if not - reject
-from all_substrings select the one that is the longest and return it
=end

def longest(str)
  all_substrings = []
  starting_letter = 0
  ending_letter = 0
  str.chars.each do |char|

  end
end

# p longest('asd') #== 'as'
p longest('nab') #== 'ab'
# p longest('abcdeapbcdef') #==  'abcde'
# p longest('asdfaaaabbbbcttavvfffffdf') #== 'aaaabbbbctt'
# p longest('asdfbyfgiklag') #== 'fgikl'
# p longest('z') #== 'z'
# p longest('zyba') #== 'z'
