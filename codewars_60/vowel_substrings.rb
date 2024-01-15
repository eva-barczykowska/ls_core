=begin
The vowel substrings in the word codewarriors are o,e,a,io. The longest of these has a length of 2. Given a lowercase string that has alphabetic characters only (both vowels and consonants) and no spaces, return the length of the longest vowel substring. Vowels are any of aeiou.
PEDAC
P:
- write a method that takes a string
- string has only alphabetic characters, no spaces
- method returns the lengh of the longest vowel substring

E:
p solve("codewarriors") == 2
=> io

p solve("suoidea") == 3
=> uoi

sole("iuuvgheaae") == 4
=> eaae


p solve("ultrarevolutionariees") == 3
p solve("strengthlessnesss") == 1
p solve("cuboideonavicuar") == 2
p solve("chrononhotonthuoaos") == 5
p solve("iiihoovaeaaaoougyaw") == 8

DS:
input: string
middle: array
output: integer

A:
- initialize results empty array

- initialize vowels array and specify vowels

- change input str to array
- iterate over the array:
- initialize a counter
- initialize temp where you will store number of consecutive vowels

- while counter is <= arr.size
 - if a char is a vowel, add 1 to the temp
 - increase counter
 - if next char is a vowel, add 1 to the temp etc.

 - else add the integer from temp to results array and reasign temp to 0
 - increase the counter

 - in the end return the max number form the results array

=end
def solve(str)
  vowels = %w(a e o u i y)
  results = []
  arr = str.chars

  counter = 0
  temp = 0
  while counter <= arr.size
    if vowels.include?(arr[counter])
      temp += 1
      counter += 1
    else
      results << temp
      temp = 0
      counter += 1
    end
  end

  results.max
end
p solve("codewarriors") == 2
p solve("suoidea") == 3
p solve("iuuvgheaae") == 4
p solve("ultrarevolutionariees") == 3
p solve("strengthlessnesss") == 1
p solve("cuboideonavicuar") == 2
p solve("chrononhotonthuoaoos") == 5
p solve("iiihoovaeaaaoougyaw") == 8
