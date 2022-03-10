# Running Totals
# Write a method that takes an Array of numbers, and returns an Array with
# the same number of elements, and each element has the running total
# from the original Array.

# Examples:
# Input - Array of integers
# Output - Array of integers, each element being
# the running total of the input array

# Data Structures - Array

# Algorithm
# Initialise Var - total to 0
#           Var  - result -> empty array

# Iterate through array, add the value of element on each iteration and add
# the total value to the `result` array.

# Return `result` array after iteration

# def running_total(arr)
#   total = 0
#   arr.map { |num| total += num }
#   # result = []
#   # arr.each do |num|
#   #   total += num
#   #   result << total
#   # end
#   # result
# end

# p running_total([2, 5, 13]) == [2, 7, 20]
# p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
# p running_total([3]) == [3]
# p running_total([]) == []
=begin
[Train: Substring fun \| Codewars](https://www.codewars.com/kata/565b112d09c1adfdd500019c/train/ruby)
7 kyu
Complete the function that takes an array of words.
You must concatenate the nth letter from each word to construct a new word
which should be returned as a string, where n is the position of the word
in the list.

For example:

["yoda", "best", "has"]  -->  "yes"
  ^        ^        ^
  n=0     n=1     n=2
Note: Test cases contain valid input only - i.e. a string array or an empty
array; and each word will have enough letters.
=end

# Input - Array of strings
# Output - String -> with the nth character of every element of the input array
# like :

# ["yoda", "best", "has"]  -->  "yes"
#   ^        ^        ^
#   n=0     n=1     n=2

# Data Structures - Array and string

# Algorithm -
#   - iterate through the input array and transform
#   - return nth character (character at index position) for every iteration
#   - join the returned array and return string

# def nth_char(arr)
#   arr.map.with_index { |word, idx| word[idx] }.join
# end

# p nth_char(['yoda', 'best', 'has']) == 'yes'
# p nth_char([]) == ''
# p nth_char(['X-ray']) == 'X'
# p nth_char(['No', 'No']) == 'No'
# p nth_char(['Chad', 'Morocco', 'India', 'Algeria', 'Botswana', 'Bahamas', 'Ecuador', 'Micronesia']) ==  'Codewars'

=begin
[Train: Extract the domain name from a URL \| Codewars](https://www.codewars.com/kata/514a024011ea4fb54200004b/train/ruby)
5 kyu
Write a function that when given a URL as a string, parses out just the domain
name and returns it as a string. For example:

domain_name("http://github.com/carbonfive/raygun") == "github"
domain_name("http://www.zombie-bites.com") == "zombie-bites"
domain_name("https://www.cnet.com") == "cnet"
=end

# p domain_name("http://google.com") == "google"
# p domain_name("http://google.co.jp") == "google"
# p domain_name("www.xakep.ru") == "xakep"
# p domain_name("https://youtube.com") == "youtube"
=begin
[Train: Kebabize \| Codewars](https://www.codewars.com/kata/57f8ff867a28db569e000c4a/train/ruby)
6 kyu
Modify the kebabize function so that it converts a camel case string into a kebab case.

kebabize('camelsHaveThreeHumps') // camels-have-three-humps
kebabize('camelsHave3Humps') // camels-have-humps
Notes:

the returned string should only contain lowercase letters
=end

# Input - string
# Output - string -> converted from camel case to kebab case

# Rules - camel case
#       - new words start with capital letters (no spaces)

#       - kebab case
#       - every word is in lowercase and joined with '-'

# Data structures - string

# Algortithm -

# Initialize empty array - Var - `kebab`

# Start Loop (from 0 to string size - 1) - block parameter - index
#         Initialize - empty array -> temp

#         if char at `index` of string is lowercase
#           add it to `temp`
#         elsif char at `index` of string is uppercase
#           add `temp` to `kebab`
#           reassign `temp` to `[]`
#           add char to temp
#         end

#         add `temp` to `kebab`

# End Loop

# capitalize the first word in kebab, join with '-' and return string

LOWERCASE = ('a'..'z').to_a
UPPERCASE = ('A'..'Z').to_a

# def kebabize(str)
#   kebab = []
#   temp = ''
#   0.upto(str.size - 1) do |idx|
#     if LOWERCASE.include?(str[idx])
#       temp << str[idx].downcase
#     elsif UPPERCASE.include?(str[idx])
#       kebab << temp
#       temp = ''
#       temp << str[idx].downcase
#     end
#   end
#   kebab << temp
#   kebab.join('-')
# end

# Refactored

def kebabize(str)
  kebab = ''
  str.chars.each do |char|
    if LOWERCASE.include?(char)
      kebab << char
    elsif UPPERCASE.include?(char)
      kebab << '-' << char.downcase if kebab.size > 0
      kebab << char.downcase if kebab.size == 0
    end
  end
  kebab
end

p kebabize('myCamelCasedString') == 'my-camel-cased-string'
p kebabize('myCamelHas3Humps') == 'my-camel-has-humps'
