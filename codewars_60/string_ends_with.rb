# https://www.codewars.com/kata/51f2d1cafc9c0f745c00037d

=begin

Complete the solution so that it returns true if the first argument(string) passed in ends with the 2nd argument (also a string).

Examples:

solution('abc', 'bc') // returns true
solution('abc', 'd') // returns false
PEDAC
P:
Write a method that returns a boolean value true or false
true if the first string ends with the second
false if it doesn't

E:
solution('abcde', 'cde') == true
solution('abcde', 'abc') == false
solution('abcde', '') == true

DS:
input: 2 strings
output: true or false (a boolean value)

A:

deal with an empty string separately

-how long is the 2nd argument? record its size in a variable n
-divide both strings into an array
-ask if the last n size elements of both arrays are the same


=end

def solution(str1, str2)

  n = str2.size
  array1 = str1.split("")
  array2 = str2.split("")

  array1.last(n) == array2.last(n)
end

p solution('abcde', 'cde') == true
p solution('abcde', 'abc') == false
p solution('abcde', '') == true

puts

def solution(str1, str2)
  return true if str2.empty?

  n = str2.size
  str1[-n..-1] == str2[-n..-1]

end

p solution('abcde', 'cde') == true
p solution('abcde', 'abc') == false
p solution('abcde', '') == true

puts

def solution(str, ending)
  str.end_with?(ending)
end

p solution('abcde', 'cde') == true
p solution('abcde', 'abc') == false
p solution('abcde', '') == true