=begin
In the easy exercises, we worked on a problem where we had to count the number of uppercase and lowercase characters, as well as characters that were neither of those two. Now we want to go one step further.

Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the percentage of characters in the string that are lowercase letters, one the percentage of characters that are uppercase letters, and one the percentage of characters that are neither.

You may assume that the string will always contain at least one character.
Problem:
input: a string
return: a hash
- the input string will contain at least one char
- the input string can be composed of lowercase letters, uppercase letters or neither
- determine the percentage of each type
- return that in a hash
- the percentage: a float with one decimal place
- keys are symbols

Examples:

letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }

DS:
- array of chars
- hash

Algo:
- intialize alphabet array
- initialize a hash with 3 keys: lowercase, uppercase and neither (symbols), assigned to values of 0.0
- convert input string to array of chars
- iterate through the chars array
  - if current char is lowercase and alphabetic
    - increment value of lowercase in hash by 1
  - else if char is uppercase and alphabetic
    - increment value of uppercase in hash by 1
  - else
    - increment value of neither in hash by 1
  - iterate through the hash to transform the values to percentages
    - value.to_f / total num of chars in input string * 100
- return the hash
=end
ALPHABET = ("a".."z").to_a + ("A".."Z").to_a

def letter_percentages(string)
  hash = { lowercase: 0.0, uppercase: 0.0, neither: 0.0 }
  chars_array = string.chars

  chars_array.each do |char|
    if char == char.downcase && ALPHABET.include?(char)
      hash[:lowercase] += 1
    elsif char == char.upcase && ALPHABET.include?(char)
      hash[:uppercase] += 1
    else
      hash[:neither] += 1
    end
  end

  hash.transform_values! do |value|
    value.to_f / string.size * 100
  end

  hash
end

letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
