# Write a method that takes a string, and returns a new string in which every character is doubled.

# Problem
# receive a string and double each character in it and return a new String

# data structures
# input String
# output String with doubled characters

# Test cases
# repeater('Hello') == "HHeelllloo"
# repeater("Good job!") == "GGoooodd jjoobb!!"
# repeater('') == ''

# Algorithm
# get String
# set variable to string characters = string_array
# set empty result string
# iterate through each character in string_array
# push the character * 2 into the new Array

# return array

# Code

def repeater(str)
  str_array = str.chars
  result = ''
  str_array.each do |char|
    result += char * 2
    end
  result
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''

def repeater(str)
str.chars.map { |char| char * 2 }.join("")
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''

#ls solution
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

# Other people's solution
def repeater(string)
  string.chars.map { |character| character * 2 }.join
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''
