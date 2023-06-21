
=begin
Reverse Only Letters

Given a string s, reverse the string according to the following rules:
1. All the characters that are not English letters remain in the same position.
2. All the English letters (lowercase or uppercase) should be reversed.
Return s after reversing it.
=begin pedac

*************Problem********************
Overall goal: To write a method that takes a string and reverses it while leaving non alphabetical chars in place
initial input: string/1 word
overall output: string/same word but reversed

explicit requirements:
input string: chars are lower and uppercase alphabet chars
              also has non alpha chars
return string: same string with same chars, but reversed
rules for reversing:
  1. non alphabet chars are left in place. they are not moved nor are they reversed. Their index position remains the same after reversal
  2. All the alpha chars are reversed together. not in sections delineated by dashes.


implicit requirements:

questions:

**********Examples/Test cases************
p reverse_only_letters("a-bC-dEf-ghIj") == "j-Ih-gfE-dCba"
** abCdEfghIj => jIhgfEdCba then add - back => j-Ih-gfE-dCba
p reverse_only_letters("ab-cd") == "dc-ba"
** abcd => dcba => dc-ba
p reverse_only_letters("Test1ng-Leet=code-Q!") == "Qedo1ct-eeLg=ntse-T!"

*************Data Structure**************
string > hash >reversed string

***************Algorithm*****************
Overall approach:
DEFINE A METHOD, 1 PARAMETER `STRING`
INITIALIZE 'HASH' TO EMPTY HASH
CONVERT STRING TO ARRAY
**use chars
ITERATE OVER ARRAY AND POPULATE HASH
**use each with index
** if char is not alphabetical (char !~ /[a-zA-Z]/), use hash k-v assignment to populate the hash
    ** hash[idx] = char KEY IS IDX POSITION, VALUE IS CHAR
CLEAN THE STRING/REMOVE NON ALPHA CHARS
** use gsub(/[^a-zA-Z]/, '') to subsitute a non alpha char with an empty space. This deletes the non alpha char.
REVERSE THE STRING/ASSIGN TO `CLEAN_STRING`
** string is all alpha chars, use reverse to reverse it
INSERT THE NON-ALPHA CHARS BACK INTO THE STRING
**iterate over hash (hash contains the dashes)
** use each, insert(idx, char)
RETURN VALUE IS CLEAN_STRING
=end

def reverse_only_letters(string)
  hash = {}
  string.chars.each_with_index do |char, idx|
    if char !~ /[a-zA-Z]/
      hash[idx] = char
    end
  end
  hash
  clean_string = string.gsub(/[^a-zA-Z]/, '').reverse
  hash.each do |idx, char|
    clean_string.insert(idx, char)
  end
  clean_string
end

p reverse_only_letters("a-bC-dEf-ghIj")  == "j-Ih-gfE-dCba"
p reverse_only_letters("ab-cd") == "dc-ba"
p reverse_only_letters("Test1ng-Leet=code-Q!") == "Qedo1ct-eeLg=ntse-T!"

