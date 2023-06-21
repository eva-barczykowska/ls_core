=begin
20. Count and Group Character Occurrences in a String
(https://www.codewars.com/kata/543e8390386034b63b001f31)
6 kyu
Write a method that takes a string as an argument and groups the number of times
each character appears in the string as a hash sorted by the highest number of occurrences.

  The characters should be sorted alphabetically e.g:

  get_char_count("cba") => {1=>["a", "b", "c"]}
You should ignore spaces, special characters and count uppercase letters as lowercase ones.
  =end
p get_char_count("Mississippi") == {4=>["i", "s"], 2=>["p"], 1=>["m"]}
p get_char_count("Hello. Hello? HELLO!!") == {6=>["l"], 3=>["e", "h", "o"]}
p get_char_count("aaa...bb...c!") == {3=>["a"], 2=>["b"], 1=>["c"]}
p get_char_count("aaabbbccc") == {3=>["a", "b", "c"]}
p get_char_count("abc123") == {1=>["1", "2", "3", "a", "b", "c"]}

PEDAC TEMPLATE

************** Problem **************
-write a method that takes a string as an argument
-the method groups the number of times each characters appears in the string as a hash sorted by the highest number
 of occurrences
-key is an integers that denotes how many times a character appears
-value is an ARRAY with letter that appear the number of times specified in the hash
-the characters should be sorted alphabetically -> get_char_count("cba") => {1=>["a", "b", "c"]}
-ignore spaces, special characters and count uppercase letters as lowercase ones.
-do not ignore digits!!!
Questions:

************** Examples **************
get_char_count("cba") => {1=>["a", "b", "c"]}
-> because a, b and c appear once in this string argument

************** Data Structures **************
input: a string
output: a hash with
-the letters from the string counted
-the count is the key, the letters are values in the array that belongs to the key
-the letters have to be sorted alphabetically
************** Algorithm **************
-downcase the string argument
-clean from any non-alphabetical characters but leave digits 0-9
-convert string to array of single characters
-sort the characters
-count these characters (tally?) (count?)
-work with a hash that I have to get the desired structure so
get_char_count("cba") => {1=>["a", "b", "c"]}
-how to transform {"a"=>1, "b"=>1, "c"=>1} into {1=>["a", "b", "c"]}
-initialize the hash result
-iterate over each key-value pair in the hash
-if the value doesn't exist as a key, add it to the key and add the letter(key from the current hash)
 to the value array -- will the letters be sorted alphabetically by default???
-if the value exists already in the hash, add it to the correct array belonging to the correct key
-check if the values (arrays) are alphabetically sorted!)
-return the result hash
************** Code **************
=end
def get_char_count(str)
  result = {}
  h = str.downcase.chars.reject { |char| char =~ /[^a-z0-9]/ }.sort.tally
  h.each_pair do |key1, value1|
    if !result.keys.include?(value1)
      result[value1] = [] << key1
    else
      result[value1] << key1
    end
  end
  result
end
p get_char_count("cba") == {1=>["a", "b", "c"]}
p get_char_count("Mississippi") == {4=>["i", "s"], 2=>["p"], 1=>["m"]}
p get_char_count("Hello. Hello? HELLO!!") == {6=>["l"], 3=>["e", "h", "o"]}
p get_char_count("aaa...bb...c!") == {3=>["a"], 2=>["b"], 1=>["c"]}
p get_char_count("aaabbbccc") == {3=>["a", "b", "c"]}
p get_char_count("abc123") == {1=>["1", "2", "3", "a", "b", "c"]}

