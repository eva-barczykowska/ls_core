=begin
9.Typoglycemia Generator
(https://www.codewars.com/kata/55953e906851cf2441000032/train/ruby)
5 kyu
=begin
Background
There is a message that is circulating via public media that claims a reader can easily read a message
where the inner letters of each words is scrambled, as long as the first and last letters
remain the same and the word contains all the letters.

Another example shows that it is quite difficult to read the text where all the letters are reversed
rather than scrambled.

In this kata we will make a generator that generates text in a similar pattern,
but instead of scrambled or reversed, our will be sorted alphabetically

Requirement
return a string where:
1) the first and last characters remain in original place for each word
2) characters between the first and last characters must be sorted alphabetically
3) punctuation should remain at the same place as it started, for example: shan't -> sahn't

Assumptions
1) words are separated by single spaces
2) only spaces separate words, special characters do not, for example: tik-tak -> tai-ktk
3) special characters do not take the position of the non special characters, for example: -dcba -> -dbca
4) for this kata punctuation is limited to 4 characters: hyphen(-), apostrophe('), comma(,) and period(.)
5) ignore capitalisation
for reference: http://en.wikipedia.org/wiki/Typoglycemia

=begin pedac

*************Problem********************
Overall goal: take a given string and sort the its alphabetic characters except the first and last one
initial input: string
overall output:  mutated string or new string

