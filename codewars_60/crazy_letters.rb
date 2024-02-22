=begin
input = string of words and other things
output = an array with each character as elements; each character needs to alternate between lowercase and uppercase letters (even indexes - lowercase; odd indexes - uppercase)


- delete everytning that's not an alphbet
- initialize an empty array `result`
- iterate through the String with index. for each character:
  -downcase the even index character; upcase the odd index character
  -push char into the result
-return the result array
=end

# word = 'what-a-b.e.a.utiful day!'

# # Your Code Here
# def crazy_letters(word)
#   clean_string = word.delete('^A-Za-z')
#   result = []
#   clean_string.each_char.with_index do |char, index|
#     char = index.even? ? char.downcase : char.upcase
#     result << char
#   end
#   result
# end


# p crazy_letters(word) #== ['w', 'H', 'a', 'T', 'a', 'B', 'e', 'A', 'u', 'T', 'i', 'F', 'u', 'L', 'd', 'A', 'y']
puts

=begin
# word = 'what-a-b.e.a.utiful day!' - this is the input, expected output:
# p crazy_letters(word) #== ['w', 'H', 'a', 'T', 'a', 'B', 'e', 'A', 'u', 'T', 'i', 'F', 'u', 'L', 'd', 'A', 'y']

P:
- I see that non-alphabet characters have been removed from the string input
- an array of characters is returned
- characters at even index are downcased, at odd index are upcased

DS:
input: string
output: array

A:
-define alphabet
- change str to array
- delete each char that is not an alphabet char
- iterate with index and:
-- downcase even index
-- upcase odd index

-return the array
=end
word = 'what-a-b.e.a.utiful day!'

def crazy_letters(word)
  array = word.chars
  alphabet = ('a'..'z').to_a + ('A'..'Z').to_a

  array = array.reject { |ch| !alphabet.include?(ch) }

  array.each.with_index do |letter, index|
    letter.downcase! if index.even?
    letter.upcase! if index.odd?
  end

  array
end
p crazy_letters(word) == ['w', 'H', 'a', 'T', 'a', 'B', 'e', 'A', 'u', 'T', 'i', 'F', 'u', 'L', 'd', 'A', 'y']
