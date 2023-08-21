=begin
https://leetcode.com/problems/reverse-vowels-of-a-string/

Reverse Vowels

Given a string s, reverse only all the vowels in the string and return it.
The vowels are 'a', 'e', 'i', 'o', and 'u', and they can appear in both cases.
Example 1:
Input: s = "hello"
Output: "holle"
=begin pedac

*************Problem********************
Overall goal: To write a method that takes a string, reverses the vowels, then returns the string
initial input: string/ 1 word
overall output: string/same word with vowels reversed

explicit requirements:
input string: 1 word all lowercase alpha chars
return string: same chars
              consonants in same position
              vowels are reversed
                ex: e o => o e
                    a e i o => o i e a/ reversed


implicit requirements:
empty string returns empty string
questions:
ex
p reverse_vowels("casa") == "casa"
p reverse_vowels("xwl") == "xwl"
p reverse_vowels("") == ""
p reverse_vowels("hello") == "holle"
p reverse_vowels("abeqpio") == "obiqpea"

*************Data Structure**************
string > hash > new string

***************Algorithm**********
define a method, 1 param, string
string > array > hash of vowels and idx, key is idx, vowel is value
reverse the hash values
insert back into the string
take the index from the hash (the key) and insert the value (from the inserted values)


=end

def reverse_vowels(string)
  hash = {}
  string.chars.select.with_index do |char, idx|
    if char =~ /[aeiou]/
      hash[idx] = char # retrieving indices and vowels
    end
  end

  keys = hash.keys
  vowels = hash.values.reverse # we have reversed vowels

  transformed_hash = keys.zip(vowels).to_h # inserting in the hash the reversed vowels, I can use this hash now

  string.each_char.with_index do|_, index|
    if transformed_hash.has_key?(index)
      string[index] = transformed_hash[index]
    end
  end

  string
end
p reverse_vowels("casa") == "casa"
p reverse_vowels("xwl") == "xwl"
p reverse_vowels("") == ""
p reverse_vowels("hello") == "holle"
p reverse_vowels("abeqpio") == "obiqpea"