explicit requirements:
returned string:
  first and last char remain same
  chars but first and last need to be sorted ascending
  punctuation remains in the same place
    hyphen(-), apostrophe('), comma(,) and period(.) are the only punctuation in the strings
  words are separated by spaces
  ignore capitalization
  if punctuation is first char or last char, ignore it


implicit requirements:
single char word > single char word
empty string returns empty string
2 char word returns same word
questions:
Do I have account for single char? empty string?
punctuation first char?
**********Examples/Test cases************
p scramble_words('professionals') == 'paefilnoorsss'
> the p and s stay in same place, the rest sorted alpha ascending
p scramble_words('i') == 'i'
> single char word returns single char
p scramble_words('') == ''
> empty string > empty string
p scramble_words('me') == 'me'
> 2 char word > same word
p scramble_words('you') == 'you'
> 3 char word returns same word
p scramble_words('card-carrying') == 'caac-dinrrryg'
> - does not separate the word. remains in same place, c and g are in same place and the rest are sorted
p scramble_words("shan't") == "sahn't"
> ' stays in same place, s and t same place, rest sorted
p scramble_words('-dcba') == '-dbca'
> - is ignored. doesnt count as first char. d, a remain in same place and the c, b are scrambled
p scramble_words('dcba.') == 'dbca.'
> punctuation last char is ignored. d a remain same, c b sorted

*************Data Structure**************
input: string
output: string

***************Algorithm*****************
-convert string argument to an array of characters
-save the special characters to an array variable `specials` - ['.', "'", '-', ',']
-initialize a hash, this is where we will store special characters and their indexes like so {4=> '-'}
-first check if the array has any characters that are are not alphabetic
-if it doesn't, just return first character of the array, middle characters sorted and the last character of the array
-join to return a string
-if array includes non alphabetical chars, iterate over this array, looking at every character and its index
-if the character is a part of `specials`, save the character as value and its index as key into a previously
 initialized hash
-delete the special characters, we can't have them because now we are going to sort our string
-sorted string -> string[0] + sort middle + string[-1]
-iterate over the clean, sorted string and insert back the special characters
-index where we need to insert will be the key from the hash, the value will be the character which we need to
 insert
-lastly, join the array to return a string/word

-now save all this to a method scramble_word. This is the code that takes care of scrambling 1 word
-now define a method scramble_words(str). Inside the method, split the string into array of words, and transform each
 using the scramble_word method.
-join the array on the space and return the string. This method takes are of strings longer than 1 word.
=end

def scramble_word(string)
  return string if string.size < 4
  hash = {}
  specials = ['.', "'", '-', ','] # initialize the punctuation to account for
  array = string.chars
  if array.any? { |char| char =~ /[^a-z]/ } # count special characters only when the word includes any!
    array.each_with_index do |char, index| # and if it does, iterate over each character and its index in the array
      if specials.include?(char) # and find out what the special char is  and what is its index
        hash[index] = char  # and store this information in a hash because you'll need it later
      end
    end

    clean_string = string.delete('^a-z') # delete all the non-alphabetic characters after I've counted them
    clean_string = clean_string[0] + clean_string[1..-2].chars.sort.join + clean_string[-1] # sort all the letters between the first one and the last one
    hash.each do |k, v| # insert back the special characters at the correct index
      clean_string.insert(k, v)
    end

    clean_string
  else
    string[0] + array[1..-2].sort.join + string[-1] # if no special chars are present, just return the chars (except 1st and last) sorted
  end

end

def scramble_words(str)
  res = str.split.map do |word|
    scramble_word(word)
  end
  res.join(" ")
end

p scramble_words('professionals')  == 'paefilnoorsss'
p scramble_words('i')  == 'i'
p scramble_words('') == ''
p scramble_words('me') == 'me'
p scramble_words('you') == 'you'
p scramble_words('card-carrying') == 'caac-dinrrryg'
p scramble_words("shan't") == "sahn't"
p scramble_words('-dcba') == '-dbca'
p scramble_words('dcba.') == 'dbca.'
p scramble_words("you've gotta dance like there's nobody watching, love like you'll never be hurt, sing like there's nobody listening, and live like it's heaven on earth.") #== "you've gotta dacne like teehr's nbdooy wachintg, love like ylo'ul neevr be hrut, sing like teehr's nbdooy leiinnstg, and live like it's haeevn on earth."

puts
puts
puts "Ilke's solution"
=begin
- initialize a constant SPECIAL_CHARS assigned to an array containing the special chars

- return the string if the string size is less than or equal to 3. This takes care of these test cases:
#p scramble_words('i') == 'i'
#p  scramble_words('') == ''
#p scramble_words('me') == 'me'
#p scramble_words('you') == 'you'

- create a words_array from the input string
- if the words_array is size 1 and the string (or word at index 0 or words_array) contains no special chars
	- then using indexed assignment, reassign the characters from index 1 to -2 to the same portion of the string
    with the characters of the string converted to a an array of chars, sorted, and rejoined to form a string
	- return the string

- else if the words_array is size 1 but the string contains any special characters
	- iterate through the words_array
		- initialize an array to store the index of the special char and the special char
		- find the index of the special char, add to special array
		- add the special char to array
		- delete the special char from the word
		- sort the inner portion of the word (in the same way as above)
		- insert the special char that was stored in the special array at the index position also stored in the special array

- else if the words_array size is more than 1 (this means the input string is a sentence)
		- iterate through the words_array
			- if the word has any special chars
				- initialize an array to store the index of the special char and the special char
				- find the index of the special char, add to special array
				- add the special char to array
				- delete the special char from the word
				- sort the inner portion of the word (in the same way as above)
				- insert the special char that was stored in the special array at the index position also stored in the special array
			- else if the word has no special chars
				- then using indexed assignment, reassign the characters from index 1 to -2 to the same portion of the word with the characters of the word converted to a an array of chars, sorted, and rejoined to form a string
- return the words_array converted back to a string

=end

SPECIAL_CHARS = ["-", "'", ",", "."]

def scramble_words(string)
  return string if string.size <= 3
  words_array = string.split(" ")

  if words_array.size == 1 && string.each_char.none? {|char| SPECIAL_CHARS.include?(char)}
    string[1..-2] = string[1..-2].chars.sort.join
    return string
  elsif words_array.size == 1 && string.each_char.any? {|char| SPECIAL_CHARS.include?(char)}
    words_array.each do |word|
      special = []
      special << word.each_char.find_index {|char| SPECIAL_CHARS.include?(char)}
      special << word[special[0]]
      word.delete!(special[1])
      word[1..-2] = word[1..-2].chars.sort.join
      word.insert(special[0], special[1])
    end
  else
    words_array.each do |word|
      if word.each_char.any? {|char| SPECIAL_CHARS.include?(char)}
        special = []
        special << word.each_char.find_index {|char| SPECIAL_CHARS.include?(char)}
        special << word[special[0]]
        word.delete!(special[1])
        word[1..-2] = word[1..-2].chars.sort.join
        word.insert(special[0], special[1])
      else
        word[1..-2] = word[1..-2].chars.sort.join
      end
    end
  end
  words_array.join(' ')
end

p scramble_words('professionals') == 'paefilnoorsss'
p scramble_words('i')  == 'i'
p scramble_words('') == ''
p scramble_words('me') == 'me'
p scramble_words('you') == 'you'
p scramble_words('card-carrying') == 'caac-dinrrryg'
p scramble_words("shan't") == "sahn't"
p scramble_words('-dcba') == '-dbca'
p scramble_words('dcba.') == 'dbca.'
p scramble_words("you've gotta dance like there's nobody watching, love like you'll never be hurt, sing like there's nobody listening, and live like it's heaven on earth.") == "you've gotta dacne like teehr's nbdooy wachintg, love like ylo'ul neevr be hrut, sing like teehr's nbdooy leiinnstg, and live like it's haeevn on earth."

puts
puts

=begin
  P: Given a string return a new string with:
    1. the first and last characters the same as the original
    2. characters between the first and last characters must be sorted alphabetically
    3. punctuation must remain in the same positions

  Examples and Rules:
    separated by single spaces, not special chars
    special chars do not take the position of alphas
      -dcba -> -dbca
    only special chars => [- ' , .]
    ignore capitalization

  Data structures
    Arrays
    hash

  Algo
    for each word
      store the index of special characters in a hash
        Iterate over the characters with index,
        if the character is not a-z,
          save the character and the index in a hash
      remove the special characters

      if there is only one special char and one alpha char
      return the word

      get the first letter
      get the last letter
      take the middle letters, sort them
      new_str is first + sorted + last
      insert special char

=end

def scramble_words(words)
  words.split(" ").map do |word|
    if word.size < 3
      word
    else
      hash = {}
      0.upto(word.size - 1) do |idx|  # retrieving index can be as easy as this:-)
        char = word[idx]
        hash[char] = idx if char =~ /[^A-Za-z]/
      end

      word = word.gsub(/[^A-Za-z]/, "")
      sorted_middle = word[1..-2].chars.sort.join
      new_word = word[0] + sorted_middle + word[-1]

      hash.each_pair do |k, v|
        new_word.insert(v, k)
      end

      new_word
    end
  end.join(" ") # this is for the last example, because so far we've only dealt with single word at a time
end
p scramble_words('professionals') == 'paefilnoorsss'
p scramble_words('i') == 'i'
p scramble_words('') == ''
p scramble_words('me') == 'me'
p scramble_words('you') == 'you'
p scramble_words('card-carrying') == 'caac-dinrrryg'
p scramble_words("shan't") == "sahn't"
p scramble_words('-dcba') == '-dbca'
p scramble_words('dcba.') == 'dbca.'
p scramble_words("you've gotta dance like there's nobody watching, love like you'll never be hurt, sing like there's nobody listening, and live like it's heaven on earth.") == "you've gotta dacne like teehr's nbdooy wachintg, love like ylo'ul neevr be hrut, sing like teehr's nbdooy leiinnstg, and live like it's haeevn on earth."

# my algorithm for this solution
# split the words on space and for each word
#   if its size is less or equal to 3, return the word
#   else initialize a `hash`
#   iterate from 0 up to word size
#   initialize `char` variable and point it to the index in the word char = word[idx]
#   save the character as a key and index as a value to the hash if a character is a special character ???------ shouldn't it be the other way round?
#
# delete special characters
# extract the middle characters [1..-2], sort them and save to a variable
# add extracted beginning of the word, its sorted middle and extracted end, save to new_word variable
#
# now iterate over the hash and insert into the new word at the right index the special character
# return the new word
#
# join everything