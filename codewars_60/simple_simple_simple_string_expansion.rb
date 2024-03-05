=begin
https://www.codewars.com/kata/5ae326342f8cbc72220000d2
Given a string that includes alphanumeric characters ("3a4B2d") return the expansion of that string: The numeric values
represent the occurrence of each letter preceding that numeric value. There should be no numeric characters in the final
string.

Notes
The first occurrence of a numeric value should be the number of times each character behind it is repeated,
until the next numeric value appears
If there are multiple consecutive numeric characters, only the last one should be used (ignore the previous ones)
Empty strings should return an empty string.
Your code should be able to work for both lower and capital case letters.

PEDAC:
P:
-first occurrence of the number before the character should be how many times the character behind that number is repeated
-if there are more numbers, only the last one should be used (the last one before the number I guess)
-empty str returns an empty str
-code should work for both lowercase and uppercase lettters

E:
"3D2a5d2f"  -->  "DDDaadddddff"
=> 3 * "D" + 2 * "a" + 5 * "d" + 2 * "f"

"3abc"      -->  "aaabbbccc"
=> not "aaabc", nor "abcabcabc"; 3 * "a" + 3 * "b" + 3 * "c"

"3d332f2a"  -->  "dddffaa"         # multiple consecutive digits: 3 * "d" + 2 * "f" + 2 * "a"

"abcde"     -->  "abcde"           # no digits
"1111"      -->  ""                # no characters to repeat
""          -->  ""                # empty string

N:
-start from the end
-iterate
-for each char find first int
-multiply the char by that int and prepend the result of multiplication to the result string

A:

num_array = (1..9).to_a
letter_array = ('a'..'z').to_a
current_multiplier = 1
result = ""

"3D2a5d2f".each_char do |char|
  if num_array.include?(char)
    current_multiplier = n
    next
  end
  if letter_array.include?(char.downcase)
    result << char * current_multiplier
    next
  end
end

# break up
"332f" => "ff"

3ab" => "aaabbb"
"3a" => "aaa"  3 * 'a'
"2a" => "aa".  2 * 'a'
"1a" => "a"
"a" => "a".    1 * 'a'

# p str_expansion("abcde") == "abcde"
# p str_expansion("1111") == ""
# p str_expansion("") == ""

=end
def string_expansion(str)
  num_array = (1..9).to_a #create a reference of numbers (this is something new)
  letter_array = ('a'..'z').to_a + ('A'..'Z').to_a # create a reference of uppercase and lowercase letters

  current_multiplier = 1 #default multiplier
  result = ""

 str.each_char do |char| # iterate over the string characters, initialize multiplier
  if num_array.include?(char.to_i)
    current_multiplier = char.to_i
  end

  if letter_array.include?(char) #check for the alphabet letter
    result << char * current_multiplier
  end
 end

result
end

p string_expansion("3D2a5d2f") == "DDDaadddddff"
p string_expansion("3abc") == "aaabbbccc"
p string_expansion("3d332f2a") == "dddffaa"
p string_expansion("abcde") == "abcde"
p string_expansion("1111") ==  ""
p string_expansion("") ==  ""

puts

=begin
https://www.codewars.com/kata/5ae326342f8cbc72220000d2/train/ruby
Given a string that includes alphanumeric characters ("3a4B2d") return the expansion of that string: The numeric values represent the occurrence of each letter preceding that numeric value. There should be no numeric characters in the final string.

Notes:
The first occurrence of a numeric value should be the number of times each character behind it is repeated, until the next numeric value appears
If there are multiple consecutive numeric characters, only the last one should be used (ignore the previous ones)
Empty strings should return an empty string.
Your code should be able to work for both lower and capital case letters.

"3D2a5d2f"  -->  "DDDaadddddff"    # basic example: 3 * "D" + 2 * "a" + 5 * "d" + 2 * "f"
"3abc"      -->  "aaabbbccc"       # not "aaabc", nor "abcabcabc"; 3 * "a" + 3 * "b" + 3 * "c"
"3d332f2a"  -->  "dddffaa"         # multiple consecutive digits: 3 * "d" + 2 * "f" + 2 * "a"
"abcde"     -->  "abcde"           # no digits
"1111"      -->  ""                # no characters to repeat
""          -->  ""                # empty string

p:
- input: alphanumeric string
- output: alpha string

- take input string and return the "expanded" version in a new string
  - expanded: 
