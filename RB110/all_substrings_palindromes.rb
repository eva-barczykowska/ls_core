=begin
Write a method that returns a list of all substrings of a string that are palindromic. That is, each substring must
consist of the same sequence of characters forwards as it does backwards. The return value should be arranged in the
same sequence as the substrings appear in the string. Duplicate palindromes should be included multiple times.

You may (and should) use the substrings method you wrote in the previous exercise.

For the purposes of this exercise, you should consider all characters and pay attention to case; that is, "AbcbA"
is a palindrome, but neither "Abcba" nor "Abc-bA" are. In addition, assume that single characters are not palindromes.

P:
- write a method that takes a str as an arg
- the method creates all possible substrings (helper method?)
- method returns substrings that are palindromes BUT
- case matters:
- "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are
- return value should be in the same sequence as in the orig str
- include duplicates

- create a helper method to retrieve substrings

E:
p palindromes('abcd') == []
=> return [] if no palidromes found

p palindromes('madam') == ['madam', 'ada']
=>
m, ma, mad, mada, madam
-a, ad, ada, adam
--d, da, dam

p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == ['nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt']

A:
- helper method `get_subrings` array
- outer iteration, from the character at index 0 to the one but last character (exclusive range or str.size - 1) -
  I don't want the last character as the starting character --- starting index
 - inner iteration is from starting_index + 1 until the end of str inclusive (I want the last character)

- at each iteration save characters as the range from the imput array, a range of characters  at those indices
  - arr[starting_index..ending_index] to `substrings`

- returns an array of of substrings

-test the help method (write test cases)
--
main Method
- initialize `result`
- get substrings with the helper method
- iterate through, if the substring is a palindrome, select and add it to `result`
- return `result`
=end

def get_substrings(str)
  substrings = []

  (0...str.size).each do |starting_index| # excluding index 3 (size is 4, excludes 3 => so up to 3) - I don't want d as a starting character
    ((starting_index + 1)..(str.size - 1)).each do |ending_index| # if I want the last character, I need to do ..(str.size - 1)
      substrings << str[starting_index..ending_index]
    end
  end
  substrings
end
p get_substrings('abcd')# == ["ab", "abc", "abcd", "bc", "bcd", "cd"]


def palindromes(str)
  substrings = get_substrings(str)

  substrings.select { |s| s == s.reverse }
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == ['nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt']