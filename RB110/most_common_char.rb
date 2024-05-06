# Problem 5
# Create a method that takes a string argument and returns the character that occurs most often in the string. If there are multiple characters with the same greatest frequency, return the one that appears first in the string. When counting characters, consider uppercase and lowercase versions to be the same.
#
# p most_common_char('Hello World') == 'l'
# p most_common_char('Mississippi') == 'i'
# p most_common_char('Happy birthday!') == 'h'
# p most_common_char('aaaaaAAAA') == 'a'
#
# my_str = 'Peter Piper picked a peck of pickled peppers.'
# p most_common_char(my_str) == 'p'
#
# my_str = 'Peter Piper repicked a peck of repickled peppers. He did!'
# p most_common_char(my_str) == 'e'
#
# Problem
# ========
# -method takes a str as an argument
# -method returns the character that appears in the str most often
# -if there are multiple characters with the same frequency of occurences, return the one that appears first in the string
# -case doesn't matter
#
# Examples
# ========
# p most_common_char('Hello World') == 'l'
# => l occurs twice
#
# p most_common_char('Mississippi') == 'i'
# =>i and s occur the same amount of times but i appears first
#
# p most_common_char('Happy birthday!') == 'h'
# => h occurs twice (case doesn't matter)
#
# p most_common_char('aaaaaAAAA') == 'a'
# => no other chars
#
# my_str = 'Peter Piper picked a peck of pickled peppers.'
# p most_common_char(my_str) == 'p'
# => p occurs most
#
# my_str = 'Peter Piper repicked a peck of repickled peppers. He did!'
# p most_common_char(my_str) == 'e'
#
# Algorithm
# =========
# -INIT `most_occuring` to {}
# -DOWNCASE the str
#
# -TRANSFORM to `array`
#
# -ITERATE with index
# -STORE uniq chars from the str as keys and counts as values
#
# -REJECT all values except the max values from the `most_occurring` hash
# -ITERATE over the `array`
# --if you encounter a char that is a key in the `most_occuring`, return (that key)
def most_common_char(str)
  most_occurring = {}
  arr = str.downcase.chars

  arr.uniq.each_with_index do |char, _index|
    most_occurring[char] = arr.count(char)
  end

  most_occurring.select! { |_char, count| count == most_occurring.values.max }

  arr.each do |char|
    return char if most_occurring.keys.any? { |key| key == char }
  end
end
p most_common_char('Hello World') == 'l'
p most_common_char('Mississippi') == 'i'
p most_common_char('Happy birthday!') == 'h'
p most_common_char('aaaaaAAAA') == 'a'

my_str = 'Peter Piper picked a peck of pickled peppers.'
p most_common_char(my_str) == 'p'

my_str = 'Peter Piper repicked a peck of repickled peppers. He did!'
p most_common_char(my_str) == 'e'
