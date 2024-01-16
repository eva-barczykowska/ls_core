=begin
given a string, return the same string but where each vowel after the third has been removed.

three_vowels("adobe") == "adobe"
three_vowels("fluctuate") == "fluctuat"
three_vowels("dog") == "dog"
three_vowels("aaa333aaa") == "aaa333"
three_vowels("eyelashes") == "eyelshs"

P:
- write a method that takes a string
- the method returns a string where each vowel after the 3rd vowel is removed. To be specific, we're going to remove all vowels after the first 3
- what if a str is empty? return an empty string?
- by vowels, we mean a e i o u y
- non-mutating
- only lowercase?

E:
three_vowels("adobe") == "adobe"
=> no more than 3 vowels

three_vowels("fluctuate") == "fluctuat"
=> e is the 4th vowel, it has to go

three_vowels("dog") == "dog"
=> less than 3 vowels

three_vowels("aaa333aaa") == "aaa333"
=> all vowels after the 3rd one have to go

three_vowels("eyelashes") == "eyelshs"
=> same here

D:
Input: string
Intermediate: array
Output: a new string

Notes:
-each_with_index

A:
- return arg if arg has 3 or less vowels

-define vowels
-split argument str into an array
-get indices of all vowels

-cut the word into 2, the word with the vowels and the word that is not supposed to have them

-remove all vowels from the word that is not supposed to have them

- put back both words/arrays
- join to return string
=end
def three_vowels(str)
  return str if str.count('aeouiy') <= 3 || str.empty?

  vowels = %w(a e o u i y)
  arr = str.split("")
  vowel_indices = []

  arr.each_with_index { |letter, index| vowel_indices << index if vowels.include?(letter) }

  cut_off_point = vowel_indices[2]

  first_word = arr[0..cut_off_point].join
  second_word = arr[cut_off_point.next..-1].join.delete('aeouiy')

  first_word + second_word
end
p three_vowels("adobe") == "adobe"
p three_vowels("fluctuate") == "fluctuat"
p three_vowels("dog") == "dog"
p three_vowels("aaa333aaa") == "aaa333"
p three_vowels("eyelashes") == "eyelshs"
p three_vowels("") == ""

puts
# another solution with NEXT
def three_vowels(str)
  result = ""
  vowel_counter = 0

  str.each_char do |char|
    if is_vowel?(char)
      vowel_counter += 1
      next if vowel_counter > 3
    end
    result << char
  end
  result
end

def is_vowel?(char)
  vowels = 'aeiouy'
  vowels.include?(char)
end

p three_vowels("adobe") == "adobe"
p three_vowels("fluctuate") == "fluctuat"
# p three_vowels("dog") == "dog"
p three_vowels("aaa333aaa") == "aaa333"
p three_vowels("eyelashes") == "eyelshs"
p three_vowels("") == ""

puts


=begin
Given a word, return a copy of that word, removing every vowel after the first three:

three_vowels("tropical") == "tropical"
three_vowels("tropicalia") == "tropical"
three_vowels("BliMp123") == "BliMp123"
three_vowels("eyelash2!!!") == "eyelsh2!!!"

PEDAC
P:
- write a method
- the method takes a str as an argument
- str can contain uppercase /lowercase letters, special characters
- no spaces

- method removes every wovel after the first three

E:
three_vowels("tropical") == "tropical"
=> only 3 vowels

three_vowels("tropicalia") == "tropical"
o, i, a - 3 vowels, ia has to be removed

three_vowels("BliMp123") == "BliMp123"
=> only 1 vowel, i

three_vowels("eyelash2!!!") == "eyelsh2!!!"
=>e, y, e, => eyelsh2!!!

DS:
input: str
  str.chars
middle: ???
  arr.join
  (select.with_index + vowel_counter).join

******output: str

Idea:
how to build the output

A:
- define vowels
- build a new str that will be returned, `result`

- iterate over the str that you have
- keep adding chars from the input_str
- keep count if added char is a vowel
- if that count becomes 3, stop adding chars if they are vowels
- when iteration over the input_str is finished, return the `result` that you built
=end

#buidling a return_str
def three_vowels(str)
  vowels = %w(a e o u i y A E O U I Y) # added this for the last test case

  return_str = ''

  vowel_counter = 0
  counter = 0

  loop do
    break if counter >= str.size
    return_str << str[counter] unless vowels.include?(str[counter]) && vowel_counter == 3
    vowel_counter = return_str.count('aeoiuy')
    counter += 1
  end

  return_str
end

p three_vowels("tropical") == "tropical"
p three_vowels("tropicalia") == "tropical"
p three_vowels("BliMp123") == "BliMp123"
p three_vowels("eyelash2!!!") == "eyelsh2!!!"
p three_vowels("eyelAsh2!!!") == "eyelsh2!!!" # added this

puts
puts "today's session with Kim"
puts "first solution"
# A:
# - iterate through the word
# - add every character to return_str
# - unless that character is a vowel and the result_str already contains 3 vowels

