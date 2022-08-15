=begin
All Substrings
Write a method that returns a list of all substrings of a string.
The returned list should be ordered by where in the string the substring begins.
This means that all substrings that start at position 0 should come first,
then all substrings that start at position 1, and so on.
Since multiple substrings will occur at each position,
the substrings at a given position should be returned in order from shortest to longest.

You may (and should) use the leading_substrings method you wrote in the previous exercise:

substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

Algorithm
-initialize a res variable and point it to an empty array
-initialize a counter variable to an integer 0
-iterate over the string, and cut characters from index 0 (the first character)
 to the current counter
-add these characters to the res array
-increase the counter
-finish when the counter is equal to the string size
--now I need to iterate again but starting from index 1
-return the array, the substrings should be already organized from the shortest to the longest
=end

#my method
# def leading_substrings(str)
#   res = []
#   counter = 1
#   loop do
#     res << str.slice(0, counter)
#     counter += 1
#     break if counter > str.size
#   end
#   res
# end

def substrings(str)
  res = []
  counter = 0
  index = counter # so we start from 0 like this str[0..0], which will give us 1 character, the first character from the string
loop do

  loop do
    res << str[index..counter] #s[0..0] will give me 'a', s[1..1] will give me 'b'
    counter += 1 #counter will be 1, then 2, 3,4 and 5, when it's 5 then it equals str.size and we break out of the loop
    break if counter >= str.size
  end

  index += 1 #now, starting from the 2nd character so we increase the index to 2, coz we want to start with 'b'
  counter = index #we also increase the counter, in order to grab the correct number of characters, we start with 1
  break if index == str.size
end
  res
end

p substrings('abcde')
p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

puts ""

# ls solution

def leading_substrings(string)
  result = []
  0.upto(string.size - 1) do |index|
    result << string[0..index]
  end
  result
end

def substrings(string)
  results = []
  (0...string.size).each do |start_index|
    this_substring = string[start_index..-1]
    results.concat(leading_substrings(this_substring))
  end
  results
end

p substrings('abcde')
p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

puts "
"
# Other solutions
def substrings(str)
  (0...str.size).each_with_object([]) do |index, substrings|
    1.upto(str.size - index) {|length| substrings << str[index, length]}
  end
end

p substrings('abcde')
p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

puts ""

def leading_substrings(string)
  string.chars.map.with_index { |_, i|string[0..i] }
end

p substrings('abcde')
p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
