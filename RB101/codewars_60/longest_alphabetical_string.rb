# 23. Longest alphabetical substring
# (https://www.codewars.com/kata/5a7f58c00025e917f30000f1)
# 6 kyu
# Find the longest substring in alphabetical order.

# Example: the longest alphabetical substring in "asdfaaaabbbbcttavvfffffdf" is "aaaabbbbctt".

# There are tests with strings up to 10 000 characters long so your code will need to be efficient.

# The input will only consist of lowercase characters and will be at least one letter long.

# If there are multiple solutions, return the one that appears first.
# PEDAC TEMPLATE

# ************** Problem **************
# -write a method
# -the method takes a string as an argument
# -the method has to find the longest alphabetical substring
# -the method has to be efficient because we may have strings up to 10k size
# -input is only lowercase characters
# -if there are multiple solutions, return the the one that appears first

# Questions:

# ************** Examples **************
# p longest('asd') == 'as'
# -> we have: 'as' and 'd', 'as' wins because is longer than 'd'
# p longest('nab') == 'ab'
# -> we have 'n' and 'ab', 'ab' wins because it is LONGEST
# p longest('abcdeapbcdef') == 'abcde'
# -> we have 'abcde', 'ap', 'bcdef', 'abcde' wins because it comes FIRST
# p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
# -> we have 'as', 'df', 'aaaabbbbctt', 'avv', 'fffffdf', 'aaaabbbbctt' wins because it is THE LONGEST
# p longest('asdfbyfgiklag') == 'fgikl'
# -> we have 'asdf', 'by', 'fgikl', 'ag', 'fgikl' wins because it is LONGEST
# p longest('z') == 'z'
# -> it is the only one! -- needs separate code?
# p longest('zyba') == 'z'
# -> it is the fist one! -- needs separate code?

# ************** Data Structures **************
# input: string
# middle:
# output: a string

# ************** Algorithm **************


# ************** Code **************

