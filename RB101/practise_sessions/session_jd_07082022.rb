=begin
You are given a secret message you need to decipher. Here are the things you need to know to decipher it:

For each word:

the second and the last letter is switched (e.g. Hello becomes Holle)
the first letter is replaced by its character code (e.g. H becomes 72)
Note: there are no special characters used, only letters and spaces

Examples

decipher_this('72olle 103doo 100ya'); // 'Hello good day'
decipher_this('82yade 115te 103o'); // 'Ready set go'
decipher_this('72eva 97 103o 97t 116sih 97dn 115ee 104wo 121uo 100o') // 'Have a go at this and see how you do'


given a code where the first letter is it's ASCII digit and the second and last letters are swapped. Switch the code to decipher the message.

data structures:
input: String
middle: Array of strings
output: String

Algorithm:
split up each word by the spaces and then iterate through each element. Split the word into it's digit and letters. Transform the num string into ASCII letter and swap the 2nd(now first) letter from the string with the last. Join the strings and then join the total array of strings, split by spaces.

Given a string with a secret message
Split the string by its spaces
iterate through each element
  assign the digit part of the string to a digit variable
  assign the word part of the string to a word variable
  transfrom the digit to its ASCII value
  swap the first and last letter of the word variable
  join digit and word variable and return into original array of strings
join the transformed array back into a single string.
=end

def decipher_this(message)
  arr = message.split
  arr.map! do |code|
    digit = code.gsub(/[A-z]/,'')
    word = code.gsub(/\d/, '')
    digit = digit.to_i.chr
    if word.size > 1
      word[0], word[-1] = [word[-1], word[0]]
    end
    digit + word
  end.join(' ')
end

p decipher_this('72olle 103doo 100ya') == 'Hello good day'
p decipher_this('82yade 115te 103o') == 'Ready set go'
p decipher_this('72eva 97 103o 97t 116sih 97dn 115ee 104wo 121uo 100o') == 'Have a go at this and see how you do'
p decipher_this('72')

puts ""
=begin
Uppercase Check
Write a method that takes a string argument, and returns true if all of the alphabetic characters inside the string are uppercase, false otherwise. Characters that are not alphabetic should be ignored.

Problem
-write a method that takes a str argument and returns true if all of the alphabetic characters are uppercase, non-alphabetic characters are ignored.

Data Structures
input: string
output: boolean

Examples
uppercase?('t') == false
uppercase?('T') == true
uppercase?('Four Score') == false
uppercase?('FOUR SCORE') == true
uppercase?('4SCORE!') == true
uppercase?('') == true

Algorithm
declare a constant ALPHABET variable
-declare a constant array with alphabetic CAPITAL characters
-divide the string into single characters, this will give me an array
-iterate over the array and check if all the elements are present in the array of letters
-and if they are capital letters, return true

Code
=end
ALPHABET = ('a'..'z').to_a + ('A'..'Z').to_a
CAPITALS = ('A'..'Z').to_a

def uppercase?(str)
  str = str.split("")
  letters = str.select{ |letter| ALPHABET.include?(letter) }
  letters.all?{|letter| CAPITALS.include?(letter) }
end

def uppercase?(str)
  str = str.dup
  str.upcase! == nil #if no change was made, upcase method returns nil
end

def uppercase?(str)
  str == str.upcase
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true


=begin
Triangle Sides
A triangle is classified as follows:

equilateral All 3 sides are of equal length
isosceles 2 sides are of equal length, while the 3rd is different
scalene All 3 sides are of different length
To be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of the longest side, and all sides must have lengths greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

Write a method that takes the lengths of the 3 sides of a triangle as arguments, and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending on whether the triangle is equilateral, isosceles, scalene, or invalid.

Examples:

triangle(3, 3, 3) == :equilateral
triangle(3, 3, 1.5) == :isosceles
triangle(3, 4, 5) == :scalene
triangle(0, 3, 3) == :invalid
triangle(3, 1, 1) == :invalid

problem:
write a method that takes 3 parameters as integers representing the sides of a Triangle.
based on the input determine the type of triangle or if it is invalid.

Rules:
1. the sum of the lengths of the two shortest triangles, must be greater than the length of the longest side.
2. all sides must have a length greater than 0
3. :equilateral - all sides the same length
4. :scalene all sides are different
5. :isosceles - two sides are equal length.

input: 3 integers
middle: array
output: symbol

algorithm:
check that the inputs are valid (all greater than 0 and two shorter sides sum is longer than the longest side. Retrun invalid if neither is true. compare all the sides. if same size return equi. if two shorter sides are equal return isos. if all are different return scale.

Given 3 integers
combine into Array and sort
return invalid if any integers are 0
return invalid if the sum of the 2 smaller numbers is less than or equal to the last numbers
test if all sides are equal
  if so return :equilateral
if two smaller sides are equal
  return isosceles
else
  return scalene
=end

# def triangle(side1, side2, side3)
#   sides = [side1, side2, side3].sort
#   return :invalid if sides.any?(0)
#   return :invalid if sides[0,2].sum <= sides[-1]
#   if sides.all?(sides[0])
#     return :equilateral
#   elsif sides.any? { |num| sides.count(num) == 2 }
#     return :isosceles
#   else
#     return :scalene
#   end
# end

# p triangle(3, 3, 3) == :equilateral
# p triangle(3, 3, 1.5) == :isosceles
# p triangle(3, 4, 5) == :scalene
# p triangle(0, 3, 3) == :invalid
# p triangle(3, 1, 1) == :invalid
puts ""
=begin
Name Swapping
Write a method that takes a first name, a space, and a last name passed as a single String argument, and returns a string that contains the last name, a comma, a space, and the first name.

Problem
-write a method that returns a string
-the string is a swapped surname and name, separated by a coma and space

Data Structures
-input: string
-output: string

Examples
swap_name('Joe Roberts') == 'Roberts, Joe'

Algorithm
-split the string on a space, this will give me an array
-reverse this array
-join this array on a comma

Code
=end
puts ""

# def swap_name(name)
#   name.split.reverse.join(", ")
# end

def swap_name(string)
  (string << ",").split.reverse.join(" ")
end

p swap_name('Joe Roberts') == 'Roberts, Joe'

puts " "
# methods split and join

p 'apple banana'.split('b') == ['apple ', 'anana']

p 'apple pear'.split('p') == ['a', '', 'le ', 'ear']

p 'Ape horse hippo'.split('r') == ['Ape ho', 'se hippo']

p ['Ape ho', 'se hippo'].join('r') == 'Ape horse hippo' #back to the string!
