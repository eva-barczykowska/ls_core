=begin
Write a method that will return the count of distinct case-insensitive alphabetic characters and numeric digits that occur more than once in the input string. 
The input string can be assumed to contain only alphabetic (both uppercase and lowercase) and numeric digits.
22:55
CAN'T USE `#tally` 

P:
- method takes a str and returns an integer
- the int is the count of distinct case-insensitive alphabetic chars and numeric digits that occur more than once in the output string

p duplicate_count("") == 0
=> no char

p duplicate_count("abcde") == 0
=>no char more than once

p duplicate_count("abcdeaa") == 1
=> a occurs twice

p duplicate_count("abcdeaB") == 2
=> b occurs twice, downcase str first

p duplicate_count("Indivisibilities") == 2
=> it's the uniq chars that are counted, i and s

DS:
input str, 
output: int, count of distinctive/unique non case sentsitive chars

Idea 1
tally

Idea 2
Downcase this string and extract unique characters, then store in a hash the count of each character provided it's 2 or more. Return that number.

Idea 3
Downcase the string, determine which are the unique characters and out of those, select only those characters that appear more 2 or more times in the string. Count them and return the number
Algorithm for idea 2
-downcase the str argument, change into an array
-retrieve uniq chars from this array
-iterate over the array and count each char
-if it is 2 and more, store than char in `result`

-count and return the count of chars in `result`
-account for "" and no none chars whose count is 2 and more
=end

def duplicate_count(str)
  return 0 if str.empty? || str.size == str.chars.uniq.size

  arr = str.downcase.chars
  
  result = []
  arr.uniq.each do |char|
    result << char if arr.count(char) >= 2
  end

  result.size
end
p duplicate_count("") == 0
p duplicate_count("abcde") == 0
p duplicate_count("abcdeaa") == 1
p duplicate_count("abcdeaB") == 2
p duplicate_count("Indivisibilities") == 2
p duplicate_count("") == 0
p duplicate_count("abcde") == 0
p duplicate_count("abcdeaa") == 1
p duplicate_count("abcdeaB") == 2
p duplicate_count("Indivisibilities") == 2

puts

=begin
Write a function that will return the count of distinct case-insensitive alphabetic characters and numeric digits that occur more than once in the input string. 
The input string can be assumed to contain only alphabetic (both uppercase and lowercase) and numeric digits.

CAN'T USE `#tally` 

Example
"abcde" -> 0 # no characters repeats more than once
"aabbcde" -> 2 # 'a' and 'b'
a : 2
b : 2
c : 1
d : 1
e : 1

"aabBcde" -> 2 # 'a' occurs twice and 'b' twice (`b` and `B`)


"indivisibility" -> 1 # 'i' occurs six times


"Indivisibilities" -> 2 # 'i' occurs seven times and 's' occurs twice
"aA11" -> 2 # 'a' and '1'
"ABBA" -> 2 # 'A' and 'B' each occur twice
=end

# 1:04
=begin
PROBLEM
=======
Given a String of alphanumeric characters (only), return the count of unique characters that occur more than once

Rules
-----
  + case insensitive : 'b' == 'B'
  + input : always alphanumerics only
    - letters can be of either case
  + counts of unique characters
    + return the number of characters that occur at least twice


DS
=======
Input : String
  + alphanumerics only
    - upper && lowecase letters

Intermediate
------------
  + Hash : tallying counts of unique characters
    + build imperatively
    + keys : unique characters
    + values : counts in Input String

Output : Integer
  + number of unique characters that occur (2) or more times in input String


ALGORITHM
=========
+ generate Array of all characters
+ generate Array of unique characters
> transform Unique Characters to generate Hash Tallying Counts
  + iterate through unique characters
    + add to new Array an Array:
      + first : character
      + second : count in String

+ init `count` -- `0`
> generate count of tallies that have a value greater than or equal to `2`
  + increment count by `1` if value of current element >= `2`


=end

def duplicate_count(str)
  all_chars = str.chars.map {|char| char.downcase}
  unique_chars = all_chars.uniq

  tallies = unique_chars.map do |char|
    [char, all_chars.count(char)]
  end.to_h                        # very nice!

  count = 0

  tallies.each do |char, char_count|
    count += 1 if char_count > 1
  end

  count

end
p duplicate_count("") == 0
p duplicate_count("abcde") == 0
p duplicate_count("abcdeaa") == 1
p duplicate_count("abcdeaB") == 2
p duplicate_count("Indivisibilities") == 2