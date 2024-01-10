# Find the longest substring in alphabetical order.
# Example: the longest alphabetical substring in "asdfaaaabbbbcttavvfffffdf" is "aaaabbbbctt".
# The input will only consist of lowercase characters and will be at least one letter long.
# If there are multiple solutions, return the one that appears first.

# Problem
# Take a String with many characters. Get all substrings from it. From these, exclude those that break alphabetical order. From these take the longest. If there is a tie, take the one that 'appears first'.

# 1) Getting all substrings:

# Nested iteration over the string with 2 indexes

# i: from first char until last char

# j: from i indexed char until last char

# Add to collection: str[i, j]


# 2) Excluding not alphabetical ones:

# Iterate over all strings in substrings collection

# Initialize temp storage variable to zero

# Iterate over each character of each string

# Compare ascii value of character to temp storage, if lower, exclude this substring, if higher, update temp storage


# 3) Getting longest:

# Initialize temp storage variable to 0

# Iterate over all selected substrings

# if its length is bigger than temp storage, add its length to temp storage

# Iterate over all selected substrings

# if its length is not equal to temp storage, exclude this substrings


# 4) Selecting the one that appears first

# Initialize answer variable to empty string

# Initialize place variable to length of argument object string

# Iterate over subset of strings (tied ones)

# if current string appears in method argumet object string before than place, update place and answer



def longest(str)
  if str.length == 1
    return str
  end

  substrings = []
  str.chars.each_with_index do |_,i|
    str.chars.each_with_index do |_, j|
      substrings << str[i, j]
    end
  end

  substrings.select! do |substring|
    asc_value = 0
    keep = true
    substring.chars.each do |char|
      if char.ord < asc_value
        keep = false
        break
      else
        asc_value = char.ord
      end
    end
    keep
  end.uniq!

  longest_length = 0
  substrings.each do |substring|
    longest_length = substring.length if substring.length > longest_length
  end
  substrings.select! do |substring|
    substring.length == longest_length
  end


  answer = ''
  place = str.length
  substrings.each do |candidate|
    if str.index(candidate) < place
      place = str.index(candidate)
      answer = candidate
    end
  end

  answer
end

p longest('asd') == 'as'
p longest('nab') == 'ab'
p longest('abcdeapbcdef') ==  'abcde'
p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
p longest('asdfbyfgiklag') == 'fgikl'
p longest('z') == 'z'
p longest('zyba') == 'z'

puts

=begin

PROBLEM:
input: string
output: string
- input is at least one character long
-output is longest alphabetical string

EXAMPLES:
p longest('asd') == 'as'
p longest('nab') == 'ab'
p longest('abcdeapbcdef') ==  'abcde'


DATA STRUCTURES:
input:string
int: array of substrings
output: string

ALGORITHM:
-`substrings` empty array
- create all substrings
- create `current_longest`
- iterate over substrings
  - check current substring sorted alphabetically is equal to substring
    - check if it is longer than current longest
      - reassign current longest to current string

return current longest
=end


def longest(string)
  substrings = []
  0.upto(string.length - 1) do |start_index|
    start_index.upto(string.length - 1) do |end_index|
      substrings << string[start_index..end_index]       # for 'asd' => ["a", "as", "asd", "s", "sd", "d"]
    end
  end

  current_longest = ''
  substrings.each do |sub|
    if sub.chars.sort.join == sub                         # sort will give us characters alphabetically sorted
      current_longest = sub if sub.length > current_longest.length
    end
  end
  current_longest
end

p longest('asd') #== 'as'
# p longest('nab') == 'ab'
# p longest('abcdeapbcdef') ==  'abcde'
# p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
# p longest('asdfbyfgiklag') #== 'fgikl'
# p longest('z') == 'z'
# p longest('zyba') == 'z'