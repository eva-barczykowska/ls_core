=begin
[Train: Counting Duplicates \| Codewars](https://www.codewars.com/kata/54bf1c2cd5b56cc47f0007a1/train/ruby)
6 kyu
Count the number of Duplicates

Write a function that will return the count of distinct case-insensitive alphabetic characters and numeric digits that occur more than once in the input string. The input string can be assumed to contain only alphabets (both uppercase and lowercase) and numeric digits.

Example
"abcde" -> 0 # no characters repeats more than once
"aabbcde" -> 2 # 'a' and 'b'
"aabBcde" -> 2 # 'a' occurs twice and 'b' twice (`b` and `B`)
"indivisibility" -> 1 # 'i' occurs six times
"Indivisibilities" -> 2 # 'i' occurs seven times and 's' occurs twice
"aA11" -> 2 # 'a' and '1'
"ABBA" -> 2 # 'A' and 'B' each occur twice
=end

=begin

PROBLEM
======
Desc.
----
  Given an Input String of alphanumeric caharacters, determine and return the amount of characters that occur more than once.

Rules
----
  + Explicit
    - treat letters with CASE INSENSITIVY : "b" : "B"

  + Implicit


Notes
-----
* not about highest count

EXAMPLES
========
1."abcde" -> 0
# no characters repeats more than once
max count of any char : 1

2.
"aabbcde" -> 2
# 'a' and 'b' both occur twice

3.
"aabBcde" -> 2
# 'a' occurs twice and 'b' twice (`b` and `B`)

4.
"indivisibility" -> 1
# 'i' occurs six times

5.
"Indivisibilities" -> 2
# 'i' occurs seven times and 's' occurs twice

"aA11" -> 2
# 'a' and '1'

"ABBA" -> 2
# 'A' and 'B' each occur twice


DATA STRUCTURES
===============
Input : String
  + alphanumeric characters only

Intermediate : Hash

Output : Integer
N:
3.0.0 :002 > "Indivisibilities".downcase.chars.tally
 => {"i"=>7, "n"=>1, "d"=>1, "v"=>1, "s"=>2, "b"=>1, "l"=>1, "t"=>1, "e"=>1}
A:
- downcase the str
- tally the characters
- remove all keys which have value 1
- iterate over the keys and values that you have left
- return the number of keys, we don't need to do anything with the values because chars which are keys have to be unique
=end

def duplicate_count(str)
  str.downcase.chars.tally.reject { |_, v| v == 1 }.keys.size
end
p duplicate_count("Indivisibilities") == 2
p duplicate_count("") == 0
p duplicate_count("abcde") == 0
p duplicate_count("abcdeaa") == 1
p duplicate_count("abcdeaB") == 2
p duplicate_count("Indivisibilities") == 2

puts

# same as
def duplicate_count(str)
  str.downcase.chars.tally.select { |_, v| v >= 2 }.keys.size
end
p duplicate_count("Indivisibilities") == 2
p duplicate_count("") == 0
p duplicate_count("abcde") == 0
p duplicate_count("abcdeaa") == 1
p duplicate_count("abcdeaB") == 2
p duplicate_count("Indivisibilities") == 2

# ALGORITHM
# - transform given string into an array of downcase characters
# - create result array that contains the count of each characters in  given string
# - select any characters that has the count greater than 2
# - return the size of selected array

def duplicate_count(input_string)
  return_string = input_string.chars.map(&:downcase).uniq # ["i", "n", "d", "v", "s", "b", "l", "t", "e"]


  return_string.map { |char| input_string.downcase.count(char) } # [7, 1, 1, 1, 2, 1, 1, 1, 1]
        .select { |count| count >= 2 }
        .size
end

p duplicate_count("") == 0
p duplicate_count("abcde") == 0
p duplicate_count("abcdeaa") == 1
p duplicate_count("abcdeaB") == 2
p duplicate_count("Indivisibilities") == 2
