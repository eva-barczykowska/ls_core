=begin
Palindromic Substrings
Write a method that returns a list of all substrings of a string that are palindromic.
That is, each substring must consist of the same sequence of characters forwards as it does backwards.

The return value should be arranged in the same sequence as the substrings appear in the string.
Duplicate palindromes should be included multiple times.

You may (and should) use the substrings method you wrote in the previous exercise.

For the purposes of this exercise, you should consider all characters
and pay attention to case;
that is, "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are.
In addition, assume that single characters are not palindromes.

palindromes('abcd') == []
palindromes('madam') == ['madam', 'ada']
palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

PEDAC
Problem
-write a method that returns a list of all palindromic substrings of a string
-the method takes a string argument
-find all the substrings just like in the previous exercise
-check which of them are palindromic
-return those

Examples
palindromes('abcd') == []
palindromes('madam') == ['madam', 'ada']
palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
Data structures
input: string
output: array

Algorithm
-initialize a variable called palindromic_substrings to an empty array
-initialize a variable called substrings to an empty array
-initialize an index variable to an integer 0
-initialize a counter variable to the index variable
-initialize a variable called `substrings` and point it to an empty array
-initialize a bigger loop
-initialize a small loop where I iterate over the string and each time I go, I cut a substring,
 to begin with s[0..0], then s[0..1], s[0..2], s[0..3] and so on and so forth...
-every time I cut a substring, I increase the counter(as seen above, 1, 2, 3, etc.)
-I close the small loop
-increase the index by 1
-point the counter variable to index
-close the bigger loop
-now we can work with the substrings array
-iterate through the substrings and check if they are palindromes
-if yes, add them to the palindromic_substrings array
-remove single characters
-finally, return the palindromic_substrings array


Code
=end

def palindromes(str)
  substrings = []
  palindromic_substrings = []
  index = 0
  counter = index
  loop do
    loop do
      substrings << str[index..counter]
      counter += 1
      break if counter == str.size
     end
    index += 1
    counter = index
    break if counter == str.size
  end
  substrings.each do |substring|
    palindromic_substrings << substring if (substring == substring.reverse)
  end
  palindromic_substrings.select{|palindrome| palindrome.size > 1}
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
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

=begin
We define `leading_substrings` method with 1 parameter, a `string` object.

In the body of the method, first we initialize `result` variable to an empty array.
Then we invoke the `Integer#upto` method on integer `0` and pass `str.size - 1` as an argument.
`upto` method iterates over the given block 5 times, passing in integer values from 0 to 4.
The #upto method also takes a block with the block and we use the block parameter `index`.

When the `leading_substrings` method is called, each number from 0 to 4 will be passed in turn as a block argument to the `upto` method
and subsequently, because in the body of the block we call the `String[range]` method, a string will be cut from position 0
to the position equal to index, i.e. subsequently str[0..0], str[0..1], str[0..2], str[0..3], str[0..4].

Those 5 strings, as they are extrapolated from our argument string, will be added to the `result` array as its elements.
Finally, the result array will be returned.
If we pass string 'abcde' as an argument, an array `["a", "ab", "abc", "abcd", "abcde"]` will be returned.
=end

p 'leading_substrings method'
p 'cutting from 0, first just one character, then 2, then 3, then 4, then 5'
p leading_substrings('abcde')

def substrings(string)
  results = []
  (0...string.size).each do |start_index|
    this_substring = string[start_index..-1]
    results.concat(leading_substrings(this_substring))
  end
  results
end

When we invoke the substrings method and pass it a `string` object as an argument,
first we initialize results variable to an empty array.
Then on the range `0` to `str.size` we call the `each` method.
`Each` takes a block and we use start_index as a block parameter.
Inside the block, we define `this_substring` variable and make it reference the string range starting
from the character at start_index to the character at the last index of the string.
The `start_index` argument will change with every iteration as it depends on the `0..string.size` range.
So first 0 will be our parameter and string[0..-1] will be saved as `this_substring` variable. *** now we call 'leading_substrings' method
We will concatenate the contents of this variable to our results array.
The second time that the block is executed string[0..-1] will be saved as `this_substring` variable.
Again we will concatenate the contents of this variable to our results array.
This will continue until we reach

p 'substrings method'
p 'this is cutting first like the previous method but...'
p 'then starts to cut from 2nd character and cuts 1 character, then 2, then 3 until the end of the str'
p substrings('abcde')


def palindrome?(string)
  string == string.reverse && string.size > 1
end
p 'this method is responsible only for verifying if a str is a palindrome and if its size is greater than 1'
p palindrome?('abcde')
p palindrome?('a')
p palindrome?('madam')

def palindromes(string)
  all_substrings = substrings(string)
  results = []
  all_substrings.each do |substring|
    results << substring if palindrome?(substring)
  end
  results
end
p 'finally, this method is using the previous 2 plus dealing with establishing whether a method is a palindrome'
p palindromes('abcde')
p palindrome?('a')
p palindrome?('madam')
p 'end of explanation'

puts ''


p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

puts ""

=begin
Further exploration
Can you modify this method (and/or its predecessors) to ignore non-alphanumeric
characters and case? Alphanumeric characters are alphabetic characters(upper and lowercase) and digits.
-simply clean the string first so:
-downcase
-remove non-alphabetic characters
=end

def palindromes(str)
  alphabet = ('a'..'z').to_a + ('A'..'Z').to_a
  str = str.downcase.chars.delete_if{ |char| !alphabet.include?(char)}.join
  substrings = []
  palindromic_substrings = []
  index = 0
  counter = index
  loop do
    loop do
      substrings << str[index..counter]
      counter += 1
      break if counter == str.size
     end
    index += 1
    counter = index
    break if counter == str.size
  end
  substrings.each do |substring|
    palindromic_substrings << substring if (substring == substring.reverse)
  end
  palindromic_substrings.select{|palindrome| palindrome.size > 1}
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('99m adam') == ['madam', 'ada']
p palindromes('99mad#$%^am') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [ #these strings here will be different so this will return false
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
