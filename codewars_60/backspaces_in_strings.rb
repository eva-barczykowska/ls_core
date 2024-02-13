=begin
 Assume "#" is like a backspace in string. This means that string "a#bc#d" actually is "bd"
Your task is to process a string with "#" symbols.

Examples
"abc#d##c" ==> "ac"
"abc##d######" ==> ""
"#######" ==> ""
"" ==> ""

p clean_string('abc#d##c') == "ac"
p clean_string('abc####d##c#') == ""

P:
-write a method that takes a str with #s as an arg
-the method returns str without hashes
-every char after the hash has to be deleted
-if I have more #s than letters, return an empty str
-if there are only #s, return an empty str


Examples
"abc#d##c" ==> "ac"
"abc##d######" ==> ""
"#######" ==> ""
"" ==> ""

p clean_string('abc#d##c') == "ac"
p clean_string('abc####d##c#') == ""

P:
-write a method that takes a str with #s as an arg
-the method returns str without hashes and the letters that procede each hash
-what procedes each hash can change in the course of deletion
-every char before the hash has to be deleted

E:
"abc#d##c" == "ac"
-c, d, b get removed in turn, ac is left

'abc####d##c#' == ""
all characters get cancelled by the presence of #, but also other #s are removed
=> we need to remove ALL the hashes

"#######" == ""
=>remove ALL hashes, return ""

"a#bc#d" == "bd"
=> remove a, c

Sedrick's breakup of the changes:
   abc#d##c
   ab(c#)d##c
   ab(d#)#c
   a(b#)c
   ac

A:
change str into an array
while the array contains #
  - get index of a hash
  - delete the hash at that index
  - delete the previous character as well

-join the array
-return it
=end

def clean_string(str)
  arr = str.chars

  while arr.include?('#')
    index_of_cross = arr.index('#')
    arr.delete_at(index_of_cross)
    arr.delete_at(index_of_cross - 1)
  end

  arr.join
end

p clean_string('abc####d##c#') == ""
p clean_string("#######") == ""
p clean_string("a#bc#d") == "bd"
p clean_string("abc#d##c") == "ac"

# Sedrick's solution
def clean_string(str)
  counter = 0
  return str.replace("") if str.count("#") == str.size

  while str.include?("#")
    if str[counter] == "#"
      str.slice!(counter-1..counter)
      counter = 0 # start from the beginning again, smart!
    end
    counter += 1
  end
  str
end

p clean_string("abc####d##c#") #== ""
p clean_string("a#bc#d") #== "bd"
p clean_string("abc#d##c")# == "ac"
p clean_string("#######")# == ""

# Ekerin's solution
# ALGORITHM
# =========
#   + create Array of characters from Input
# + create Array to capture new Characters
#
# + iterate over Characters Array
# + if current character is `#`,
#                           - remove last character in Array of New Characters
# - ** do not include in New Characters Array **
#                                         + otherwise,
#                                       - add current character to New Characters Array
#
# + build New String from New Characters Array
# + return New String
# =end
#
def clean_string(str)
  new_chars = []
  chars = str.chars

  chars.each do |char|
    if char == '#'
      new_chars.pop # and we can pop even an empty array! [].pop returns nil but we don't care about the return method
    else
      new_chars << char
    end
  end

  # new_chars

  new_str = new_chars.join
end

p clean_string('abc#d##c') == "ac"
p clean_string('abc####d##c#') == ""
p clean_string("#######") ==  ""
p clean_string("") ==  ""
p clean_string("123#456##abcde###f#") == "124ab"
p clean_string("shenanigans##not##so#fast####") == "shenanigans"