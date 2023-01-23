def string_lengths(sentence)
  strings = sentence.split
  # p strings

  strings.map { |chars| chars.length }
end

p string_lengths('To be or not to be') == [2, 2, 2, 3, 2, 2]

puts

def string_lengths(sentence)
  strings = sentence.split
  lengths = []

  strings.each do |string|
    lengths << string.size
  end
end

p string_lengths('To be or not to be') == [2, 2, 2, 3, 2, 2]

puts

def string_lengths(sentence)
  words = sentence.split
  word_lengths = []
  counter = 0

  while counter < words.size do
    word_lengths << words[counter].length
    counter += 1
  end

  word_lengths
end

p string_lengths('To be or not to be') == [2, 2, 2, 3, 2, 2]

puts

def string_lengths(sentence)
  strings = sentence.split
  lengths = []
  counter = 1

  until counter == strings.size do
    word_length = strings[counter - 1].length
    lengths.push(word_length)
    counter += 1
  end

  lengths
end

p string_lengths('To be or not to be') #== [2, 2, 2, 3, 2, 2]
#                                 counter - 1, 2, 3, 4, 5 -- str.size is 6
# #                                 index - 0, 1, 2, 3, 4 -- and this is how the last element will never be counted