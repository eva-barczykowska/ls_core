=begin
# 2. (part 1, second problem)
https://leetcode.com/problems/find-common-characters/description/
=begin

Given array of strings made only of lowercase letters,
return array of all characters that show up in all strings within the given array (including duplicates)

For example, if a character occurs 3 times in all strings, but not 4 times,
you need to include that character three times in the final answer.
=begin pedac

*************Problem********************
Overall goal: To write a method that takes an array of strings and returns a new array with the chars in common to all strings
initial input: array of strings
overall output: new array/chars

explicit requirements:
input array: only lowercase letters
rules of commonality:
  the char must be present in all strings
  duplicates are included
    ex: 2 ls are in common, need to include 2 ls in return array
return array: alphabetized ascending


implicit requirements:
if not any chars in common, return []
questions:

**********Examples/Test cases************
p common_chars(['bella', 'label', 'hello'])  == ['e', 'l', 'l']
**bella
b => not in all 3, so not returned
e => is in all 3 so returned
l => is returned twice because l is included twice in all 3 words
p common_chars(['cool', 'lock', 'cook']) == ['c', 'o']
p common_chars(['hello', 'goodbye', 'booya', 'random']) == ['o']
**o is only char in common
p common_chars(%w(aabbaaaa ccdddddd eeffee ggrrrrr yyyzzz)) == []
** if no chars in common, return empty arr

I: ['bella', 'label', 'hello']
o:  ['e', 'l', 'l']

'bella'
do all words include each char?
  'b'? no, all do not include =. do not add to return array
  'e' => yes, all do include => add to return array
  'l' => yes, all do include => add to return array
  'l' => yes, all do include => add to return array
    'a' => no, all do not include =. do not add to return array
['e', 'l', 'l'] needs to be sorted ascending
return value is ['e', 'l', 'l']


*************Data Structure**************

array > new array of chars

*************SCRATCH PAD**************
** use map
convert `word` from string to array / use chars
  select the chars that are in all words of array/ use select
  select criteria: array.all? {|word| word.include?(char)}


***************Algorithm*****************

define a method, 1 parameter `array`
iterate over the array to transform it / pass `word`
      trans criteria: iterate over each word/ pass `char` to the block
        do all words in the array include the character?
          only want to return those chars that are included in all word
          return value is nested array, each subarray is ele in common
iterate over nested array and select the subarr with least size
sort the selected array
return value of method is the selected subarr


=end

def common_chars(array)
  selected = array.map do |word|
    word.chars.select do |char|
      array.all? {|word| word.include?(char)}
    end
  end
  selected.min_by {|subarr| subarr.size}.sort
end

p common_chars(['bella', 'label', 'hello']) == ['e', 'l', 'l']
p common_chars(['cool', 'lock', 'cook'])  == ['c', 'o']
p common_chars(['hello', 'goodbye', 'booya', 'random']) == ['o']
p common_chars(%w(aabbaaaa ccdddddd eeffee ggrrrrr yyyzzz)) == []