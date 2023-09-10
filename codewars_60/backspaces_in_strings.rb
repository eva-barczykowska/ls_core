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