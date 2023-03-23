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


common_prefix(['flower', 'flow', 'flight']) == 'fl'
p common_prefix(['dog', 'racecar', 'car']) == ''
p common_prefix(['interspecies', 'interstellar', 'interstate']) == 'inters'
p common_prefix(['throne', 'dungeon']) == ''
p common_prefix(['throne', 'throne']) == 'throne'