- if no numbers in input string, return input string
- if only numbers in input string, return an empty string
- if input string is empty, return empty string
- if consecutive letters follow a number, then all are expanded by that number

n:
- check for consecutive numbers
  - the only thing that matters is the number directly preceding the letter (if the element after the current number is a letter, stop to do something)
- check for when I hit a number again
- convert string number to an integer
- convert to an array of chars
-  to split a string using a special delimiter

"3D2a5d2f"
"3D" "2a" "5d" "2f"
- iterate through array of chars
    - append current char to empty string 
    - keep going until I hit a number
    - add that chunk to an array

"3d332f2a" ["3d", "3", "3", "2f"]

a:
- convert input string to array of characters
- if no numbers in array, return input string
    - convert all chars to integer, if all are 0 then return input string
- if only numbers in array, return an empty string
    - convert all chars to intgers and if there are no 0, then return empty
- if array is empty, return empty string

- initialize a storage array
- initialize empty string to storage_string
- initialize a result string
- chunk while: 

- remove subarrays with size 1 from storage array
- use the inner arrays obtain by chunking
- use the number from the chunk to know how many times add the letter(s) from the chunk to the return array
-- convert the number-string to a number
--multiply the strig by the number
--if there are more than 1 string, multiply all of them by the same number 

- initialize integer from first element of storage array
- iterate through storage array
    - skip over first element
    - current element * integer
    - append result to result string
- return result string
=end

def string_expansion(input_string)
  # return input_string if input_string.empty?
  # chars_array = input_string.split('')
  # return input_string if chars_array.map {|el| el.to_i}.all?(0) #they're all letters
  # return '' if chars_array.map {|el| el.to_i}.none?(0) #none is a letter

  result = ''
  
  chunked_array = input_string.chars.chunk_while { |i, j| j.to_i == 0 }.to_a
  # p chunked_array
  
  chunked_array.each do |subarray|
    number = subarray.first.to_i
    array_without_number = subarray[1..-1]
    array_without_number.each do |letter|
      result << letter * 1 if number.zero?
      result << letter * number
    end
  end

  result
end

p string_expansion("3D2a5d2f") == "DDDaadddddff"    # basic example: 3 * "D" + 2 * "a" + 5 * "d" + 2 * "f"
p string_expansion("3abc") ==  "aaabbbccc"       # not "aaabc", nor "abcabcabc"; 3 * "a" + 3 * "b" + 3 * "c"
p string_expansion("3d332f2a") ==  "dddffaa"         # multiple consecutive digits: 3 * "d" + 2 * "f" + 2 * "a"
p string_expansion("abcde") == "abcde"           # no digits
p string_expansion("1111") == ""                # no characters to repeat
p string_expansion("") == ""                # empty string

puts

def string_expansion(input_string)
  result = ''
  
  chunked_array = input_string.chars.chunk_while { |i, j| j.to_i == 0 }.to_a
  p chunked_array
  
  chunked_array.each do |subarray|
    number = subarray.first.to_i #0
    subarray.each { |letter| result << letter * 1 } if number.zero?
    
    subarray.each_with_index do |letter, index|
      next if index == 0 #skips the array 
      result << letter * number
    end
  end
  
  result
end
p string_expansion("3D2a5d2f") == "DDDaadddddff"    # basic example: 3 * "D" + 2 * "a" + 5 * "d" + 2 * "f"
p string_expansion("3abc") ==  "aaabbbccc"       # not "aaabc", nor "abcabcabc"; 3 * "a" + 3 * "b" + 3 * "c"
p string_expansion("3d332f2a") ==  "dddffaa"         # multiple consecutive digits: 3 * "d" + 2 * "f" + 2 * "a"
p string_expansion("abcde") == "abcde"           # no digits
p string_expansion("1111") == ""                # no characters to repeat
p string_expansion("") == ""                # empty string

puts

def string_expansion(input_string)
  result = ''
  
  chunked_array = input_string.chars.chunk_while { |i, j| j.to_i == 0 }.to_a
  p chunked_array
  
  chunked_array.each do |subarray|
    number = subarray.first.to_i #0
    subarray.each { |letter| result << letter * 1 } if number.zero?
    
    subarray.each_with_index do |letter, index|
      next if index == 0 #skips the array!
      result << letter * number
    end
  end
  
  result
