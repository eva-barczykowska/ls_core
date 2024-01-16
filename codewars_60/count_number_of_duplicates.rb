=begin
Count the number of Duplicates
Write a method that will return the count of distinct case-insensitive alphabetic characters and numeric digits that occur more than once in the input string. The input string can be assumed to contain only alphabets (both uppercase and lowercase) and numeric digits.

PEDAC
- write a method that takes a string as an argument
- str can contain uppercase letters or digits
- the method finds distinct case-insensitive alphabetic characters and numeric digits that occur more than once in the input string
- method returns a COUNT, so an integer

Example
"abcde" -> 0
=> no characters repeats more than once

"aabbcde" -> 2 # 'a' and 'b'
=> 2 letters occur more than once

"aabBcde" -> 2 # 'a' occurs twice and 'b' twice (`b` and `B`)
=> 2 letters occur twice, even though B is capital
=> I will need to downcase the input string

"indivisibility" -> 1 # 'i' occurs six times
=> 1 letter, i - 1 because it's just 1 letter so count UNIQUE characters

"Indivisibilities" -> 2 # 'i' occurs seven times and 's' occurs twice

"aA11" -> 2 # 'a' and '1'

"ABBA" -> 2 # 'A' and 'B' each occur twice

DS:
input: string
middle: hash
output: digit

N:
tally
downcase string
count only uniq
A:
- initialize result to 0

- downcase the string, change it it an array and count chars, store the result in `counts`

- if none of the values > 1, return 0

- iterate over counts hash, if a value for a given key is > 1, add one to final result

- return result when finished iterating

=end

def find_distinct(str)
  result = 0

  counts = str.downcase.chars.tally
  return 0 if counts.values.none? {|value| value > 1 }
  counts.each do |char, count|
    if count > 1
      result += 1
    end
  end

  result
end

p find_distinct("abcde") == 0
p find_distinct("aabBcde") == 2
p find_distinct("indivisibility") == 1
p find_distinct("Indivisibilities") == 2
p find_distinct("aA11") == 2
p find_distinct("ABBA") == 2
