# Given a word, create a hash which stores the indexes of each letter in an array.
# Make sure the letters are the keys.
# Make sure the letters are symbols.
# Make sure the indexes are stored in an array and those arrays are values.
#
# p map_letters("froggy") == { :f => [0], :r=>[1], :o=>[2], :g=>[3, 4], :y=>[5] }
# p map_letters("dodo") == { :d=>[0, 2], :o=>[1, 3] }
# p map_letters("grapes") == { :g=>[0], :r=>[1], :a=>[2], :p=>[3], :e=>[4], :s=>[5] }
#
# P:
# - write a method that creates a hash
# - input is a string
# - hash stores the indices of letters
# - letters are the keys, keys are symbols
# - values are indices of letters and they are stored in an array
#
# Examples:
# p map_letters("froggy") == { :f => [0], :r=>[1], :o=>[2], :g=>[3, 4], :y=>[5] }
# => f is a symbol and is a key, it has one index only, in the array
# => r is a symbol and is a key, it occurs only once
#
# p map_letters("dodo") == { :d=>[0, 2], :o=>[1, 3] }
# p map_letters("grapes") == { :g=>[0], :r=>[1], :a=>[2], :p=>[3], :e=>[4], :s=>[5] }
#
# A:
# - change str to an array
# - initialize a hash_result
# - iterate over the array with index and save each letter as a key-symbol if it doesn't exit
#   if it exists, add the letter's INDEX, but the value is an array to which we need
#   to add index/indices of the letter
#
# ALGORTHIM
# =========
#   + create an Array of all individual characters from input String
# + create an empty tally Hash
# + iterate over each character with index
# + create a symbol - current character converted
# + check if current character exists within tally Hash as a symbol
# + if it does, add its index position to the Array (value of entry)
# + if not, create a new entry where current character as symbol is the key, value is new Array with current index position
# + return tally Hash
#

def map_letters(str)
  characters = str.chars
  tally = {}

  characters.each_with_index do |char, i|
    sym = char.to_sym
    # p sym
    if tally.keys.include?(sym)
      tally[sym] << i
    else
      tally[sym] = [i]
    end
  end

  tally
end

p map_letters('froggy') == { r: [1], o: [2], g: [3, 4], y: [5], f: [0] }
p map_letters('dodo') == { d: [0, 2], o: [1, 3] }
p map_letters('grapes') == { g: [0], r: [1], a: [2], p: [3], e: [4], s: [5] }
