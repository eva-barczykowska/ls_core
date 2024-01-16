=begin
PEDAC
P:
- given an array of strings, find out what is the common prefix
- the prefix has to be there in all the words
- return '' if there's no common prefix
- the words can be of different length

E:
word_list = ['preheat', 'prefix', 'premier']
=> pre

word_list2 = ['a', 'preheat', 'prefix', '']
=> no common previx

word_list3 = ['prefix', 'prefix', 'prefix']
=> prefix

DS:
input: array of strings
output: a str, the prefix

A:
- return '' if words array is empty


- remove the first word - a str and store it in `first_word`
- initialize a `counter` to iterate over the first_word string
- iterate over the first words characters, the iteration has to be as long as the first word

- initialize `prefix` to store the result

- while iterating
 - if the current character from my first_word is same as the char at the same index in ALL the other words from the array

- add this char to the result, that's how I am building my prefix

- when iteration if finished, return `prefix`
=end

def common_prefix(words)
  return '' if words.empty?

  prefix = ''
  first_word = words.shift

  counter = 0
  while counter <= first_word.size - 1 # words is now '[prefix', 'premier']
    prefix << first_word[counter] if words.all? { |word| word[counter] == first_word[counter] }
    counter += 1
  end

  prefix
end

word_list = ['preheat', 'prefix', 'premier']
word_list2 = ['a', 'preheat', 'prefix', '']
word_list3 = ['prefix', 'prefix', 'prefix']
word_list4 = []

p common_prefix(word_list) == 'pre'
p common_prefix(word_list2) == ''
p common_prefix(word_list3) == 'prefix'
p common_prefix(word_list4) == ''
