=begin
# Write a method that takes a string as an argument and returns
# the character that occurs least often in the given string.
# If there are multiple characters with the equal lowest number
# of occurrences, then return the one that appears first in the
# string. When counting characters, consider the uppercase and
# lowercase version to be the same.

PEDAC
P:
- write a method that takes a str as an arg
- method returns char that occurs LEAST OFTEN in the str
- if there are multiple chars which occur the least (same no of occurences)
- return the one that appears first in the str
- spaces are also characters
- case doesn't matter, downcase the str argument


# Examples:

p least_common_char("Hello World") #== "h"
=> h, lowercase h

p least_common_char("Peter Piper picked a peck of pickled peppers") #== "t"
=> t

p least_common_char("Mississippi") #== "m"
=> m, again, lowercase

p least_common_char("Happy birthday!") #== ' '
p least_common_char("aaaaaAAAA") #== 'a'

# The tests above should print "true".

DS:
input: str
middle: array, hash?
output: a single letter/ a str

N:
find_if

A:
- downcase the str
- convert str to arr of chars

- count all characters and store results in a hash `counts`

- find `least_occuring` char by finding the min value in the values

- return the key for that value
=end

def least_common_char(str)
  arr = str.downcase.chars

  counts = arr.tally

  least_occurring = counts.values.min

  counts.each do |letter, occurrence|
    return letter if occurrence == least_occurring
  end

end
p least_common_char("Hello World") == "h"
p least_common_char("Peter Piper picked a peck of pickled peppers") == "t"
p least_common_char("Mississippi") == "m"
p least_common_char("Happy birthday!") == ' '
p least_common_char("aaaaaAAAA") == 'a'
