# Write a function that takes a single string (word) as argument.
#   The function must return an ordered list containing the indexes of all capital letters in the string.
#
#   "CodEWaRs" --> [0,3,4,6]

# -initialize capital letters alphabet
# -initialize indices array
# -convert str to array
# -iterate over array characters and if a given character belongs to the capital letters alphabet, add its
#  index to the indices array
# -return indices array
ALPHABET = ("A".."Z").to_a
def capitals(word)
  indices = []
  array_of_characters = word.chars

  array_of_characters.each.with_index { |char, index| indices << index if ALPHABET.include?(char) }

indices
end

p capitals('CodEWaRs') == [0,3,4,6]
p capitals('') == []
p capitals('aAbB') == [1, 3]
p capitals('4ysdf4') == []
p capitals('ABCDEF') == [0, 1, 2, 3, 4, 5]

puts
def capitals(word)
  (0...word.length).select.with_index{|i| word[i] =~ /[A-Z]/}
end
p capitals('CodEWaRs') == [0,3,4,6]
p capitals('') == []
p capitals('aAbB') == [1, 3]
p capitals('4ysdf4') == []
p capitals('ABCDEF') == [0, 1, 2, 3, 4, 5]

puts
def capitals(word)
  word.chars.each_index.select { |i| word[i] =~ /[A-Z]/ }
end
p capitals('CodEWaRs') == [0,3,4,6]
p capitals('') == []
p capitals('aAbB') == [1, 3]
p capitals('4ysdf4') == []
p capitals('ABCDEF') == [0, 1, 2, 3, 4, 5]