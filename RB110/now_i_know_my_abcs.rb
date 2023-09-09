# Now I Know My ABCs
# A collection of spelling blocks has two letters per block, as shown in this list:

# Copy Code
# B:O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M
# This limits the words you can spell with the blocks to just those words that do not use both letters from
# any given block. Each letter in each block can only be used once.

# Write a method that returns true if the word passed in as an argument can be spelled from this set of blocks,
# false otherwise.

# Examples:
# block_word?('BATCH') == true
# block_word?('BUTCH') == false
# block_word?('jest') == true
#
# P:
# -write a method that takes a str as an arg
# -this str can contain only 1 of the letters from each block (but not both)
# -method returns true or false
# -lowercase or uppercase letters
#
# E:
# block_word?('BATCH') == true
# B:O , N:A, G:T, C:P, H:U
# block_word?('BUTCH') == false
# => becase it contains both letters H:U
# block_word?('jest') == true

# DS:
# input: str
# output: true/false

# A:
# REFERENCE = [['B', 'O'], ['X', 'K'], ['D', 'Q'], ['C', 'P'], ['N', 'A'],
#              ['G', 'T'], ['R', 'E'], ['F', 'S'], ['J', 'W'], ['H', 'U'],
#              ['V', 'I'],  ['L', 'Y'], ['Z', 'M']]
# -store reference letters in a nested array
# -split the string argument
# -verify if any of the nexted array letters are BOTH included in the word that I am currently iterating over
# -if yes, return false
# -if not, return true
# reference = [['B', 'O'], ['X', 'K'], ['D', 'Q'], ['C', 'P'], ['N', 'A'],
#  ['G', 'T'], ['R', 'E'], ['F', 'S'], ['J', 'W'], ['H', 'U'],
#   ['V', 'I'],  ['L', 'Y'], ['Z', 'M']]

# p reference
# reference.any? { |s| s.all? { |ch| arg.chars.include?(ch)}}

# B:O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M

REFERENCE = [['B', 'O'], ['X', 'K'], ['D', 'Q'], ['C', 'P'], ['N', 'A'],
             ['G', 'T'], ['R', 'E'], ['F', 'S'], ['J', 'W'], ['H', 'U'],
             ['V', 'I'],  ['L', 'Y'], ['Z', 'M']]

def block_word?(word)
  word = word.upcase
  return false if REFERENCE.any? { |s| s.all? { |ch| word.chars.include?(ch) } }
  true
end
p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true

puts

REFERENCE = "B:O   X:K   D:Q   C:P   N:A
 G:T   R:E   F:S   J:W   H:U
 V:I   L:Y   Z:M"

def block_word?(str)
  substrings = REFERENCE.split.map { |block| block.delete(":") }
  substrings.flatten! #gives us ["BO", "XK", "DQ", "CP", "NA", "GT", "RE", "FS", "JW", "HU", "VI", "LY", "ZM"]
  # p substrings
  # substrings.each{ |substring| p str.count(substring) }
  substrings.none? { |substring| str.count(substring) >= 2 }
end


p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true