end
p string_expansion("3D2a5d2f") == "DDDaadddddff"    # basic example: 3 * "D" + 2 * "a" + 5 * "d" + 2 * "f"
p string_expansion("3abc") ==  "aaabbbccc"       # not "aaabc", nor "abcabcabc"; 3 * "a" + 3 * "b" + 3 * "c"
p string_expansion("3d332f2a") ==  "dddffaa"         # multiple consecutive digits: 3 * "d" + 2 * "f" + 2 * "a"
p string_expansion("abcde") == "abcde"           # no digits
p string_expansion("1111") == ""                # no characters to repeat
p string_expansion("") == ""                # empty string

puts

def string_expansion(input_string)
  result = ''
  
  chunked_array = input_string.chars.chunk_while { |i, j| j.to_i == 0 }.to_a
  p chunked_array
  
  chunked_array.each do |subarray|
    number = subarray.first.to_i #0
    subarray.each { |letter| result << letter * 1 } if number.zero?
    
    subarray.each_with_index do |letter, index|
      next if index == 0 #skips the array 
      result << letter * number
    end
  end
  
  result
end
p string_expansion("3D2a5d2f") == "DDDaadddddff"    # basic example: 3 * "D" + 2 * "a" + 5 * "d" + 2 * "f"
p string_expansion("3abc") ==  "aaabbbccc"       # not "aaabc", nor "abcabcabc"; 3 * "a" + 3 * "b" + 3 * "c"
p string_expansion("3d332f2a") ==  "dddffaa"         # multiple consecutive digits: 3 * "d" + 2 * "f" + 2 * "a"
p string_expansion("abcde") == "abcde"           # no digits
p string_expansion("1111") == ""                # no characters to repeat
p string_expansion("") == ""                # empty string

puts

def string_expansion(input_string)
  result = ''
  
  chunked_array = input_string.chars.chunk_while { |i, j| j.to_i == 0 }.to_a
  p chunked_array
  
  chunked_array.each do |subarray|
    number = subarray.first.to_i #0
    subarray.each { |letter| result << letter * 1 } if number.zero?
    
    subarray.each_with_index do |letter, index|
      next if index == 0 #skips the entire subarray if it only contains one number string element
      result << letter * number
    end
  end
  
  result
end
p string_expansion("3D2a5d2f") == "DDDaadddddff"    # basic example: 3 * "D" + 2 * "a" + 5 * "d" + 2 * "f"
p string_expansion("3abc") ==  "aaabbbccc"       # not "aaabc", nor "abcabcabc"; 3 * "a" + 3 * "b" + 3 * "c"
p string_expansion("3d332f2a") ==  "dddffaa"         # multiple consecutive digits: 3 * "d" + 2 * "f" + 2 * "a"
p string_expansion("abcde") == "abcde"           # no digits
p string_expansion("1111") == ""                # no characters to repeat
p string_expansion("") == ""                # empty string

puts
https://www.codewars.com/kata/5ae326342f8cbc72220000d2/train/ruby
Given a string that includes alphanumeric characters ("3a4B2d") return the expansion of that string: The numeric values represent the occurrence of each letter preceding that numeric value. There should be no numeric characters in the final string.

Notes:
The first occurrence of a numeric value should be the number of times each character behind it is repeated, until the next numeric value appears
If there are multiple consecutive numeric characters, only the last one should be used (ignore the previous ones)
Empty strings should return an empty string.
Your code should be able to work for both lower and capital case letters.

"3D2a5d2f"  -->  "DDDaadddddff"    # basic example: 3 * "D" + 2 * "a" + 5 * "d" + 2 * "f"
"3abc"      -->  "aaabbbccc"       # not "aaabc", nor "abcabcabc"; 3 * "a" + 3 * "b" + 3 * "c"
"3d332f2a"  -->  "dddffaa"         # multiple consecutive digits: 3 * "d" + 2 * "f" + 2 * "a"
"abcde"     -->  "abcde"           # no digits
"1111"      -->  ""                # no characters to repeat
""          -->  ""                # empty string

puts
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
----test verbally
----come up with pattern that takes care of ALL the testcases
----come up with a new patters/new idea
----practise coming up with different ideas
A:
- initialize `new_str`
- iterate over the string
 - if

s = "3D2a5d2f"

# p str_expansion("3D2a5d2f") == "DDDaadddddff"
# p str_expansion("3abc") == "aaabbbccc"
# p str_expansion("3d332f2a") == "dddffaa"

