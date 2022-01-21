# Write a method that takes a single String argument and returns a new string
# that contains the original value of the argument with the first character of
# every word capitalized and all other letters lowercase.
#
# You may assume that words are any sequence of non-blank characters.
#
# Explicit requirement:
# Given a single string, return a new string containing original value of the
# with the 1st word capitalized, all other letters are lowercase
# Data structure
# input: string
# output: string
# algorithm:
# -get an array
# -capitalize every element of the array
# do NOT write which methods you intend to use, this avoids tunnel vision

def word_cap(str)
  result = []
  array = str.split(" ")
  p array
  array.each do |word|
    result << word.capitalize
  end
  result.join(" ")
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

# ls solution:
def word_cap(words)
  words_array = words.split.map do |word|
    word.capitalize
  end
  words_array.join(' ')
end

# and also this:

def word_cap(words)
  words.split.map(&:capitalize).join(' ')
end

# Further Exploration
# Ruby conveniently provides the String#capitalize method to capitalize strings.
# Without that method, how would you solve this problem? Try to come up with at
# least two solutions.
puts ""
p "This is further exploration:"

def word_cap(words)
  result = []
  words.split(" ").each do |word|
    result << word[0].upcase + word[1..-1].downcase
  end
  result.join(" ")
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

puts ""

def word_cap(str)
  str.split(' ').map { |word| word[0].upcase + word[1..-1].downcase }.join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

def word_cap(words)
  result = words.split.map do |word|
    word.downcase!
    word[0] = word[0].upcase
    word
  end
  p result.join(" ")
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

def word_cap(words)
  result = words.split.map do |word|
    word.downcase.sub!(word[0], word[0].upcase)
  end
  result.join(" ")
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

def word_cap(words)
  words.split.map do |word|
    word.downcase.chars.map do |char|
      word.index(char) == 0 ? char.upcase : char
    end.join('')
  end.join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
