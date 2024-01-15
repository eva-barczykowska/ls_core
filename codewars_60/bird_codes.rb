=begin
In the world of birding there are four-letter codes for the common names of birds. These codes are created by some simple rules:

    If the bird's name has only one word, the code takes the first four letters of that word.
    If the name is made up of two words, the code takes the first two letters of each word.
    If the name is made up of three words, the code is created by taking the first letter from the first two words and the first two letters from the third word.
    If the name is four words long, the code uses the first letter from all the words.

(There are other ways that codes are created, but this Kata will only use the four rules listed above)

Complete the function that takes an array of strings of common bird names from North America, and create the codes for those names based on the rules above. The function should return an array of the codes in the same order in which the input names were presented.

Additional considertations:

    The four-letter codes in the returned array should be in UPPER CASE.
    If a common name has a hyphen/dash, it should be considered a space.

Example
If the input array is: ["Black-Capped Chickadee", "Common Tern"]
The return array would be: ["BCCH", "COTE"]

PEDAC
P:
- write a method that takes birds names and returns codes according to the rules above
- codes have to be in CAPITALS
- if there is - in the name, this could be considered as a space
Rules:
 - one word: first four letters of that word

-two words, the code takes the first two letters of each word

- three words - the first letter from the first two words and the first two letters from the third word.

-four words long, the code uses the first letter from all the words

E:
p bird_code(["Common Tern", "Black-Capped Chickadee"]) == ["COTE","BCCH"]
=> COTE BCCH

p bird_code(["American Redstart", "Northern Cardinal", "Pine Grosbeak", "Barred Owl", "Starling", "Cooper's Hawk", "Pigeon"]) == ["AMRE", "NOCA", "PIGR", "BAOW", "STAR", "COHA", "PIGE"]
=>

p bird_code(["Great Crested Flycatcher", "Bobolink", "American White Pelican", "Red-Tailed Hawk", "Eastern Screech Owl", "Blue Jay"]) == ["GCFL", "BOBO", "AWPE", "RTHA", "ESOW", "BLJA"]

DS:
input: an array of strings
middle: Array
oputput: is an array of strings

N:
1: arr[0..3]
2: arr[0][0..1] + arr[1][0..1]
3: arr[0][0] + arr[1][0] + arr[2][0..1]
4: arr[0][0] + arr[1][0] + arr[2][0] + arr[4][0]
sub

A:
- initialize codes to []

- iterate over the input array and analize every word
- if word contains '-' replace it with " "

- split each str

if size of array is equal to 1, take first 4 elements
if size of array is equal to 2, take first 2 letters of each word
if size of array is equal to 3, take first letter of each word + 2 letters from the rd word
if size of array is equal to 3, take first letter of each word + 2 letters from the rd word
  if size of array is equal to 4, take first letter of each word

  - save codes into the codes array

  - transform this array into CAPITAL CODES:
  - if it's a str, upcase it
  - if it is an array, tranform into str and upcase it
- make it a 1 dimentional array
=end
def bird_code(arr)
  codes = []

  arr = arr.each { |name| name.sub!('-', ' ') }
  arr = arr.map { |arr| arr.split }


  arr.each do |subarr|
    if subarr.size == 1
      codes << subarr[0..3]
    elsif subarr.size == 2
      codes << subarr[0][0..1] + subarr[1][0..1]
    elsif subarr.size == 3
      codes << subarr[0][0] + subarr[1][0] + subarr[2][0..1]
    else
      codes << subarr[0][0] + subarr[1][0] + subarr[2][0] + subarr[4][0]
    end
  end

  codes.each do |element|
    if element.is_a?(String)
      element = element.upcase!
    else
      element = element.join.upcase!
    end
  end

  codes.flatten

end
# p bird_code(["Common Tern", "Black-Capped Chickadee"]) == ["COTE","BCCH"]

p bird_code(["American Redstart", "Northern Cardinal", "Pine Grosbeak", "Barred Owl", "Starling", "Cooper's Hawk", "Pigeon"]) #== ["AMRE", "NOCA", "PIGR", "BAOW", "STAR", "COHA", "PIGE"]

p bird_code(["Great Crested Flycatcher", "Bobolink", "American White Pelican", "Red-Tailed Hawk", "Eastern Screech Owl", "Blue Jay"]) #== ["GCFL", "BOBO", "AWPE", "RTHA", "ESOW", "BLJA"]


