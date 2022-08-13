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
def substrings(str)
  res = []
  counter = 1
  index = 0
loop do
  loop do
    res << str.slice(index, counter)
    counter += 1
    break if counter > str.size
  end
 index += 1
 counter = 1
 break if index == str.size - 1
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
