=begin
Delete vowels
Write a method that takes an array of strings, and returns an array of the same
string values, except with the vowels (a, e, i, o, u) removed.

remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

Pedac
Problem
-write a method
-the method takes a str as input
-remove vowels from the string
-return string without vowels
-vowels are (a, e, i, o, u)

Examples
remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz) # array with 1 string
remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht) # array with more than 1 string
remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

Data Structures
input: arr of 1 or more strings
output: array of 1 or more strings(without vowels!)

Algorithm
-downcase the string and remove wowels using Regex

Code
=end

def remove_vowels(arr)
  arr.map do |element|
    element.delete('aeoui').delete('AEOUI') # map will tranform the element according to the return value of the block
  end
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

puts ""

# ls solution
def remove_vowels(strings)
  strings.map { |string| string.delete('aeiouAEIOU') }
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
