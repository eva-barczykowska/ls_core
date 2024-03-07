=begin
Train: Substring fun \| Codewars](https://www.codewars.com/kata/565b112d09c1adfdd500019c/train/ruby)
7 kyu
Complete the function that takes an array of words.

You must concatenate the nth letter from each word to construct a new word which should be returned as a string, where n is the position of the word in the list.

For example:

["yoda", "best", "has"]  -->  "yes"
  ^        ^        ^
  n=0     n=1     n=2
Note: Test cases contain valid input only - i.e. a string array or an empty array; and each word will have enough letters.
P:
-write a methdo that takes an array as an arg
-from each word we take the character at a consecutive index, so 
 from word at index 0, it is char at index 0
 from word at index 1, it is char at index 1, etc.etc.

-these characters are appended together and form a word

-return that word

E:
p nth_char(['yoda', 'best', 'has']) == 'yes'
=            0        1       2
p nth_char([]) == ''
=> if arr empty, return ''

p nth_char(['X-ray']) == 'X'
=> if arr.size is 1, return arr[0][0]

p nth_char(['No', 'No']) == 'No'
=>

p nth_char(['Chad', 'Morocco', 'India', 'Algeria', 'Botswana', 'Bahamas', 'Ecuador', 'Micronesia']) ==  'Codewars'

DS: 
input: array
middle: array
output: str

A:
-initialize `result_str`

-iterate over the input array with index
-from each word take the char at the index of the word
-if word index is 0, I take char 0 from this word, etc. 

-append the selected character to the `result_str`
=end
def nth_char(array)
  return_str = ""

  array.each_with_index do |word, index|
    return_str << word[index]
  end

  return_str
end
p nth_char(['yoda', 'best', 'has']) == 'yes'
p nth_char([]) == ''
p nth_char(['X-ray']) == 'X'
p nth_char(['No', 'No']) == 'No'
p nth_char(['Chad', 'Morocco', 'India', 'Algeria', 'Botswana', 'Bahamas', 'Ecuador', 'Micronesia']) ==  'Codewars'

