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