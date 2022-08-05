=begin
ddaaiillyy ddoouubbllee
Write a method that takes a string argument and returns a new string that
contains the value of the original string with all consecutive duplicate
characters collapsed into a single character. You may not use String#squeeze or String#squeeze!.

PEDAC
Problem:
-write a method that takes a string and returns a new string
-the new string has all the consecutive dupplicate characters collapsed into a single character

Examples:
crunch('ddaaiillyy ddoouubbllee') == 'daily double'
crunch('4444abcabccba') == '4abcabcba'
crunch('ggggggggggggggg') == 'g'
crunch('a') == 'a'
crunch('') == ''

Data Structures
input: string
output: new string

Algorithm
-initialize result variable to an empty array
-split the string and look at every character in turn
-add characters to the new string in turn but while adding, if the character you
 are about to add is same as the previous character you've added, skip it and
 go to the next character
-once finished iterating over the argument, join the result string and return it

Code
=end

def crunch(str)
  result = []
  str.split("") do |char|
    result << char unless result.last == char
  end
  result.join
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''
