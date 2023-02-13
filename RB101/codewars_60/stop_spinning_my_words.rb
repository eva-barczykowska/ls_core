=begin
16. Stop gninnipS My sdroW!
(https://www.codewars.com/kata/5264d2b162488dc400000001)
6 kyu

Write a function that takes in a string of one or more words, and returns the same string, but with all words with five or more letters reversed (Just like the name of this Kata).

Strings passed in will consist of only letters and spaces.
Spaces will be included only when more than one word is present.

Examples: spinWords( "Hey fellow warriors" ) => returns "Hey wollef sroirraw"
=begin pedac

*************Problem********************
Overall goal: write a method that reverses all words > than 5 in length in a string.
initial input: string
overall output: string with words > 5 reversed

explicit requirements:
strings only consist of alphabetical chars incl spaces
spaces included only when > 1 word is present
write a method, 1 arg/string
  reverse only words >= 5 in length,
  leaves other words alone
implicit requirements:

questions:

**********Examples/Test cases************
p spinWords("Hey fellow warriors") == "Hey wollef sroirraw"
> 3, 6, 8 > 'Hey' is left alone because length < 5, 'fellow' and 'warriors' are both > 5 in length so they are reversed
p spinWords("This is a test") == "This is a test"
> 4, 2, 1, 4 > all are left alone because lengths of all are < 5
p spinWords("This is another test") == "This is rehtona test"
> the only word > 5 in length is 'another' and only that is reversed
p spinWords(“‘test”’) == “‘test”’
> test < 4 in length so is returned without reversing

*************Data Structure**************
start > array > string

***************Algorithm*****************
Overall approach: string > array of words > iterate over the array of words > if word length >= 5 then reverse the word > join words together with a space

*/ convert string to an array
details:split

*/ iterate over array, transformation, trans criteria: if word >= 5 then reverse it
details: map, reverse

*/ join the transformed array on a space  => string
details: join

=end

def spin_words(string)
  string.split.map do |word|
    if word.size >= 5
      word.reverse
    else
      word
    end
  end.join(' ')
end

p spin_words("Hey fellow warriors")  == "Hey wollef sroirraw"
p spin_words("This is a test") == "This is a test"
p spin_words("This is another test") == "This is rehtona test"