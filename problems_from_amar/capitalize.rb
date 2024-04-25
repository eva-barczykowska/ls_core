#
# Implement a function, capitalize, that capitalizes all words in a sentence.
# However, only capitalize if the word is followed by a word starting with a vowel
# (for Ruby don’t use capitalize).
# P:
# -method returns str argument with all* words capitalized
# -all words followed by a word starting with a vowel
#
# E
#  Test cases
# puts capitalize("hello apple world") # "Hello apple world"
# puts capitalize("this is an umbrella") # "This Is An umbrella"
# puts capitalize("every vowel starts an echo") # "every vowel Starts An echo"
# puts capitalize("under the oak tree") # "under The oak tree"
# puts capitalize("a quick brown fox") # "a quick brown fox
#
# A:
# -get indices of words starting with a vowel, store in `target_indices`
#
# -transform str to arr
#
# -ITERATE over the arr with index and if index is mentioned in `target_indices`, then capitalize the first letter/letter at index 0, add index - 1
# - JOIN on space and return the string
#
# PLAN B
# -could also potentially map the array
VOWELS = %w[a e o u i]

def capitalize(str)
  arr = str.split
  target_indices = []

  arr.each.with_index do |word, index|
    target_indices << index - 1 if VOWELS.include?(word[0])
  end

  arr.each.with_index do |word, index|
    word[0] = word[0].upcase if target_indices.include?(index)
    # word[0].upcase! if target_indices.include?(index)  #why does this not work?
    # check word[0].object_id a few times, it's a DIFFERENT object each time
    # we need to use string element assignment
  end

  arr.join(' ')
end
puts capitalize('hello apple world') == 'Hello apple world'
puts capitalize('this is an umbrella') == 'This Is An umbrella'
puts capitalize('every vowel starts an echo') == 'every vowel Starts An echo'
puts capitalize('under the oak tree') == 'under The oak tree'
puts capitalize('a quick brown fox') == 'a quick brown fox'
