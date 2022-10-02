=begin

Swap Case
Write a method that takes a string as an argument and returns a new string
in which every uppercase letter is replaced by its lowercase version,
and every lowercase letter by its uppercase version.
All other characters should be unchanged.

You may not use String#swapcase; write your own version of this method.

swapcase('CamelCase') == 'cAMELcASE'
swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

PEDAC
Problem
-Given that I have a string, I need to swap case of every letter in it
-other, non-letter characters should be left unchanged
-I may not use the Ruby-inbuilt method #swapcase

Examples
swapcase('CamelCase') == 'cAMELcASE'
swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

Data structures
input: string
output: string

Algorithm
-I'm going to initialize a result string
-I am goint to look at every character and see if it is in the lowercase group
of alphabet letters
-if yes, I going to upcase the upcased version of it to the result string
-elsif I am going to see if it is in the uppercase group of alphabet letters
-if yes, I am gong to add the downcased version of it to the result string
-else, if it didn't belong to any of the above alphabet groups, it means it is
 a non-letter character and I am going to add it to the result string just as it is

Code
=end

def swapcase(str)
  res = []
  arr = str.chars
  arr.each do |char|
    if char.match(/[a-z]/)
      res << char.upcase
    elsif char.match(/[A-Z]/)
      res << char.downcase
    else
      res << char
    end
  end
    res.join
end

 p swapcase('CamelCase') == 'cAMELcASE'
 p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

puts

 # ls solution
 def swapcase(string)
  characters = string.chars.map do |char|
    if char =~ /[a-z]/ # if char is found in the [a-z] characters (lowercase alphabet)
      char.upcase
    elsif char =~ /[A-Z]/ # if char is found in the [A-Z] characters (uppercase alphabet)
      char.downcase
    else
      char
    end
  end
  characters.join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
