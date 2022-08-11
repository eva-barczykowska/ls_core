=begin
Double Char (Part 1)
Write a method that takes a string, and returns a new string in which every character is doubled.

PEDAC
Problem
-write a method that takes a string
-the method returns a NEW STRING, in which every character is doubled

Examples
repeater('Hello') == "HHeelllloo"
repeater("Good job!") == "GGoooodd  jjoobb!!"
repeater('') == ''

Data Structures
input: string
output: NEW STRING

Algorithm
-split the string into an array of characters
-iterate over the array and double each character
-join the array in order to return a string

Code
=end

def repeater(str)
  str.split("").map!{ |letter| letter * 2 }.join("")
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''

puts ""

# ls solution
=begin
Algorithm
initialize the result variable and point it to an empty string
have a look at every character and add it twice to the result string
return the result string
=end

def repeater(string)
  result = ''
  string.each_char do |char|
    result << char << char
  end
  result
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''

puts ""

#an example of using the method #with_object
def repeater(str)
  str.each_char.with_object("") {|chr, double| double << chr * 2}
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''

puts ""

def repeater(str)
  str.gsub(/(.)/, '\1\1' )
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''
