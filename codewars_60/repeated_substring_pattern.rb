=begin
Given non empty string check if it can be constructed by taking a substring of it an appending multiple copies of substring together. Assume given string consists of lowercase English letters only.
Example 1:
Input: 'abab'
Output: true
Explanation: It's the substring 'ab' twice.
Example 2:
Input: 'aba'
Output: false
Explanation: String cannot be constructed from repeating substring.
p repeated_substring_patten('abab') == true
p repeated_substring_patten('aba') == false
p repeated_substring_patten('aabaaba') == false
p repeated_substring_patten('abaababaab') == true
p repeated_substring_patten('abcabcabcabc') == true

PEDAC
P:
- write a method
- method takes a str as an argument
- method returns true/false based on if the str argument can be constructed by taking a susbrings of it and appending multiple copies together

- str won't be empty

E:
p repeated_substring_patten('abab') == true
=> ab * 2
a, ab, aba

p repeated_substring_patten('aba') == false
=> a, ab, aba --- aba! should NOT be included (full size)

p repeated_substring_patten('aabaaba') == false
=> a, aa, aab, aaba, aabaa, aabaab, aabaaba --- should NOT be included! (full size)
=> a, ab, aba, abaa, abaab, abaaba
=> etc.

p repeated_substring_patten('abaababaab') == true
=>

p repeated_substring_patten('abcabcabcabc') == true

DS:
input: non-empty str
output: boolean: true/false

A:
- initialize substrings []

- generate all substrings


- while generating, populate substrings [] ONLY with those substrings whose size
 - if the input str size divided by the substring size is equal to 0, then I want to save this substring into substrings []

 - remove the substring == str.size

 -iterate over subsrtings
 0...str.size * substring
 - if substring * --- what number is it?
 -from 2 to str.size

 -use [1...str.size] -- 1, 2, 3

=end
def repeated_substring_patten(str)
  substrings = []

  (0...str.size).each do |starting_index|
    (starting_index...str.size).each do |ending_index|
      substring = str[starting_index..ending_index]
      substrings << substring if (str.size % substring.size) == 0
    end
  end

  substrings = substrings.delete_if { |s| s.size == str.size}.uniq

  (1..str.size).to_a.each do |number|
    substrings.each do |s|
      return true if s * number == str
    end
  end

  false
end
p repeated_substring_patten('abab') == true
p repeated_substring_patten('aba') == false
p repeated_substring_patten('aabaaba') == false
p repeated_substring_patten('abaababaab') == true
p repeated_substring_patten('abcabcabcabc') == true
p repeated_substring_patten('aaa') == true

# - unhelpful habits:
#   - "i will see" vs. irb, "I anticipate" / intentional coding
# - resolve all doubts BEFORE starting to code
# - test assumptions
# - how do I include a substring if it's equal to the str.size? - find out before coding


