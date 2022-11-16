# https://launchschool.com/lessons/85376b6d/assignments/2c1146ee
# PROBLEM:

# Given a string, write a method change_me which returns the same
# string but with all the words in it that are palindromes uppercased.

# change_me("We will meet at noon") == "We will meet at NOON"
# change_me("No palindromes here") == "No palindromes here"
# change_me("") == ""
# change_me("I LOVE my mom and dad equally") == "I LOVE my MOM and DAD equally"


# 1. first define a method that will give us all substrings
# 'halo'
# [ha, hal, halo, al, alo, lo]
# [ha, hal, halo] - inner loop responsibility
# -then we need to increase the starting index from which we need to loop
# -but also we need to increase the counter, it needs to be 1 greater than the index we are starting from
# -and then we need to continue increasing the counter until we reach the last letter
# [al, alo, lo] - will be the next set of substrings, starting with index 1 and then increasing the number of letters we grab until the word is finished

# -loop from 1st character to the last one(included), each time taking 1 more letter -- ha, hal, halo
# -loop from the 2nd character to the last one(included), each time taking 1 more letter -- al, alo,
# -loop from the 3rd character to the last one(included), each time taking 1 more letter -- lo
# -when you are done with the first word, start doing the same with the 2nd word and so on...

# 2. Then a method that will tell us which are palindromes
# -'Madam' is not a palindrome, 'madam' is

# 3. If a word is uppercase, it remains uppercase in the solution (3rd test case)

def get_substrings(word)
  substrings = []
  index = 0
  letters_to_grab = index + 1
  loop do
    loop do
      substrings << word[index..letters_to_grab]
      letters_to_grab += 1
      break if letters_to_grab > word.size - 1# break if 4 == 4 - this does not work break if letters_to_grab == word.size
    end
    index += 1
    letters_to_grab = index + 1
    break if index == word.size - 1
  end
  substrings
end

word = 'halo'
p get_substrings(word)

puts
puts "*****************************"
=begin
Question:
Write a method that iterates through a string to obtain all substrings >= 2 characters in length.

-----------------------
Problem:
- Create method that captures substrings of a String
- Substrings are at least 2 characters in length

Input: String
Output: Array of substrings
Rules:
  Explicit Requirements
    - Substrings will be at least 2 characters in length

  Implicit Requirements
    - Return array of substrings

-----------------------
Examples:
substrings("abcd") == ["ab", "abc", "abcd", "bc", "bcd", "cd"]

-----------------------
Data Structure: Array that will contain substrings

Algorithm:
Rules: substrings("abcd")
- First substring will start at index 0 to index 1 = "ab"
- Second substring will start at index 0 to index 2 = "abc"
- Third substring will start at index 0 to index 3 = "abcd"
- Fourth substring will start at index 1 to index 2 = "bc"
- continue until all are captured

**PSEUDO - Informal**
- Create method `substrings` with parameter of `string`
- Initialize `substring_arr` to an empty array
- Initialize a `current_start_index` variable equal to 0
- Start a loop to handle iterating `current_start_index` after each inner loop is fullfilled.
  - Initialize `num_of_chars` = 2
  - Start a loop to iterate through `string`
    - Push into the `substring_arr` object the first substring of `string` starting at
      `current_start_index`` (initially index position 0) with the value
       of `num_of_chars` as the length of the desired substring
    - Iterate `num_of_chars` by 1
    - Break loop if `num_of_chars` is equal to the lenght of the string
  - Break loop if `current_start_index` is equal to `string` length minus 2
  - Iterate `current_start_index` by 1
- Check substring_arr as test

  string[current_start_index, num_of_chars]

-----------------------
Code:
=end

def substrings(string)
  substring_arr = []
  current_start_index = 0
  loop do
    num_of_chars = 2
    loop do
      substring_arr << string[current_start_index, num_of_chars]
      break if num_of_chars.eql?(string.length - current_start_index)
      num_of_chars += 1
    end
    break if current_start_index.eql?(string.length - 2)
    current_start_index += 1
  end
  p substring_arr
end

substrings("abcd") == ["ab", "abc", "abcd", "bc", "bcd", "cd"]
substrings("hollow") == ["ho", "hol", "holl", "hollo", "hollow", "ol", "oll", "ollo", "ollow", "ll", "llo", "llow", "lo", "low", "ow"]
substrings("Holy")

puts
puts "************* final method **************"

def palindrome?(word)
  word == word.reverse
end

str = 'halo'

def change_me(str)
  arr = str.split
  result = arr.each do |word|
    if palindrome?(word)
      word.upcase!
    else
      word
    end
  end
  result.join(" ")
end

p change_me("We will meet at noon") == "We will meet at NOON"
p change_me("No palindromes here") == "No palindromes here"
p change_me("") == ""
p change_me("I LOVE my mom and dad equally") == "I LOVE my MOM and DAD equally"
