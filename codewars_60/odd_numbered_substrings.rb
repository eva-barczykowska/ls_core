=begin
Given a string of integers, return the number of odd-numbered substrings that can be formed.

For example, in the case of "1341", they are 1, 1, 3, 13, 41, 341, 1341, a
p solve("1341") = 7. See test cases for more examples.

PEDAC
P:
- write a method that takes a string of integers
- method returns the number of odd_numbered substrings that can be formed

E:
p solve("1341") == 7
=> 1, 1, 3, 13, 41, 341, 1341 == 7


p solve("1357") == 10
=> 1, 3, 5, 7, 13, 135,1357, 3, 35, 357, 57, 7 => 1, 3, 5, 7, 135, 3, 7 == 7
1 3 5 7
| | | |
1
3
5
7 start with element at index 0 and take 1 element
1, 3
1, 3, 5
1, 3, 5, 7 - start withe element at index 0 and take increasingly more elements
   3
   3, 5
   3, 5, 7 - start with element at index 1 and take increasingly more elements
      5
      5, 7 - start with element at index 2 and take increasingly more elements
        7 - start with last element and take 1 element

p solve("13471") == 12
p solve("134721") == 13
p solve("1347231") == 20
p solve("13472315") == 28

DS
input: string of integers
output: integer sifnifying number of odd-numbered integers that are possible to make out of the input Integer

A:
- initialize results array

- iterate over the input string starting from int at index 0 - that's starting index - until last char of the str excluded
- iterate from the starting index until last char of the str exncluded - this is ending_index

- itake a range of chars from char at index 0 until char at index - 1 and populate results array with the slices/substrings

- verify how many strings, if converted to int, are odd, and return that number

=end
def solve(str)
  results = []

  (0...str.size).each do |starting_index|
    (starting_index...str.size).each do |ending_index|
      results << str[starting_index..ending_index]
    end
  end

  results.count { |s| s.to_i.odd? }
end
p solve("1341") == 7
p solve("1357") == 10
p solve("13471") == 12
p solve("134721") == 13
p solve("1347231") == 20
p solve("13472315") == 28
