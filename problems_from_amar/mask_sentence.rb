#  Write a function that masks proper nouns and numbers in a sentence.
# Use * to mask proper nouns and use # to mask numbers. You may assume that a
# sentence will not begin with a proper noun and will not end with a number
# or proper noun. Numbers can only be integers.
# P:
# -method replaces proper nouns with *
# -method replaces numbers with #
# -we need to have as many *** as we have letters in the proper noun
#
# -If a sentence starts with proper word or finishes with the Integer, the rules don't apply and the word doesn't need to be changed
#
#
# E:
# puts mask_sentence("They bought 5 apples from John yesterday.") == "They bought # apples from **** yesterday.""
#=>
# puts mask_sentence("Alice and Bob went to Paris in 2021 to have a vacation.") == "Alice and *** went to ***** in #### to have a vacation."
# =>Paris is the first word
#
# A:
# -INIT `new_str`
#
# -TRANSFORM str to array
# - ITERATE over the array
# --if the str I'm currently iterating over begins with capital letter and its index is different than 0
# --then check for its size
# --and append to `new_str` as many ** as it has letters, add space
# --if the str I'm currently iterating over, is if size 1, and converted to int and back to str is diff than 0,
#   && its index is diff than -1, then convert it to # and append to `new_str`, add space
# --else just add the str to `new_str` as it is, add space
#
# -
# Notes:
# "They bought 5 apples from John yesterday.".split
def mask_sentence(sentence)
  new_str = ''

  arr = sentence.split
  arr.each.with_index do |word, index|
    size = word.size
    new_str << if word.to_i != 0
                 '#' * size + ' '
               elsif word[0] == word[0].upcase && index != 0
                 '*' * size + ' '
               else
                 word + ' '
               end
  end

  new_str.chop
end
p mask_sentence('They bought 5 apples from John yesterday.') == 'They bought # apples from **** yesterday.'

p mask_sentence('Alice and Bob went to Paris in 2021 to have a vacation.') == 'Alice and *** went to ***** in #### to have a vacation.'

puts

# reverse order
def mask_sentence(sentence)
  new_str = ''

  arr = sentence.split
  arr.each.with_index do |word, index|
    size = word.size
    new_str << if word[0] == word[0].upcase && index != 0 # str[0] == str[0].upcase RETURNS TRUE for numbers
                 '*' * size + ' '
               elsif word.to_i != 0
                 '#' * size + ' '
               else
                 word + ' '
               end
  end

  new_str.chop
end
p mask_sentence('They bought 5 apples from John yesterday.') #== "They bought # apples from **** yesterday."

p mask_sentence('Alice and Bob went to Paris in 2021 to have a vacation.') == 'Alice and *** went to ***** in #### to have a vacation.'
