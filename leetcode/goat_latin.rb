=begin
Goat Latin

You are given a string sentence that consist of words separated by spaces. Each word consists
of lowercase and uppercase letters only.
We would like to convert the sentence to "Goat Latin" (a made-up language similar to Pig Latin.)

The rules of Goat Latin are as follows:
If a word begins with a vowel ('a', 'e', 'i', 'o', or 'u'), append "ma" to the end of the word.
For example, the word "apple" becomes "applema".

If a word begins with a consonant (i.e., not a vowel), remove the first letter and append it to
the end, then add "ma".
For example, the word "goat" becomes "oatgma".

Add one letter 'a' to the end of each word per its word index in the sentence, starting with 1.
For example, the first word gets "a" added to the end, the second word gets "aa" added to the end, and so on.

Return the final sentence representing the conversion from sentence to Goat Latin.
=end
=begin pedac

*************Problem********************
Overall goal: To write a method that takes a string/sentence and converts the sentence into goat latin.
initial input: string/sentence
overall output: new string/goat latin

explicit requirements:
input string:sentence, words separated by 1 space
            lowercase and uppercase char only
rules of goat latin
  1. if word begins with a vowel, add 'ma' to end of word
    ex: apple => applema
  2, if word begins with a consonate:
    a. remove first letter
    b. append letter to end of word
    c. then ad 'ma' to end of word
  3. once we transform the words, need to iterate over them and their idx. start with idx of 1 not 0
    a. add 'a' * (idx + 1)
      first word: worda
      second word: wordaa
      third word: wordaaa


implicit requirements:

questions:

**********Examples/Test cases************

p to_goat_latin("The quick brown fox jumped over the lazy dog") == "heTmaa uickqmaaa
rownbmaaaa oxfmaaaaa umpedjmaaaaaa overmaaaaaaa hetmaaaaaaaa azylmaaaaaaaaa
ogdmaaaaaaaaaa"
p to_goat_latin("I speak Goat Latin") == "Imaa peaksmaaa oatGmaaaa atinLmaaaaa"
**I + ma,  peaks + ma, oatG + ma, atinL + ma
Ima, peaksma, oatGma, atinLma
Imaa, peaksmaaa, oatGmaaaa, atinLmaaaaa
SCRATCH PAD
ex:"I speak Goat Latin"
convert to array-- use split ['I', 'speak', 'goat', 'latin']
transform words -- use map / pass each word to block
  if word starts with a vowel / start_with?(/[aeiou]/)
      word = word << 'ma'
  else reassing word to word[1..-1] + word[0] + 'ma'
ex: ['Ima', 'peaksma', 'oatGma', 'atinLma']
iterate over the transformed array and add 'a's
    use map.with_index, trans criteria: reassign word to word  + ('a' * idx + 1)
join the array together/ convert to a string
    ** join(' ')







*************Data Structure**************
string > array > string

***************Algorithm*****************
Overall approach:
DEFINE A METHOD, 1 PARAMETER STRING
CONVERT STRING TO ARRAY
ITERATE OVER ARRAY TO TRANSFORM/ PASS EACH WORD TO BLOCK
  **IF FIRST CHAR IS VOWEL
  **IF FIRST CHAR IS A CONSONATE
ITERATE OVER THE TRANSFORMED ARRAY WITH INDEX
  ** ADDING 'a' TO EACH WORD
CONVERT ARRAY TO STRING
RETURN VALUE IS STRING

=end

def to_goat_latin(string)
  array = string.split.map do |word|
    if word.start_with?(/[aeiou]/)
      word = word << 'ma'
    else
      word = word[1..-1] + word[0] + 'ma'
    end
  end
  array.map.with_index do |word, idx|
    word = word + ('a' * (idx + 1))
  end.join(' ')
end

p to_goat_latin("The quick brown fox jumped over the lazy dog") == "heTmaa uickqmaaa rownbmaaaa oxfmaaaaa umpedjmaaaaaa overmaaaaaaa hetmaaaaaaaa azylmaaaaaaaaa ogdmaaaaaaaaaa"
p to_goat_latin("I speak Goat Latin")  == "Imaa peaksmaaa oatGmaaaa atinLmaaaaa"
