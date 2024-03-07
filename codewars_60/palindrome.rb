=begin
 Problem 3
# Given a string, write a method to determine if it is possible to delete one character from the string to make it a palindrome. If it's possible, return the palindrome substring formed by deleting that character. If it's not possible, return nil.

P:
-method takes a string
-determine if it's possible to delete 1 char from the str to make it a palindrome
-only lowercase chars

-if it's possible, return palindrome
-if not, return nil

E:
# p palindrome_substring("abca")== "aca"
bca
aca => gets returned
aba


# p palindrome_substring("racecar")== "racecar"
=> if the str already IS a palindrome, return it 

# p palindrome_substring("hello")== nil
ello
hllo
helo 
helo 
hell => nil

# p palindrome_substring("abccba")== "abccba"
=> already a palindrome, return it

# p palindrome_substring("abcddcbaa")== "abcddcba"
abcddcbaa....removing
abcddcba => palindrome

# p palindrome_substring("abcdedcba")== nil

DS:
input: str
middle: array
output: palindrome/nil

A:
-check if str is a palindrome, if yes, return it

-change str into an array
-make a copy of array
-iterate over the array of characters
-at each iteration remove the character at consecutive index and
-save the resulting array, joined into `result`

-check if the formed string is a palindrome
-if yes, return it

-if none found, return nil


# Notes
result = []
str = "abca"
array = str.chars
# p array
counter = 0
loop do 
  copy = array.dup
  copy.delete_at(counter)
  result << copy.join
  counter += 1
  break if counter > array.size - 1
end

p result

#Code
=end

def palindrome_substring(str)
  return str if str == str.reverse
  result = []
  array = str.chars

  counter = 0
  loop do 
    copy = array.dup
    copy.delete_at(counter)
    result << copy.join
    counter += 1
  break if counter > array.size - 1
end

# p result

return nil if result.none? { |s| s == s.reverse }
result.each do |substring|
  return substring if substring == substring.reverse
end

end
p palindrome_substring("abca")== "aca"
# bca
# aca => gets returned
# aba
# abc


p palindrome_substring("racecar") == "racecar"
# # => if the str already IS a palindrome, return it 

p palindrome_substring("hello") == nil
# # ello
# # hllo
# # helo 
# # helo 
# # hell => nil

p palindrome_substring("abccba") == "abccba"

p palindrome_substring("abcddcbaa") == "abcddcba"
# # abcddcbaa....removing
# # abcddcba => palindrome

p palindrome_substring("abcdedcba") == "abcdedcba"

puts
puts "second try"
=begin
A:
-determine if arg already is a palindrome and is yes, return it

-take this string and save it as many times as its size to an array but every time you save it
-save it without char at index 0, 1, 2, etc.
-make a copy of the string for that
-iterate over the array of potential palindrome and if a word is a palindrome, return it

-if none found, return nil 
=end

def palindrome?(str)
  str == str.reverse
end
str = "madam"
p palindrome?(str) == true

def palindrome_substring(str)
   return str if palindrome?(str)
   substrings = []

  counter = 0
  loop do
    copy = str.dup
    copy[counter] = ""
    substrings << copy
    counter += 1
  break if counter > str.size - 1
end 

  return nil if substrings.none? { |s| s == s.reverse }

  substrings.each do |s| 
    return s if s == s.reverse
 end
end
# p palindrome_substring("abca")#== "aca"
# bca
# aca => gets returned
# aba
# abc


p palindrome_substring("racecar") == "racecar"
# # => if the str already IS a palindrome, return it 

p palindrome_substring("hello") == nil
# # ello
# # hllo
# # helo 
# # helo 
# # hell => nil

p palindrome_substring("abccba") == "abccba"

p palindrome_substring("abcddcbaa") == "abcddcba"
# # abcddcbaa....removing
# # abcddcba => palindrome

p palindrome_substring("abcdedcba") == "abcdedcba"