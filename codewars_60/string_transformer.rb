=begin

[Train: String transformer \| Codewars](https://www.codewars.com/kata/5878520d52628a092f0002d0/train/ruby)
6 kyu
Given a string, return a new string that has transformed based on the input:

Change case of every character, ie. lower case to upper case, upper case to lower case.
Reverse the order of words from the input.
Note: You will have to handle multiple spaces, and leading/trailing spaces.

For example:

"Example Input" ==> "iNPUT eXAMPLE"
You may assume the input only contain English alphabet and spaces.

P:
- method takes a str
- swapcase in the str
- reverse the order of words

E:
"Example Input" == "iNPUT eXAMPLE"
=> words are reverse and case is swapped

p string_transformer("You Know When  THAT  Hotline Bling")# == "bLING hOTLINE  that  wHEN kNOW yOU"
=> additionally, the spaces around wards are preserved
"You Know When  THAT  Hotline Bling" => "bLING hOTLINE  that  wHEN kNOW yOU"

DS
middle: array

A:
iterate over the array
if the char at the current it. is a space, add it to the result str and move on (add 1 to counter)
if it is not add it to temp word and move on by 1 char
do this until the char is a space, in which case, you know that you've accumulated full word in temp
- at this point, join this word, swapcase and add prepend it to the result string
- then add the space and go back to the beginning of the loop as above
-break if the counter is nil
 => ["Y", "o", "u", " ", "K", "n", "o", "w", " ", "W", "h", "e", "n", " ", " ", "T", "H", "A", "T", " ", " ", "H", "o", "t", "l", "i", "n", "e", " ", "B", "l", "i", "n", "g"]
=end

# change string to array
# -mutate the arr
# if char is a space, shift it and add to the result str

# -else process the word:
# -process word
# -find index of first space
# -remove destructively until that index space(excluding)
# -store removed slice in temp
# -swapcase and prepend to result str
# move on to the next character in the mutated array

def process_word(arr_of_chars)
  arr_of_chars.join.swapcase
end

arr_of_chars = %w(e x a m p l e)
# p arr_of_chars
# p process_word(arr_of_chars)

def string_transformer(str)
  arr = str.chars
  return_str = ''

  until arr == []
    counter = 0
    if arr[counter] == ' '
      return_str.prepend(arr[counter])
      arr.shift
    else
      count_of_spaces = arr.count(" ")
        if count_of_spaces > 0
          index_of_space = arr.index(" ")
        else
          index_of_space = arr.index(arr[-1]) + 1
        end
        word = arr.shift(index_of_space)
        processed_word = process_word(word)
        return_str.prepend(processed_word)
    end
  end

  return_str
end
p string_transformer("Example Input") == "iNPUT eXAMPLE"
p string_transformer(" Example Input ") == " iNPUT eXAMPLE "

p string_transformer("You Know When  THAT  Hotline Bling") == "bLING hOTLINE  that  wHEN kNOW yOU"

# p string_transformer(" Example Input ") #== "  iNPUT eXAMPLE  " # this is returning false but by leading/trailing spaces
# they mean 1 leading or 1 trailing because my code is passing codewars

puts

puts

p string_transformer("Example Input") == "iNPUT eXAMPLE"
p string_transformer(" Example Input ") == " iNPUT eXAMPLE "
p string_transformer("You Know When  THAT  Hotline Bling") == "bLING hOTLINE  that  wHEN kNOW yOU"

puts
# solutions  that I liked (from Codewars)
def get_spaces(str)
  str = str.reverse # such a great idea!!!
  spaces = []
  str.each_char.with_index { |chr, idx| spaces << idx if chr == ' ' } # get index if spaces
  spaces
end

def add_spaces(spaces, str)
  spaces.each do |idx| # iterate over spaces and insert them into the string, insert numbers (that signify indices for spaces) into the string
    str.insert(idx, ' ')
  end
  str
end

def upcase_downcase(str)
  str = str.split.reverse
  str.map! do |word|
    word.chars.map do |chr|
      downcase = (chr == chr.upcase)
      downcase ? chr.downcase : chr.upcase
    end.join
  end.join
end

def string_transformer(str)
  spaces = get_spaces(str)
  str = upcase_downcase(str)
  add_spaces(spaces, str)
end

p string_transformer("Example Input") == "iNPUT eXAMPLE"
p string_transformer(" Example Input ") == " iNPUT eXAMPLE "
p string_transformer("You Know When  THAT  Hotline Bling") == "bLING hOTLINE  that  wHEN kNOW yOU"

puts
def string_transformer(str)
  str.split(/\b/).reverse.join.swapcase
end
p string_transformer("Example Input") == "iNPUT eXAMPLE"
p string_transformer(" Example Input ") == " iNPUT eXAMPLE "
p string_transformer("You Know When  THAT  Hotline Bling") == "bLING hOTLINE  that  wHEN kNOW yOU"

