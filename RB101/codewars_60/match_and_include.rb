# https://learnbyexample.github.io/Ruby_Regexp/regexp-introduction.html
sentence = 'This is a sample string'
word = 'vlk'

# check if 'sentence' contains the given string argument
p sentence.include?('is') # => true
p sentence.include?('z') # => false

puts
# check if 'sentence' matches the pattern as described by the regexp argument
# p sentence.match?(/is/) # => true
# p sentence.match?(/z/) # => false
# p sentence.match?(/[^a-z]/) # => true coz of "T" if sentence == 'Thisisasamplestring'
# p sentence.match?(/[^A-Za-z]/) # => false if sentence == 'Thisisasamplestring'
p word.match?(/[^aeoui]/)
