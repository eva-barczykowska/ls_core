=begin
Leading Substrings
Write a method that returns a list of all substrings of a string that start
at the beginning of the original string.
The return value should be arranged in order from shortest to longest substring.

Examples:

leading_substrings('abc') == ['a', 'ab', 'abc']
leading_substrings('a') == ['a']
leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

PEDAC
Problem
-I have a string passed to my method as an argument
-I need to return all the substrings from the beginning of the string
-the return value should organize them from shortest to longest

Examples
leading_substrings('abc') == ['a', 'ab', 'abc']
leading_substrings('a') == ['a']
leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

Data structures
input: string
output: array

Algorithm
-initialize a res variable and point it to an empty array
-initialize a counter variable to an integer 0
-iterate over the string, and cut characters from index 0 (the first character)
 to the current counter
-add these characters to the res array
-increase the counter
-finish when the counter is equal to the string size
-return the array, the substrings should be already organized from the shortest to the longest

Code
=end
def leading_substrings(str)
  res = []
  counter = 1
  loop do
    res << str.slice(0, counter)
    counter += 1
    break if counter > str.size #break returns what we tell it to, try to put 'something' after it and comment res below, and if we don't give it anything? what does it return?
  end
  res
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

puts ""

# ls solution
def leading_substrings(string)
  result = []
  0.upto(string.size - 1) do |index|
    result << string[0..index]
  end
  result
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

puts ""

def leading_substrings(string)
    1.upto(string.size).map {|num| string.slice(0, num)}
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

puts " "

def leading_substrings(in_str)
  subs = []
  in_str.length.times do |num|
    subs << in_str[0..num]
  end
  subs
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

puts ""

def leading_substrings(string)
  string.chars.each_index.with_object([]) { |index, array| array << string[0..index] }
end

# methods he used
# chars --> ['a', 'b', 'c']
# each_index --> 0, 1, 2
# with_object

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

puts ""

def leading_substrings(string)
  string.chars.map.with_index { |_, i| string[0..i] }
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
