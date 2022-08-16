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

def substrings(string)
  results = []
  (0...string.size).each do |start_index|
    this_substring = string[start_index..-1]
    results.concat(leading_substrings(this_substring))
  end
  results
end

def palindromes(string)
  all_substrings = substrings(string)
  results = []
  all_substrings.each do |substring|
    results << substring if palindrome?(substring)
  end
  results
end

def palindrome?(string)
  string == string.reverse && string.size > 1
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
