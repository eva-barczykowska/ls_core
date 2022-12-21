=begin
Improved "join"

If we run the current game, we'll see the following prompt:
=> Choose a position to place a piece: 1, 2, 3, 4, 5, 6, 7, 8, 9
This is ok, but we'd like for this message to read a little better.
We want to separate the last item with a "or", so that it reads:
=> Choose a position to place a piece: 1, 2, 3, 4, 5, 6, 7, 8, or 9
Currently, we're using the Array#join method, which can only insert
a delimiter between the array elements, and isn't smart enough to display
a joining word for the last element.
Write a method called join or that will produce the following result:

joinor([1, 2])                   # => "1 or 2"
joinor([1, 2, 3])                # => "1, 2, or 3"
joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"

Then, use this method in the TTT game when prompting the user to mark a square.

PEDAC
PROBLEM
-if an array has only 2 elements, print them joining them with the word 'or'
-if the input array has more than 2 elements, we print all of them,
 separated with a comma (so a comma is our default separator)
 but before the last element insert 'or' so the default 2nd argument is 'or'
-default 3rd argument is a comma
-if the input array has more than 2 elements and
 3rd argument is passed, we use that as a divider for the elements of the array

Examples
joinor([1, 2])                   # => "1 or 2"
joinor([1, 2, 3])                # => "1, 2, or 3"
joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"

Data Structures
input: Array, 2 default parameters
output: a string, joined by default or passed arguments

Algorithm
-define a method `joinor` with 3 arguments
-the arguments are: an array, a divider, joining_word
-define a default divider and joining word
-if the array has only 2 elements, print them, joined by the joining word
-if the array has more than 2 elements, and only the array argument was passed,
 print the array separated by default separator and joined by default joining word
-if the array has more than 2 elements and both array and separator is passed,
 print the array elements as a string, joined by the separator argument and
 default joining word
-if all arguments are passed, use them to print the string using the passed
 separator and the passed argument word

Code
=end
def joinor(array, separator=', ', joining_word='or')
  return array.join if array.size == 1
  return array.join(" or ") if array.size == 2
  if array.size > 2
    array = array.join(separator).split(" ")
    array.insert(-2, joining_word)
    array.join(" ")
  end
end
p joinor([1, 2]) == "1 or 2"
p joinor([1, 2, 3]) == "1, 2, or 3"
p joinor([1, 2, 3], '; ') == "1; 2; or 3"
p joinor([1, 2, 3], ', ', 'and') == "1, 2, and 3"

# LS Solution is this
def joinor(arr, delimiter=', ', word='or')
  case arr.size
  when 0 then ''
  when 1 then arr.first.to_s
  when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(delimiter)
  end
end