VOWELS = %w(a e o u i y A E O U Y I)
def three_vowels(str)
  result = ''

  str.each_char do |char|
    result << char unless VOWELS.include?(char) && result.count('aeouiy') == 3
  end

  result
end
p three_vowels("tropical") == "tropical"
p three_vowels("tropicalia") == "tropical"
p three_vowels("BliMp123") == "BliMp123"
p three_vowels("eyelash2!!!") == "eyelsh2!!!"
p three_vowels("eyelAsh2!!!") == "eyelsh2!!!" # added this

puts
# no idea why the below gives me a nil error
def three_vowels(str)
  vowels = %w( a e o u y i A E O U I Y)
  result = ''

  counter = 0
  while counter < str.size
    result << str[counter] unless vowels.include?(str[counter]) && result.count('aeouiy') == 3
    counter += 1
  end

  result
end
p three_vowels("tropical") == "tropical"
p three_vowels("tropicalia") == "tropical"
p three_vowels("BliMp123") == "BliMp123"
p three_vowels("eyelash2!!!") == "eyelsh2!!!"
p three_vowels("eyelAsh2!!!") == "eyelsh2!!!" # added this

puts

# def three_vowels(input_str)
#   vowels = %w(a e o u i y A E O U I Y)
#   char_index = nil
#
#   str.each_char.with_index do |ch, idx|
#     vowel_counter += 1 if vowels.include?(ch)
#     char_index = idx
#     break if vowel_counter == 3
#   end
#
#   str1 = input_str[0..char_index]
#   str2 = input_str[(char_index + 1)..-1].delete('aeouiy')
#
#   result = str1 + str2
# end
#
# p three_vowels("tropical") == "tropical"
# p three_vowels("tropicalia") == "tropical"
# p three_vowels("BliMp123") == "BliMp123"
# p three_vowels("eyelash2!!!") == "eyelsh2!!!"
# p three_vowels("eyelAsh2!!!") == "eyelsh2!!!" # added this

puts

# def three_vowels(str)
#   vowels = %w( a e o u y i A E O U I Y)
#   result = ''
#
#   counter = 0
#   while counter <= str.size
#     result << str[counter] unless vowels.include?(str[counter]) && result.count('aeouiy') == 3
#     counter += 1
#   end
#
#   result
# end
# p three_vowels("tropical") == "tropical"
# p three_vowels("tropicalia") == "tropical"
# p three_vowels("BliMp123") == "BliMp123"
# p three_vowels("eyelash2!!!") == "eyelsh2!!!"
# p three_vowels("eyelAsh2!!!") == "eyelsh2!!!" # added this

# find the error
# def three_vowels(str)
#   vowels = %w( a e o u y i A E O U I Y)
#   result = ''
#
#   counter = 0
#   while counter <= str.size
#     result << str[counter] unless vowels.include?(str[counter]) && str.count('aeouiy') == 3
#     counter += 1
#   end
#
#   result
# end
# p three_vowels("tropical") == "tropical"
# p three_vowels("tropicalia") == "tropical"
# p three_vowels("BliMp123") == "BliMp123"
# p three_vowels("eyelash2!!!") == "eyelsh2!!!"
# p three_vowels("eyelAsh2!!!") == "eyelsh2!!!" # added this

puts

VOWELS = %w(a e o u i y A E O U I Y)
def three_vowels(str)
  result = ''
  counter = 0

  while counter < str.size
    unless VOWELS.include?(str[counter]) && result.count('aeouiyAEOUIY') == 3
      result << str[counter]
    end
    counter += 1
  end

  result
end
p three_vowels("tropical") == "tropical"
p three_vowels("tropicalia") == "tropical"
p three_vowels("BliMp123") == "BliMp123"
p three_vowels("eyelash2!!!") == "eyelsh2!!!"
p three_vowels("eyelAsh2!!!") == "eyelsh2!!!" # added this

# Notes from KIM
# what is the result and how do you imagine getting there?
# vowel_counter is the condition of pushing the character

# - define vowels, also capital
# - change input str to an array
# - get access to chars and their indices
# - select from arr all characters except vowels after 3rd vowel
# - how do I know str has 3 vowels?
# - I can use unless str.count('aeoui') == 3

puts
puts "solution with select"

VOWELS = %w(a e o u i y A E O U I Y)
def three_vowels(str)
  arr = str.chars
  res = ''
  arr.select do |char|
    res << char unless VOWELS.include?(char) && res.count('aeouiyAEOUIY') == 3
  end

  res
end
p three_vowels("tropical") == "tropical"
p three_vowels("tropicalia") == "tropical"
p three_vowels("BliMp123") == "BliMp123"
p three_vowels("eyelash2!!!") == "eyelsh2!!!"
p three_vowels("eyelAsh2!!!") == "eyelsh2!!!" # added this



