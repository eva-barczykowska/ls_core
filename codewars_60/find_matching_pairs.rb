#  Given a sentence, find all pairs of words whose first letter matches the last letter of its pair. Return an empty array if thereâ€™s no such pair.
# Only consider words that have at least length of 2 for the pairings.
#
# P:
# -method takes a str
# -method returns nested array where
# -each inner array contains a pair where 1st letter of 1st word == last letter of last word
# -only words of size 2 and more are considered
#
# -return empty [] of no such pair can be found
#
# Examples
# puts find_matching_pairs("The cat in the hat").inspect # [["The", "cat"], ["The", "hat"], ["the", "hat"]]
# =>"The cat in the hat"
#
# puts find_matching_pairs("A man a plan a canal Panama").inspect # []
# =>
# puts find_matching_pairs("This sentence has no pairs").inspect # [["sentence", "has"], ["sentence", "pairs"]]
#
# puts find_matching_pairs("Apple leads to leap").inspect # []
#
# DS:
# input: a str
# output: nested array
#
# A:
# -split on space
#
# -reject words that are of size < 2
#
# -INIT `all pairs`
# -create a subarray with all possible combinations of 2 (I need pairs)
# --start with 1st words and continue until the penulatimate word - start block - starting index
# ---start with starting index and continue until the penulatimate word - finish - finishing index
# ---save pairs to `all pairs`
#
# -SELECT & RETURN from `all pairs`, the pairs whose first character of 1st word(downcased) is equal to the last character of last word
#
# -ACCOUNT for no pairs
#
# Notes:
# s[0] == s2[-1]
def find_matching_pairs(str)
  array = str.split.reject { |word| word.size < 2 }

  all_pairs = []
  # array.combination(2).to_a
  (0...array.size).each do |starting_index|
    (starting_index + 1...array.size).each do |finishing_index|
      all_pairs <<  [array[starting_index], array[finishing_index]]
    end
  end

  all_pairs.select { |pair| pair[0][0].downcase == pair[1][-1] }
end

puts find_matching_pairs('The cat in the hat').inspect # [["The", "cat"], ["The", "hat"], ["the", "hat"]]
puts find_matching_pairs('A man a plan a canal Panama').inspect # []
puts find_matching_pairs('This sentence has no pairs').inspect # [["sentence", "has"], ["sentence", "pairs"]]
puts find_matching_pairs('Apple leads to leap').inspect # []
