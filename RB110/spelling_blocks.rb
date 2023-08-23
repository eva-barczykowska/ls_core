=begin
A collection of spelling blocks has two letters per block, as shown in this list:

B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

This limits the words you can spell with the blocks to just those words that do not use both letters from any given block. Each letter in each block can only be used once.

Write a method that returns true if the word passed in as an argument can be spelled from this set of blocks, false otherwise.

Examples:

block_word?('BATCH') == true
block_word?('BUTCH') == false
block_word?('jest') == true
=end
# P:
# -there is a collection a spelling blocks
# -we are creating words
# -we can use only 1 letter from a given block
# BAT
# KIM
# -write a method that takes a string
# -method returns true if string can be spelled with letters from any (but not both!)
# sides of the block
# -letters can be lowercase

# E:
# B:O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M
# block_word?('BATCH') == true
# =>if it has the first letter from any block, it cannot have the second (and it doesn't)
# has B, but not O
# has A but not N
# has T but not T
# has C but not P
# has H but not U
# block_word?('BUTCH') == false
# =>contains U AND H
# block_word?('jest') == true
# =>letters can be lowercase
# =>it returns true becasue the letters do not conflict, i.e. only the letter from the left
#   or right side of the pair is used

#   DS:
# input: str
# output: boolean, either true or false

# A:
# initialize `res`array
# -store the reference in a variable, a nested array of strings
# downcase the word argument
# -change it into an `array`
# iterate through the nested `clusters` array so through all subarrays
# -while iterating through a subarray I need to ask if all its chars are included in the `arr`
# -if yes, add true to the `res` array
# -if not, add false to rhe `res` array
#if the word has both characters from any subarray return false
# iterate over the `res` array and if any el is false, return false
# else return true

REFERENCE = [['a','o'], ['x','k'], ['d','q'], ['c','p'], ['n','a'], ['g','t'], ['r','e'], ['f','s'], ['j','w'], ['h','u'], ['v','i'], ['l','y'], ['z', 'm']]

def block_word?(str)
  res = []
  arr = str.downcase.chars

  REFERENCE.each do |cluster|
    if cluster.all? { |ch| arr.include?(ch) }
      res << false
    else
     res << true
    end
  end

 res.any? { |v| v == false } ? false : true
end

p block_word?('BATCH') #== true
p block_word?('BUTCH') #== false
p block_word?('jest') #== true

puts

puts "first coded incorrectly, returning too early from the method"
# def block_word?(str)
#   res = []
#   arr = str.downcase.chars
#   # p arr

#   REFERENCE.each do |cluster| #returning prematurely
#     if cluster.all? { |ch| arr.include?(ch) }
#       return false
#     else
#      return true
#     end
#   end
# end

# p block_word?('BATCH') #== true
# p block_word?('BUTCH') #== false
# p block_word?('jest') #== true

puts 'Ilke'

BLOCKS = [["B", "O"],["X", "K"], ["D", "Q"], ["C", "P"], ["N", "A"],
          ["G", "T"], ["R", "E"], ["F", "S"], ["J", "W"], ["H", "U"],
          ["V", "I"], ["L", "Y"], ["Z", "M"]]

def block_word?(string)
  blocks_used = []

  string.upcase.chars do |char|
    BLOCKS.each do |block|
      blocks_used << block if block.include?(char) #adding a block each time when any of the 2 letters are there
    end
  end

  # p blocks_used #blocks have been repeatedly added here each time a letter from a block was found in the string, so sometimes we'll have a block twice but this shouldn't be the case
  # p blocks_used.uniq #removing blocks are repeated
  blocks_used == blocks_used.uniq
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true





