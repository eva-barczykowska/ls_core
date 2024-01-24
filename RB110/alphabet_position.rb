=begin
Consider the word "abode".
The letter `a` is in position 1 and `b` is in position 2.
In the alphabet, `a` and `b` are also in positions 1 and 2.

The letters `d` and `e` in "abode" occupy the positions they would occupy in the
alphabet, which are positions 4 and 5.

Given an array of words, return an array of the number of letters that occupy their
positions in the alphabet for each word. For example,

solve(["abode","ABc","xyzD"]) == [4, 3, 1]

Input will consist of alphabetic characters, both uppercase and lowercase.  No spaces.

solve(["abode","ABc","xyzD"]) == [4,3,1]
solve(["abide","ABc","xyz"])  == [4,3,0]
solve(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"]) == [6,5,7]
solve(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]

PEDAC
P:
- find out how many letters in a given word occupy the same position as they occupy in the alhabet
- arg to the method can be a lowercase str, uppercase str or mixed

E:
puts solve(["abode","ABc","xyzD"])  == [4,3,1]
=> for "abode" it's 4 letters: a,b,d, e
=> for ABc it's 3 lettes
=> for xyzD it's 1 letter => [4,3,1]

puts solve(["abide","ABc","xyz"])  == [4,3,0]
=>
puts solve(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"]) == [6,5,7]
puts solve(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]

input: array of strings
output: array of integers
=begin
A:
- initialize `result` []
- downcase the array of strings

- define lowercase alphabet

- iterate over the array of strings
- at each iteration, split the word into characters
- iterate over these characters with index
- if at index 0 we have the same character in the word as in the alphabet, add 1 to count
- when finished iterating over the word, add count to `result` array AND
- reassign count to 0 because for the next word we need to start counting from 0
- when finished iterating over the array of words, return `result`
=end

puts "TA session"
def solve(arr)
  arr = arr.map { |str| str.downcase }
  result = []
  alphabet = ("a".."z").to_a
  count = 0

  arr.each do |word|
    word.chars.each_with_index do |_, index|
      count += 1 if word[index] == alphabet[index] # is the letter at the current index same in word and alphabet?
    end
    result << count
    count = 0
  end

  result
end
p solve(["abode","ABc","xyzD"])  == [4,3,1]
p solve(["abide","ABc","xyz"])  == [4,3,0]
p solve(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"]) == [6,5,7]
p solve(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]