# =begin
# Write a method to find the longest common prefix string amongst an array of strings
# If no common prefix, return empty string.
#
# All given inputs are in lowercase letters a-z.
# PEDAC TEMPLATE
#
# ************** Problem **************
# get the longest prefix and return it
# -if there is no prefix, return an empty string - deal with it first
#
# Questions:
#   ************** Examples **************
# p common_prefix([flower, flow, flight]) == 'fl'
# **f fl > longest one is fl so fl returned
#
# p common_prefix([dog, racecar, car])) == ''
# **no common prefix, so ''returned
#
# p common_prefix(%w([interspecies, interstellar, interstate]) == 'inters'
#
# p common_prefix(%w(throne dungeon)) == ''
#
# p common_prefix(%w(throne throne)) == 'throne'

# ************** Data Structures **************
# input: array
# output: empty string or prefix like 'fl'
# ************** Algorithm **************
# -initialize counter to reference integer 0
# -initialize res array
# -use counter as a condition for the loop
# -so when counter is less than the size of the fist word on the array (while condition)
# -analyze all (hint hint) characters at the counter (i.e. an element at a given counter in every word)
# -if they are same, i.e. if every word has the same letter at a given index
# -add this letter to the res array
# -increase the counter so that you can check the in the same manner next character
# -end the loop when the counter is same as the first words's size (the first word from the argument array)
# return joined result
# ************** Code **************
def common_prefix(array)
  counter = 0
  res = []
  while counter < array.first.chars.size
    if array.all? { |word| word[counter] == array.first.chars[counter] }
      res << array.first.chars[counter]
    end
    counter += 1
  end
  res.join
end

p common_prefix(['flower', 'flow', 'flight']) == 'fl'
p common_prefix(['dog', 'racecar', 'car']) == ''
p common_prefix(['interspecies', 'interstellar', 'interstate']) == 'inters'
p common_prefix(['throne', 'dungeon']) == ''
p common_prefix(['throne', 'throne']) == 'throne'

puts
# Kim's solution according to my algorithm

def common_prefix(array)
  counter = 0
  result_array = []
  while counter < array[0].size
    if array.all? {|word| word[counter] == array[0][counter]}
      result_array << array[0][counter]
    end
    counter += 1
  end
  result_array.join
end

p common_prefix(['flower', 'flow', 'flight']) == 'fl'
p common_prefix(['dog', 'racecar', 'car']) == ''
p common_prefix(['interspecies', 'interstellar', 'interstate']) == 'inters'
p common_prefix(['throne', 'dungeon']) == ''
p common_prefix(['throne', 'throne']) == 'throne'

puts
# solving with Kim's algorithm
# Overall approach:  given an array of strings >  initialize `start_word` to the first word in the given array.
# This will be the word that is the comparison standard
# iterate over the array of words using map
# nested iteration/iterate over each char of the word plus their index,
# and each time select the char that equals the char at the same index position in `start_word`.
# The result of these 2 iterations should be saved to `selected_chars`.
# `selected chars` will return an array of sub-arrays, e.g.
# [["f", "l", "o", "w", "e", "r"], ["f", "l", "o", "w"], ["f", "l"]]
# iterate over the sub-arrays/selected chars for each word and return the shortest one because
# the shortest sub-array will be the one that is common for all words
# return value of the method is the shortest one converted to a string

def common_prefix(array)
  start_word = array.first
  selected_chars = array.map do |word| # map returns an array of the same size but what will be the elements of this returned array? Depends what is the return value of the blcok
    word.chars.select.each_with_index do |char, index| # nice way to work with characters and select only those which appear in every word at the same index like in the first word
      char == start_word[index] # the character in the word that we are currently looking at is same as the character at the same index in the first word
      end
  end
  selected_chars.min_by { |subarr| subarr.length }.join
  end

p common_prefix(['flower', 'flow', 'flight']) == 'fl'
p common_prefix(['dog', 'racecar', 'car']) == ''
p common_prefix(['interspecies', 'interstellar', 'interstate']) == 'inters'
p common_prefix(['throne', 'dungeon']) == ''
p common_prefix(['throne', 'throne']) == 'throne'