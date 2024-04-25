# Write a function called longestConsecutiveAscendingWords that
# takes a sentence as input and finds all consecutive word where the succeeding
# word is longer than the previous. The function should return an array of
# these pairs. Punctuation marks should be considered part of a word
# (e.g., "hello," and "hello" are different words).
#
# Problem
# ========
# -method takes a string
# -methos finds and returns all consecutive words where the succeeding word is longer than the previous
# -punctuation is part of a word
#
# Test cases
# =============
#
# puts longest_consecutive_ascending_words("The quick brown fox jumps over the lazy dog").inspect # [ 'The', 'quick' ]
# => second word is longer than the first one, I need pairs
# => The quick => [ 'The', 'quick' ]
# ++++++ possible pairs +++++
# The quick
# fox jumps -equal lenth as the last previous one, why does the first one get returned?
# the lazy
#
# puts longest_consecutive_ascending_words("A journey of a thousand miles begins with a single step").inspect # [ 'A', 'journey' ]
# => 'A' coz there was nothing before and 'journey' => [ 'A', 'journey' ]
# ++++++ possible pairs +++++
# A journey
# a thousand
# a single
#
# puts longest_consecutive_ascending_words("Easy come easy go").inspect # [ 'Easy' ]
# => it's only Easy coz it's longest
# ++++++ possible pairs +++++
# why?????
#
# puts longest_consecutive_ascending_words("Tiny bird flew over the peaceful countryside").inspect # [ 'the', 'peaceful', 'countryside' ]
# => makes sense
# ++++++ possible pairs +++++
# the peaceful countryside
#
#
# **** it's very important to understand the problem to save time ****
# **** take your time to ultimately save time *****
#
# Algorithm
# =========
# -TRANSF str to arr
# INIT result
# ITERATE over words to collect sequences
# -if word at this index is longer than the previous one, add both to `sequence` array
# -else if it is not, just add sequence to result if result is nil or if seuence's size is longer than result.size
#
# -return result but maybe will have to account
def longest_consecutive_ascending_words(str); end

puts longest_consecutive_ascending_words('The quick brown fox jumps over the lazy dog').inspect # [ 'The', 'quick' ]
puts longest_consecutive_ascending_words('A journey of a thousand miles begins with a single step').inspect # [ 'A', 'journey' ]
puts longest_consecutive_ascending_words('Easy come easy go').inspect # [ 'Easy' ]
puts longest_consecutive_ascending_words('Tiny bird flew over the peaceful countryside').inspect # [ 'the', 'peaceful', 'countryside' ]
