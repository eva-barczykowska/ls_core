# Write a method that takes a non-empty string argument, and returns the middle
# character or characters of the argument.
# If the argument has an odd length, you should return exactly one character.
# If the argument has an even length, you should return exactly two characters.
#
# Explicit requirments:
# a method, takes a string, returns middle character/characters of the argument
#
# Data Structure:
# Input: string
# Output: string
#
# Algorithm:
# check if string is odd or even
# if it is odd, eg 9, then I will have 4-1-4 - character 5 will be returned,
# index 4 if it is even,eg 8, then I will have 3-1-1-3 --- characters 4,5 will
# be returned, index 3, 4 if the str is even, divide it in half and take
# 1 character from left and 1 from right
# if the str is odd, get the integer and divide it into 2
# if the size is 6, I'm taking 0 to half -1(first array)
# half of the size until the end(that's my 2nd array)

def center_of(str)
  half = str.size / 2
  result = []
  if str.size.even?
    first = str[0..half - 1].chars
    second = str[half..-1].chars
    result.push(first.last).push(second.first)
    result.join
  else
    first = str[0..half].chars
    result.push(first.last).join
  end
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'
puts

# ls solution

def center_of(string)
  center_index = string.size / 2
  if string.size.odd?
    string[center_index]
  else
    string[center_index - 1, 2]
  end
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'

# Explanation:
# This is mildly tricky, but not terribly so. The main difficulty here is
# understanding the difference between the index number and the character number.
# Take the string in the first test for example: "I love ruby". The third
# character is "l", however, the third index is "o". This is because, when
# counting characters, you start at 1, but when counting indexes, you start at
# 0.
#
# The first step is to determine the index of the centermost character in the
# string. This is easy for odd-length strings: the center point of a 5 character
# string, for instance, is the 3rd character, or index 2. For even-length strings,
# things are slightly more complicated: we need the index of two characters,
# the character to the left of the centerpoint, and the character to the right.
# For a 4 character string, these are the 2nd and 3rd characters, or
# indexes 1 and 2.
#
# In both cases, we can divide the string length by 2 to get either the index
# we want (5 / 2 == 2 for our 5 character string), or the index of the character
# just to the right of center (4 /2 == 2 for our 4 character string).
# All that remains after determining these values is to extract the appropriate
# character(s) from the string. For odd-lengthed strings, we just get
# the middlemost character, and for even-lengthed strings, we get the character
# at the indicated index, and the character just prior to it; we use the
# substring-ing form of
# the String#[] method to extract 2 characters at center_index - 1.

# solution I liked:

def center_of(str)
  center_idx = str.length / 2
  str.length.even? ? str[center_idx - 1, 2] : str[center_idx]
end
