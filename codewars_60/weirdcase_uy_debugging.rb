=begin
53. WeIrD StRiNg CaSe
(https://www.codewars.com/kata/52b757663a95b11b3d00062d)
6 kyu
Write a function toWeirdCase (weirdcase in Ruby) that accepts a string, and returns the same string with all even
indexed characters in each word upper cased, and all odd indexed characters in each word lower cased. The indexing
just explained is zero based, so the zero-ith index is even, therefore that character should be upper cased.
The passed in string will only consist of alphabetical characters and spaces(' '). Spaces will only be present if there are
multiple words. Words will be separated by a single space(' ').
PEDAC:
P:
- write a method that a str as an arg
- str can have spaces if there multiple words
- one alphabetical characters

- method has to return THE SAME string
- characters and even indices get upcased
- characters at odd indices get lowercased

E:
p weirdcase( "String" ) == "StRiNg"
                            012345

p weirdcase( "Weird string case" ) == "WeIrD StRiNg CaSe"
=>                                     012345678910111213

"W e I r D - S t R i N   g  -  C  a  S  e"
 0 1 2 3 4 5 6 7 8 9 10  11 12 13 14 15 16
           s                s
DS:
input: str
output: MUTATED str

A:
- iterate through the string

- if the index is even, upcase the character
- else downcase the character
- if you see a space, start counting from the again from the next character

- FOR EVERY WORD START COUNTING FROM THE BEGINNING !!!
- question: how to mutate a string when it has spaces but I dont want to pay attention to spaces/
- so for every word we start the count from 0
- we iterate through weird, then there is the space
- when I see the space, I start counting from 0 BUT from the next character AFTER the space

- what happens at the transition?? how to make the index 0
=end

# undefined method `upcase' for nil:NilClass (NoMethodError)
# def weirdcase(str)
#   index_in_word = 0
#   index_in_sentence = 0
#
#   loop do
#     p "outer loop starts"
#     index_in_word = 0
#     p "index in word at the beginning of OUTER LOOP #{index_in_word}"
#     break if index_in_sentence >= str.size
#
#     loop do
#       p "inner loop"
#       p str[index_in_word]
#       str[index_in_sentence] = str[index_in_sentence].upcase if index_in_word.even?
#       str[index_in_sentence] = str[index_in_sentence].downcase if index_in_word.odd?
#       index_in_word += 1
#       index_in_sentence += 1 #what am I doing at the space?
#       # index_in_word = 0 && index_in_sentence += 1 if str[index_in_word] == " "
#       break if str[index_in_word] == " "
#     end
#
#     index_in_sentence += 1
#     p index_in_sentence
#     p index_in_word
#     p str[index_in_sentence]
#     p "Ewa was here"
#   end
#
#   str
# end
# p weirdcase( "String" ) #== "StRiNg"
# p weirdcase( "Weird string case" ) #== "WeIrD StRiNg CaSe"

# def weirdcase(str)
# word_counter = 0
# string_counter = 0
#
# loop do
#   break if word_counter >= str.size
#
#   str[word_counter] = str[word_counter].upcase if word_counter.even?
#   str[word_counter] = str[word_counter].downcase if word_counter.odd?
#   word_counter = 0 if str[word_counter.next] == " "
#   word_counter += 1
#
#   string_counter += 1
#
# end
#   str_array = str.split(" ")
#   str_array.each do |word|
#     word. do |index|
#       str[index] = str[index].upcase
#     end
#   end
# end

# p weirdcase( "String" ) #== "StRiNg"
# p weirdcase( "Weird string case" ) #== "WeIrD StRiNg CaSe"


puts "Uy"
# - ALGORITHM
# - transform given string into words
# - use `map` method with `" "` passed in as argument
# - transform each character of each words based on its index value
# - use `map` and `with_index` method to return transformed elements and indices
# - transform each word back to string
# - use `join` method to join characters then join words


def toWeirdCase(string)
  string.split(" ").map do |word|
    word.chars.map.with_index do |char, index|           # very nice!
      char = index.even? ? char.upcase : char.downcase
    end.join
  end.join(" ")
end

str = "Weird string case"
p str.object_id
p toWeirdCase(str)
#== "WeIrD StRiNg CaSe"
p str.object_id

puts

=begin
53. WeIrD StRiNg CaSe
(https://www.codewars.com/kata/52b757663a95b11b3d00062d)
6 kyu
Write a function toWeirdCase (weirdcase in Ruby) that accepts a string, and returns the same string with all even
indexed characters in each word upper cased, and all odd indexed characters in each word lower cased. The indexing
just explained is zero based, so the zero-ith index is even, therefore that character should be upper cased.
The passed in string will only consist of alphabetical characters and spaces(' '). Spaces will only be present if there are
multiple words. Words will be separated by a single space(' ').
PEDAC:
P:
- write a method that a str as an arg
- str can have spaces if there multiple words
- one alphabetical characters

- method has to return THE SAME string
- characters and even indices get upcased
- characters at odd indices get lowercased

E:
p weirdcase( "String" ) == "StRiNg"
                            012345

p weirdcase( "Weird string case" ) == "WeIrD StRiNg CaSe"
=>                                     012345678910111213

"W e I r D - S t R i N   g  -  C  a  S  e"
 0 1 2 3 4 5 6 7 8 9 10  11 12 13 14 15 16
           s                s
DS:
input: str
output: MUTATED str

A:
- iterate through the string

- if the index is even, upcase the character
- else downcase the character
- if you see a space, start counting from the again from the next character

- FOR EVERY WORD START COUNTING FROM THE BEGINNING !!!
- question: how to mutate a string when it has spaces but I dont want to pay attention to spaces/
- so for every word we start the count from 0
- we iterate through weird, then there is the space
- when I see the space, I start counting from 0 BUT from the next character AFTER the space

- what happens at the transition?? how to make the index 0

- asked good questions
- used p to debug at the outer loop and inner loop stage
=end

# "W e I r D - S t R i N   g  -  C  a  S  e"
#  0 1 2 3 4 5 6 7 8 9 10  11 12 13 14 15 16
#            s                s

# first
# def weirdcase(str)
#   index_in_sentence = 0

#   while str[index_in_sentence] != nil
#     index_in_sentence += 1 if str[index_in_sentence] == " "
#     index_in_word = 0


#     loop do
#       break if str[index_in_sentence] == " " || str[index_in_sentence] == nil

#     str[index_in_sentence] = str[index_in_sentence].upcase if index_in_word.even?
#     str[index_in_sentence] = str[index_in_sentence].downcase if index_in_word.odd?


#     index_in_word += 1
#     index_in_sentence += 1
#     end
#  end

#  str
# end
# p weirdcase( "String" ) #== "StRiNg"
# p weirdcase( "Weird string case" ) #== "WeIrD StRiNg CaSe"

#second - this doesn't work, nil error `[]=': no implicit conversion of nil into String (TypeError)
# def weirdcase(str)
#   index_in_sentence = 0
#
#   # while str[index_in_sentence] != nil
#   loop do #changed to loop method
#     index_in_sentence += 1 if str[index_in_sentence] == " " # this is how we skip the space
#     index_in_word = 0 #it will be reset at every start of the outer loop
#
#
#     loop do
#       break if str[index_in_sentence] == " " || str[index_in_sentence] == nil
#
#     str[index_in_sentence] = str[index_in_sentence].upcase if index_in_word.even?
#     str[index_in_sentence] = str[index_in_sentence].downcase if index_in_word.odd?
#     index_in_word += 1
#     index_in_sentence += 1 # we need to keep track of both index_in_word and index_in_sentence
#     end
#
#      break if str[index_in_sentence] == nil # we break when str if finished
#  end
#
#  str
# end
# p weirdcase( "String" ) #== "StRiNg"
# p weirdcase( "Weird string case" ) #== "WeIrD StRiNg CaSe"

# what about the !  not working??? that's because the destructive version of the method returns nil if there was
# no action done, i.e. the string wasn't downcased because it already WAS in lowercase
# def weirdcase(str) # use this example for a Medium article
#   index_in_sentence = 0
#
#   # while str[index_in_sentence] != nil
#   # does the non-destructive and destructive method work differently? OF COURSE!!! AHA MOMENT
#   loop do #changed to loop method
#     index_in_sentence += 1 if str[index_in_sentence] == " " # this is how we skip the space
#     index_in_word = 0 #it will be reset at every start of the outer loop
#
#
#     loop do
#       break if str[index_in_sentence] == " " || str[index_in_sentence] == nil
#
#       str[index_in_sentence] = str[index_in_sentence].upcase! if index_in_word.even?
#       str[index_in_sentence] = str[index_in_sentence].downcase! if index_in_word.odd?
#       index_in_word += 1
#       index_in_sentence += 1 # we need to keep track of both index_in_word and index_in_sentence
#     end
#
#     break if str[index_in_sentence] == nil # we break when str if finished
#   end

#   str
# end
# p weirdcase( "String" ) #== "StRiNg"
# p weirdcase( "Weird string case" ) #== "WeIrD StRiNg CaSe"

# other solutions from codewars
def weirdcase(string)
  string.split(' ').map do |word|
    word.split('').each_with_index.map do |char, i|
      i % 2 == 0 ? char.upcase : char.downcase
    end.join('')
  end.join(' ')
end
p weirdcase( "String" ) #== "StRiNg"
p weirdcase( "Weird string case" ) #== "WeIrD StRiNg CaSe"

puts

# with next (what I originally wante to do!)
def weirdcase(string)
  counter = 0
  string.each_char.with_index do |char, index|
    if char == ' '
      counter = 0
      next
    else
      counter.even? ? string[index] = char.upcase : string[index] = char.downcase
      counter += 1
    end
  end
    string
end
p weirdcase( "String" ) #== "StRiNg"
p weirdcase( "Weird string case" ) #== "WeIrD StRiNg CaSe"

puts

# refactoring
def weirdcase(string)
  counter = 0
  string.each_char.with_index do |char, index|
    if char == ' '
      counter = 0 && next
    else
      counter.even? ? string[index] = char.upcase : string[index] = char.downcase
      counter += 1
    end
  end
    string
end
p weirdcase( "String" ) #== "StRiNg"
p weirdcase( "Weird string case" ) #== "WeIrD StRiNg CaSe"

puts
def weirdcase string
  counter = 0
  for char in 0...string.length
    counter = -1 if string[char] == ' '
    counter % 2 == 0 ? string[char] = string[char].upcase : string[char] = string[char].downcase
    counter += 1
  end
  string
end
p weirdcase( "String" ) #== "StRiNg"
p weirdcase( "Weird string case" ) #== "WeIrD StRiNg CaSe"