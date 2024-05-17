# Consider the word "abode". We can see that the letter a is in position 1 and b is in position 2. In the alphabet, a and b are also in positions 1 and 2. Notice also that d and e in abode occupy the positions they would occupy in the alphabet, which are positions 4 and 5.
#
# Given an array of words, return an array of the number of letters that occupy their positions in the alphabet for each word. For example,
#
# p symm(["abode","ABc","xyzD"]) == [4, 3, 1]
# p symm(["abide","ABc","xyz"]) == [4, 3, 0]
# p symm(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"]) == [6, 5, 7]
# p symm(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]
#
#
# Problem
# =======
# method takes an array of words and returns an array of numbers of the number of letters that occupy their positions in the alphabet
# -letters can be lower or uppercase
#
# Examples
# =========
# p symm(["abode","ABc","xyzD"]) == [4, 3, 1]
# 4=>a,b,d,e 3=>ABC 1=>D
#
# p symm(["abide","ABc","xyz"]) == [4, 3, 0]
# 4=>abde, 3=>abc, 0
# p symm(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"]) == [6, 5, 7]
# p symm(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]
#
# Notes
# ======
# I need to know the letters and their position in the alpahbet as a reference
# compare that reference to the string given in the array and count the ltters that are at the same positin(index)
#
# Algorithm
# =========
# CREATE a reference alphabet of lowercase letters
# ADD to the letters their indices, bind them together but indices should start at 1: 2=>, b=>2, etc.
# TRANSFORM array argument to lowercase strings
# ITERATE over the array of strings
# -for each string, iterate over its characters
# -init counter
# -iterate over the string characters with index but start with index 1
# -if the char at the current index is equal to the value corresponding to that char in my reference hash
# -then I can add 1 to counter
# # =
# def symm(arr)
#   letters = *('a'..'z')
#   indices = *(0..25)

#   reference_alphabet = indices.zip(letters).to_h
#   arr = arr.map { |str| str.downcase }

#   counts = []

#   arr.each do |str|
#     counter = 0
#     str.each_char.with_index do |_char, index|
#       counter += 1 if str[index] == reference_alphabet[index]
#     end
#     counts << counter
#   end

#   counts
# end
# p symm(%w[abode ABc xyzD]) == [4, 3, 1]
# p symm(%w[abide ABc xyz]) == [4, 3, 0]
# p symm(%w[IAMDEFANDJKL thedefgh xyzDEFghijabc]) == [6, 5, 7]
# p symm(%w[encode abc xyzD ABmD]) == [1, 3, 1, 3]

# could I count these letters in another way?

puts
