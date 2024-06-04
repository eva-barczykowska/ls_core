# We're receiving a set of messages in code. The messages are sets of text strings, like:
# "alakwnwenvocxzZjsf"
# Write a method to decode these strings into numbers. The decoded number should be the number of lowercase characters between the first two uppercase characters. If there aren't two uppercase characters, the number should be 0.
#
# Problem
# ++++++++
# -method takes an array of strings
# -method decodes strings into numbers
# -the decoded number should be the number of lowercase characters between the first two uppercase characters
# -If there aren't two uppercase characters, the number should be 0.
#
# Examples
# ==========
# p decode(['ZoL', 'heLlo', 'XX']) == [1, 0, 0]
#             1       0      0
# p decode(['foUrsCoreAnd' , 'seven', '']) == [2, 0, 0]
#               2               0     0
# p decode(['lucYintheskyWith', 'dIaMonDs']) == [8, 1]
#                   8              1
# p decode([]) == []
# => empty [] returns []
#
# Test cases:
# p decode(['ZoL', 'heLlo', 'XX']) == [1, 0, 0]
# p decode(['foUrsCoreAnd', 'seven', '']) == [2, 0, 0]
# p decode(['lucYintheskyWith', 'dIaMonDs']) == [8, 1]
# p decode([]) == []
#
# process_word
# -is the word empty?
# -if yes, return 0
# -are there 2 uppercase chars?
# -if not, return 0
# otherwise ITERATE over the worc chars with index
# --if yes, get the index of the first and second uppercase char
# 'lucYintheskyWith'
# -   3.       12 => 12 - 3 - 1
# 'ZoL' 2-0-1 = 1
# [0, 2]
#
# main method
# -return [] if arg is empty
# -ITERATE over the array of strings and call process_word on each string
# -save the return value to `codes`
# RETURN `codes`
#
# Notes
# word.chars.each do |c|
# count += 1 if uppercase.include?(c)
# end
UPPERCASE = *('A'..'Z')
def process(word)
  return 0 if word.empty?

  count = 0
  word.chars.each do |c|
    count += 1 if UPPERCASE.include?(c)
  end
  return 0 if count < 2

  indices = []
  word.chars.each_with_index do |char, index|
    indices << index if UPPERCASE.include?(char)
  end

  indices[1] - indices[0] - 1
end

p process('') == 0
p process('Zooo') == 0
p process('foUrsCoreAnd') == 2

def decode(arr)
  return [] if arr.empty?

  codes = []
  arr.each do |word|
    codes << process(word)
  end

  codes
end
p decode(%w[ZoL heLlo XX]) == [1, 0, 0]
p decode(['foUrsCoreAnd', 'seven', '']) == [2, 0, 0]
p decode(%w[lucYintheskyWith dIaMonDs]) == [8, 1]
p decode([]) == []
# use map
# return clauses

puts

UPPERCASE = *('A'..'Z') # this does not need to be a separate constant
def process(word)
  return 0 if word.empty? # do I really need this or does my code cover this use case?

  count = 0
  word.chars.each do |c| # this iteration and the next one could be reduced to just 1 iteration
    count += 1 if UPPERCASE.include?(c) # # could do this with {} block
  end
  return 0 if count < 2

  indices = []
  word.chars.each_with_index do |char, index|
    indices << index if UPPERCASE.include?(char)
  end

  indices[1] - indices[0] - 1
end

p process('') == 0
p process('Zooo') == 0
p process('foUrsCoreAnd') == 2

def decode(arr)
  return [] if arr.empty? # do I really need this or does my code cover this use case?

  codes = []
  arr.each do |word|
    codes << process(word) # could do this with {} block
  end

  codes
end
p decode(%w[ZoL heLlo XX]) == [1, 0, 0]
p decode(['foUrsCoreAnd', 'seven', '']) == [2, 0, 0]
p decode(%w[lucYintheskyWith dIaMonDs]) == [8, 1]
p decode([]) == []

puts 'refactored'

def process(word)
  indices = [] # can I still make it shorter?

  word.chars.each_with_index { |char, index| indices << index if ('A'..'Z').include?(char) }

  return 0 if indices.size < 2

  indices[1] - indices[0] - 1
end
p process('') == 0
p process('Zooo') == 0
p process('foUrsCoreAnd') == 2

def decode(arr)
  codes = []
  arr.each { |word| codes << process(word) } # can I still make it shorter?
  codes
end
p decode(%w[ZoL heLlo XX]) == [1, 0, 0]
p decode(['foUrsCoreAnd', 'seven', '']) == [2, 0, 0]
p decode(%w[lucYintheskyWith dIaMonDs]) == [8, 1]
p decode([]) == []

puts

def process(word)
  indices = []

  word.chars.each_with_index { |char, index| indices << index if ('A'..'Z').include?(char) }
  return 0 if indices.size < 2

  indices[1] - indices[0] - 1
end
p process('') == 0
p process('Zooo') == 0
p process('foUrsCoreAnd') == 2

def decode(arr)
  arr.each_with_object([]) { |word, codes| codes << process(word) } # what's this? transformation!
end
p decode(%w[ZoL heLlo XX]) == [1, 0, 0]
p decode(['foUrsCoreAnd', 'seven', '']) == [2, 0, 0]
p decode(%w[lucYintheskyWith dIaMonDs]) == [8, 1]
p decode([]) == []

puts

def process(word)
  indices = []

  word.chars.each_with_index { |char, index| indices << index if ('A'..'Z').include?(char) }
  return 0 if indices.size < 2

  indices[1] - indices[0] - 1
end
p process('') == 0
p process('Zooo') == 0
p process('foUrsCoreAnd') == 2

def decode(arr)
  arr.map { |word| process(word) }
end
p decode(%w[ZoL heLlo XX]) == [1, 0, 0]
p decode(['foUrsCoreAnd', 'seven', '']) == [2, 0, 0]
p decode(%w[lucYintheskyWith dIaMonDs]) == [8, 1]
p decode([]) == []
