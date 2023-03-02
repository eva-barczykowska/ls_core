=begin
52. Decipher this!
https://www.codewars.com/kata/581e014b55f2c52bb00000f8
Decipher this!
6 kyu

You are given a secret message you need to decipher. Here are the things you need to know to decipher it:

For each word:

the second and the last letter is switched (e.g. Hello becomes Holle)
** index 1 and index -1 are switched
the first letter is replaced by its character code (e.g. H becomes 72)
** index char is replaced by it's ord value

Note: there are no special characters used, only letters and spaces

Examples

decipherThis('72olle 103doo 100ya'); // 'Hello good day'
** 72olle > Holle > Hello, 103doo >
decipherThis('82yade 115te 103o'); // 'Ready set go'

=begin pedac

*************Problem********************
Overall goal: to write a method that takes a string of coded words and returns a string of the deciphered words
initial input: string of coded words
overall output: string of deciphered words

explicit requirements:
coded words:
  first part is a number that represents the ord value of a letter
    need to convert number to a letter
  need to switch index 1 and -1
no special chars used
  string consists of nums, alpha chars- lowercase, spaces


implicit requirements:
spaces are ignored and maintained
questions:

**********Examples/Test cases************
p decipher_this("65 119esi 111dl 111lw 108dvei 105n 97n 111ka") == "A wise old owl lived in an oak"
**the num in begining of word can have 2 or 3 digits, every word is coded the same way
p decipher_this("84eh 109ero 104e 115wa 116eh 108sse 104e 115eokp") == "The more he saw the less he spoke"
p decipher_this("84eh 108sse 104e 115eokp 116eh 109ero 104e 104dare") == "The less he spoke the more he heard"
p decipher_this("87yh 99na 119e 110to 97ll 98e 108eki 116tah 119esi 111dl 98dri") == "Why can we not all be like that wise old bird"
p decipher_this("84kanh 121uo 80roti 102ro 97ll 121ruo 104ple") == "Thank you Piotr for all your help"

*************Data Structure**************
string/coded > new string/deciphered/not coded

***************Algorithm*****************
-initialize an alphabet
-first iterate over this string, change it to an array maybe and retrieve all the numbers
-when you have an array of numbers, iterate through it and find out what are these letters by confiming ch.ord with the alphabet
-write a separate method for this? a method that would take an array of nums and return an array of characters

-now with multiple assignment switch the first and last letters of the word in the array of words
- I have proper words now but their first letter is missing, add the first letter for every word
-join the array so that it becomes a string

=end

ALPHABET = ('A'..'Z').to_a + ('a'..'z').to_a
# p 'H'.ord # 72

def decipher_this(string)
  codes = [] # extract codes fist
  string.split.each { |elem| codes << elem.scan(/[0-9]/) } # this gives me a nested array with all the numbers 1 by 1 from each word in separate arrays
  codes.map! { |subarray| subarray.join }.map! { |str| str.to_i } # I need to transform this array os strings into an array of numbers

  letters_array = [] # transform codes into letters
  codes.each do |code|
    ALPHABET.each do |letter|
      letters_array << letter if code == letter.ord
    end
  end

  result = []
  string.split.each { |word| result << word.chars.select { |ch| ch =~ /[A-Za-z]/ } } # get rid of numbers in the string, this gives me [[], ["e", "s", "i"], ["d", "l"], ["l", "w"], ["d", "v", "e", "i"], ["n"], ["n"], ["k", "a"]]

  swapped = result.each do |arr| # swapping first and last letter
    arr[0], arr[-1] = arr[-1], arr[0]
  end

  counter = 0 # insert previously prepared letters
  final = []

  loop do
    swapped.each do |array|
      final << array.prepend(letters_array[counter])
      counter += 1
    end
    break if counter > letters_array.size - 1
  end

  final.map { |array| array.join }.join(" ")
end

p decipher_this("65 119esi 111dl 111lw 108dvei 105n 97n 111ka")  == "A wise old owl lived in an oak"
p decipher_this("84eh 109ero 104e 115wa 116eh 108sse 104e 115eokp") == "The more he saw the less he spoke"
p decipher_this("84eh 108sse 104e 115eokp 116eh 109ero 104e 104dare") == "The less he spoke the more he heard"
p decipher_this("87yh 99na 119e 110to 97ll 98e 108eki 116tah 119esi 111dl 98dri") == "Why can we not all be like that wise old bird"
p decipher_this("84kanh 121uo 80roti 102ro 97ll 121ruo 104ple") == "Thank you Piotr for all your help"

puts
# Kim's solution
def decipher_this(string)
  return_array = []
  alpha_array = ('a'..'z').to_a + ('A'..'Z').to_a
  string.split.each do |word| # '65', 119esi'
    temp_string = ''

    nums = word.chars.select {|char| char !~ /[a-zA-Z]/}.join # '65', '119' 
    letters = word.chars.select {|char| char =~ /[a-zA-Z]/}.join # '', 'esi', 'dl', 'lw'

    alpha_array.each { |char|  temp_string << char if char.ord == nums.to_i} # add char that matches nums

    if letters.size == 1 || letters.empty?
      temp_string << letters
    else letters = letters[-1] + letters[1...-1] + letters[0]
    temp_string << letters
    end

    return_array << temp_string

  end
  return_array.join(' ')

end

p decipher_this("65 119esi 111dl 111lw 108dvei 105n 97n 111ka")  == "A wise old owl lived in an oak"
p decipher_this("84eh 109ero 104e 115wa 116eh 108sse 104e 115eokp") == "The more he saw the less he spoke"
p decipher_this("84eh 108sse 104e 115eokp 116eh 109ero 104e 104dare") == "The less he spoke the more he heard"
p decipher_this("87yh 99na 119e 110to 97ll 98e 108eki 116tah 119esi 111dl 98dri") == "Why can we not all be like that wise old bird"
p decipher_this("84kanh 121uo 80roti 102ro 97ll 121ruo 104ple") == "Thank you Piotr for all your help"

