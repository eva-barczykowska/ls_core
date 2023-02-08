=begin

https://www.codewars.com/kata/59d9ff9f7905dfeed50000b0)
7 kyu

Alphabet symmetry
Consider the word "abode". We can see that the letter a is in position 1 and b is in position 2.
In the alphabet, a and b are also in positions 1 and 2.
Notice also that d and e in abode occupy the positions they would occupy in the alphabet,
which are positions 4 and 5. Given an array of words,
return an array of the number of letters that occupy their positions in the alphabet for each word.
For example:
solve(["abode","ABc","xyzD"]) = [4, 3, 1]

Input will consist of alphabet characters, both uppercase and lowercase. No spaces.

*************Problem********************
Overall goal: count the number of letters that are in the same position that they are in the alphabet
initial input: array of string or strings
overall output: array of integers/integers are the count

explicit requirements:
only alphabetical chars, both upper and lower cases
count uppercase as lowercase, A == a same count


implicit requirements:
output array has same length as input array(3 string => 3 elements)
questions:

**********Examples/Test cases************
p solve(["abode","ABc","xyzD"]) == [4,3,1]
=> 4 chars in the correct position => 4, 3 in the correct position => 3, 1 in the correct position => 1
p solve(["abide","ABc","xyz"]) == [4,3,0]
if nothing correct position => 0
p solve(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"])== [6,5,7]

p solve(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]



*************Data Structure**************
array >

***************Algorithm*****************
1. initialize alphabet array [a,b,c..], array[0] == a, array[1]==b
details: ('a..'z').to_a
2.string 'abide' string[0] == a, string [1] == b
details:
3.iterate over array 'abide' using map
details:downcase string, initialize count = 0
4. iterate over string using each char with index a b i d e
details: if char == alphabet array[index], count += 1
5. return count
details:
6.
details:
=end

def solve(array)
  alphabet = ('a'..'z').to_a
  array.map do |word|
    count = 0
    word.downcase.each_char.with_index do |char, index|
      count += 1 if char == alphabet[index]
    end
    count
  end
end

p solve([ "abode", "ABc", "xyzD" ]) == [4,3,1]
p solve([ "abide", "ABc", "xyz" ]) == [4,3,0]
p solve([ "IAMDEFANDJKL", "thedefgh", "xyzDEFghijabc" ])== [6,5,7]
p solve([ "encode", "abc", "xyzD", "ABmD" ]) == [1, 3, 1, 3]

