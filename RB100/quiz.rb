# Write a method that takes one argument, a sentence string, and returns an array of integers.
# The value of each integer in the array should be equal to the length of the word in the corresponding position in the sentence.
# For example, if the sentence was 'To be or not to be' the array of integers would be [2, 2, 2, 3, 2, 2].


#--1--
def string_lengths(sentence)
  strings = sentence.split

  strings.map { |chars| chars.length }
end

#--2--
# def string_lengths(sentence)
#   strings = sentence.split
#   lengths = []
#   strings.each do |string|
#     lengths << string.size
#     p lengths
#   end
# end
# the block returns original array!
# so it will return the split sentence
# if we want this method to return an array of integers, we should add (return lengths) on the line above end

#--3--
# def string_lengths(sentence)
#   words = sentence.split
#   word_lengths = []
#   counter = 0
#
#   while counter < words.size do
#     word_lengths << words[counter].length
#     counter += 1
#   end
#
#   word_lengths
# end

#--4--
# def string_lengths(sentence)
#   strings = sentence.split
#   lengths = []
#   counter = 1
#
#   until counter == strings.size do
#     word_length = strings[counter - 1].length
#     lengths.push(word_length)
#     counter += 1
#   end
#
#   lengths
# end
# this will not work, the integer for the last word will miss in the output
# the problem is that we are setting counter to 1 but in until we say strings.size
# but then the next line we minus 1 from counter in order to start counting strings from 0 (because it's an array)
# to fix this we need to change the counter variable to 0
# and line 44 should say word_length = strings[counter].length
sentence = "To be or not to be"
p string_lengths(sentence)
