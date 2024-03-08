=begin
Given a string that includes alphanumeric characters ("3a4B2d") return the expansion of that string: The numeric values represent the occurrence of each letter preceding that numeric value. There should be no numeric characters in the final string.

Notes
The first occurrence of a numeric value should be the number of times each character behind it is repeated, until the next numeric value appears
If there are multiple consecutive numeric characters, only the last one should be used (ignore the previous ones)
Empty strings should return an empty string.
Your code should be able to work for both lower and capital case letters.

P:
-method takes a string with numbers
-method returns only letters, each letter is printed the number of times indicated by the first integer BEFORE it
-code should work for both upper and lowercase

E:
"3D2a5d2f"  -->  "DDDaadddddff"
=>                DDDaadddddff

"3abc"      -->  "aaabbbccc"
=>                aaabbbccc

"3d332f2a"  -->  "dddffaa"
                  dddffaa

"abcde"     -->  "abcde" 
=> no numbers, return str argument

"1111"      -->  ""
=> all numbers, return empty str

""          -->  ""
=> empty str, return empty str

DS:
input: str with numbers

output: str without numbers

N: reverse_each 
---------------------------IMPORTANT FEEDBACK FROM WOOK-----------------------------------
----test verbally
----come up with pattern that takes care of ALL the testcases
----come up with a new patterns/new ideas
----practise coming up with different ideas
---------------------------IMPORTANT FEEDBACK FROM WOOK-----------------------------------
A:
- initialize `new_str`
- iterate over the string
 - if

s = "3D2a5d2f"

# p str_expansion("3D2a5d2f") == "DDDaadddddff"
# p str_expansion("3abc") == "aaabbbccc"
# p str_expansion("3d332f2a") == "dddffaa"
=end
puts
=begin
Given a string that includes alphanumeric characters ("3a4B2d") return the expansion of that string: The numeric values represent the occurrence of each letter preceding that numeric value. There should be no numeric characters in the final string.

Notes
The first occurrence of a numeric value should be the number of times each character behind it is repeated, until the next numeric value appears
If there are multiple consecutive numeric characters, only the last one should be used (ignore the previous ones)
Empty strings should return an empty string.
Your code should be able to work for both lower and capital case letters.

P:
-method takes an array as an argument
-method builds a new string
-the number immediately preceding the letter indicates how many times that letter will be pushed to the new string
-empty string returns ""
-code needs to work for both lowercase and uppercase characters

E:
p str_expansion("3D2a5d2f") == "DDDaadddddff"
=>                DDD-aa-ddddd-ff
p str_expansion("3abc") == "aaabbbccc"
                 
p str_expansion("3d332f2a") == "dddffaa"

Idea1
Iterate over this string and look for the last number before the letter. Use that number to append that many letters as the number indicates to `result` string.
If the next letter doesn't have a number in front of it, use the number that you've already saved (as `multiplier`) to append that many letters as the multiplier indicates.

Idea2
Change into array or chars and chunk based on i, j, j.to_i == 0. This will give me a nested array with arrays inside. The arrays will have a number and a letter.
 Use that number as a multiplier for the letter. However, if that array has only one array inside, take the first element, a number and use it as a multiplier for all the remaining elements(letters) in that array. Multiply and append to `result.`

 Idea3
 Reverse the string. Iterate over the characcters and find the first number, it and multiply the first letter by the first char you can find after it, remove 


DS:
input: str with numbers
output: str without numbers but with multiplied characters

A:
Going with Idea 2
-init `result_str`
-change str to arr and chunk on the basis of integer, you'll get nested array to process
-first element of the inner array is always the multiplier, then there are letters
-use the multiplier to multiply the letters and append them to the string
-if there's no 2nd element, we need to skip somehow



=end

def str_expansion(str)
  result_str = ''

  chunks = str.chars.chunk_while { |i, j| j.to_i == 0 }.to_a
  chunks.each do |array_inside|
    multiplier = array_inside[0].to_i
    array_inside[1..-1].each do |letter|
      result_str << letter * multiplier
    end
  end

result_str

end
p str_expansion("3D2a5d2f") == "DDDaadddddff"
p str_expansion("3abc") == "aaabbbccc"
p str_expansion("3d332f2a") == "dddffaa"