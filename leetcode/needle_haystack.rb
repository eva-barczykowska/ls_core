=begin
Given two strings needle and haystack, return the index of the first occurrence of needle in haystack,
or -1 if needle is not part of haystack.
P:
- write a method that takes 2 arguments, a haystack and a needle
- return the first occurrence of the needle

E:
p str_str("sadbutsad", "but") == 3
=> first occurence is index 3 (starts at)
p str_str("leetcode", "leeto") == -1
=> this needle is not there in haystack, return -1

Notes:
- scan method

A:
- if haystack doesn't include the needle,
  return -1
- else
- find the index of when this needle substring starts - how?
- return its index

C:
=end
def str_str(haystack, needle)
  if !haystack.include?(needle)
    return -1
  else
    return haystack.index(needle)
  end
end

p str_str("sadbutsad", "but") == 3
p str_str("leetcode", "leeto") == -1
# *********************************************************
=begin
Ian's PEDAC
Problem
Input: Two strings
Return: Index where all of word 2 is found in word 1
Rules: Return -1 if not found
Return the index where word two STARTS in word 1.

Examples

High-Level:
Iterate to create substrings with outer index
test if substring includes word 2
if does return outer index

Data
Two strings

Algorithm
Define a method that takes two string args.
Iterate exclusively over a range from 0 to word 1 length with index
  Iterate again from first it. to word1 length (exclusively)
  substring is created by el. ref. word 1 from first it to second it.
  return outer index if substring includes word 2
=end

def str_str(haystack, needle)
  haystack.each_char.with_index do |_, index|
    (index..haystack.length).each do |end_index|
      substring = haystack[index..end_index]
      return index if substring == needle
    end
  end
  -1
end
p str_str("sadbutsad", "but") == 3
p str_str("leetcode", "leeto") == -1

puts
def str_str(haystack, needle)
  (0..haystack.size).each do |starting_index|
    (starting_index...haystack.size).each do |ending_index|
      substring = haystack[starting_index..ending_index]
      return starting_index if substring == needle
    end
  end
  return -1
end
p str_str("sadbutsad", "but") == 3
p str_str("leetcode", "leeto") == -1


