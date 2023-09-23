=begin

Create a function that returns the index of the first vowel in a string.

Notes
Input will be single words.
Characters in words will be upper or lower case.
"y" is not considered a vowel.
Input always contains a vowel.

A:
 - create a Vowel constant with vowels: aeouiAEOUI
 - change str input into an array
 - iterate over the array
 - initialize a counter variable to 0
 - if the char at the current counter is equal to any characters from the VOWEL constant
 - return the index of that character

A2:
- iterate over the array of chars and if the char belongs to/matches (/[aeiou]/)
- then return the index of that character
=end

VOWELS = %(aeouiAEOUI).chars

def first_vowel(str)
  arr = str.chars

  counter = 0
  loop do
    if VOWELS.include? arr[counter]
      return arr.index(arr[counter])
      break
    else
      counter += 1
    end

  end

end
p first_vowel("apple") == 0
p first_vowel("hello") == 1
p first_vowel("STRAWBERRY") == 3
p first_vowel("pInEaPPLe") == 1

puts

def first_vowel(str)
  arr = str.chars

  arr.each do |char|
    if char.match?(/[aeouiAEOUI]/)
      return arr.index(char)
    end
  end

end
p first_vowel("apple") == 0
p first_vowel("hello") == 1
p first_vowel("STRAWBERRY") == 3
p first_vowel("pInEaPPLe") == 1