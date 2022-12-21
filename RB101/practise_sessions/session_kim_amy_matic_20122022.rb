=begin
https://leetcode.com/problems/longest-palindrome/description/

Given a string s which consists of lowercase or uppercase letters,
return the length of the longest palindrome that can be built with those letters.

Letters are case sensitive, for example, "Aa" is not considered a palindrome here.
Example 1:

Input: s = "abccccdd"
Output: 7
Explanation: One longest palindrome that can be built is "dccaccd",
whose length is 7.
Example 2:

Input: s = "a"
Output: 1
Explanation: The longest palindrome that can be built is "a", whose length is 1.
=end

=begin
## P: Understanding the Problem:

We're given a string. We have to return an integer which represents
the length of the longest palindrome that can be build
by the characters in the given string.

## E: Examples and Test Cases:
## D: Data Structures:

array of chars / combinations of chars

## A: Algorithm:

- initialize result array
- get all the combinations of characters from str.size down to one
- iterate trough array of combinations
  - if combination to string is palindrome
    - put size of that string to result array
- return the largest number from result array

# Algorithm:
- initialize result to 0
- count the characters using hash counting
- see if there is any character of just one count
  - add 1 to final result
- for all the characters which are larger than one in count and divisible by two
    - add all counts to the final result

## C: Implementing a solution in Code:
=end

def longest_palindrome(str)
  result = 0
  counts = Hash.new(0)
  str.chars.each do |char|
    counts[char] += 1 # gives us a hash which has counted characters. Characters are keys, value tells us how many times a char occured.
  end
  p counts # { "d"=>1, "a"=>2, "m"=>2 } for 'daman' which will become 'madam'
  # check for 1
  result = 1 if counts.values.any?(1) # is there any characters whose count is 1? It will be the middle character in a palindrome.
  counts.values.each do |count|
    result += count if count.even? # because even count means there will be 1 letter on the other side
  end
  result
end

# p longest_palindrome('abccccdd') == 7
# p longest_palindrome('a') == 1
# p longest_palindrome('damam') == 5
# p longest_palindrome('wow') == 3
# p longest_palindrome('akayk') == 5
# p longest_palindrome('vicic') == 5
p longest_palindrome('ewa') == 1

puts

def longest_palindrome(str)
  result = []
  (str.size).downto(1) do |length|
    str.chars.permutation(length) { |permutation| result << permutation if permutation.reverse == permutation }
  end
  result.uniq.max_by { |subarr| subarr.size }.size
end

# p longest_palindrome('abccccdd') == 7
# p longest_palindrome('a') == 1
p longest_palindrome('damam') #== 5
# p longest_palindrome('wow') == 3
# p longest_palindrome('akayk') == 5
# p longest_palindrome('vicic') == 5
# p longest_palindrome('ewa') == 1 # but it's not a palindrome!
#
# As the last example shows, the code will return reliable results when
# the string passed as an argument can become a palindrome at all
# It doesn't return 0 if the string argument cannot become a palindrome
# and this is what I would expect
# so we are working here based on the assumption
# that the string argument passed de facto CAN create multiple palindromes
# and we are looking for the longest one
