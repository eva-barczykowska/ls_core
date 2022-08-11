=begin
You are given a secret message you need to decipher. Here are the things you need to know to decipher it:

For each word:

the second and the last letter is switched (e.g. Hello becomes Holle)
the first letter is replaced by its character code (e.g. H becomes 72)
Note: there are no special characters used, only letters and spaces

Examples

decipherThis('72olle 103doo 100ya'); // 'Hello good day'
decipherThis('82yade 115te 103o'); // 'Ready set go'
decipherThis('72eva 97 103o 97t 116sih 97dn 115ee 104wo 121uo 100o') // 'Have a go at this and see how you do'

#RAUL
**Problem**
Write a method that takes a string as an argument and switches the second and
last letter in every word and also replaces the character code for its
letter equivalent.
What happens if the input is an empty string?

**Example/Test Cases**
decipherThis('72olle 103doo 100ya'); // 'Hello good day'
decipherThis('82yade 115te 103o'); // 'Ready set go'
decipherThis(''); // ''

**Data Structures**
input: coded string
output: input string with each word modified

'69eamplx 115entence' => 'Example sentence'
'' => ''

**Algorithm**
Initialize an array constant containing every letter of the alphabet
within the method split the string into an array of words
Iterate through the array of words
Iterate through each word in the array
Over every iteration start a loop to identify the number at the start of each word and replace it for it's letter equivalent
  -initialize a `number` variable and push numbers into it, then identify which letter is represented by that number
  -use an `if` conditional statement to push numbers into the `number` string if they are not included in the constant array
Once it has been replaced and the word consists of only letters replace the second and last letter and add into a new array
Join the new array and separate with spaces, then return it
If the input was an empty string just return an empty string

**Code**
=end

LETTERS = ('A'..'Z').to_a + ('a'..'z').to_a

def decipherThis(str)
  arr = str.split
  arr.map do |word|
    # '72olle;
    letter_arr = word.chars
    number = ''
    letter_arr.each do |letter| # 7, # 2, # o
      if !LETTERS.include?(letter)
        number << letter
        # 1st iteration => number << 7
        # 2nd iteration => number << 2
        word[0] = ''
        # word => 2olle
        # word => 'olle'
      else
        next
      end
    end
    first_letter = number.to_i.chr
    # temp_var = word[0]
    # word[0] = word[-1]
    # word[-1] = temp_var
    word[0], word[-1] = word[-1], word[0]
    word.prepend(first_letter)
  end.join(' ')
  # new_arr.join(' ')
end

p decipherThis('72olle 103doo 100ya') == 'Hello good day'
p decipherThis('82yade 115te 103o') == 'Ready set go'
p decipherThis('') == ''

################################################################################
puts ""

# Ewa
=begin
PEDAC
-write a method that takes this string/message and deciphers it
-the 2nd and the last letter is swapped, 'Holle' -> 'Hello'
-also, the first letter is replaced by its character code

Data Structures:
input: string
output: string

Algorithm
-it it's an empty string, return an empty string
-if str.size == 1 and it's a character(do the validation!), return that character

-now the case when the first character is represented by character code - how many characters could this be?
Assumption: 2 or 3 and not more than 3, e.g. 99 or 121

- I will split the input string on a space to get an array of words
- iterate over each word and decipher each word
  - create a helper function that takes the word decipher_word
    - slice the first 3 characters
      if all of them are digits
        - decypher_numbers(array of the first 3 digit strings)
      - else
        - pop the last one character
        - decypher_numbers(array of the first 2 digit strings)
    - slice the word argument starting based on the length of the digit strings
        - store the remaining chars
        - swap the first charater with the last charater
    - concatenate the string returned by decipher_numbers + swaped String

  - create a helper function decipher_numbers(numberStringArray)
    - join them into a String
    - convert to a number
    - convert to alphabetic character
    - returns an alphabetic character

- join the decyphered word by space
I will check if the first 2 or the first 3 characters are numbers in every word
and once I know how many digits I have(2 or 3), I will convert them to a character (.chr method)

-once I obtained the first character(by reading the first 2 or 3 digits in the array),
I can place it in the result string and deal with swapped letters next

-deal with the 2nd and last character swapping
-finally return the resulting string
=end

def decipher_numbers(array_of_strings)
  str = array_of_strings.join
  str = str.to_i
  return str.chr
end

def decipher_words(str)
  digits = str.slice(0, 3).split("")
  arr_of_digits = (0..9).to_a.map { |d| d.to_s }
  # p digits
  if digits.all? { |d| arr_of_digits.include?(d)}
    first_letter = decipher_numbers(digits)
  else
    digits.pop
    first_letter = decipher_numbers(digits)
  end
  return first_letter if str.length <= 3
  remaining_chars = str.slice(digits.length, str.length)
  remaining_chars[0], remaining_chars[-1] = remaining_chars[-1], remaining_chars[0]
  first_letter + remaining_chars
end

# p decipher_words('103doo') == 'Hello'
# p decipher_numbers(['1', '0', '0'])

def decipher_this(str)
 if str.empty? || str.size < 2
  return str
 end
 array = str.split(" ")
 array.map { |word| decipher_words(word) }.join(" ")
end


p decipher_this('72olle 103doo 100ya') == 'Hello good day'
p decipher_this('82yade 115te 103o') == 'Ready set go'
p decipher_this('') == ''
p decipher_this('H') == 'H'
p decipher_this('72') == 'H'
p decipher_this('111') == 'o'

puts ""

#jd's solution

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
p decipher_this('72') == 'H'
