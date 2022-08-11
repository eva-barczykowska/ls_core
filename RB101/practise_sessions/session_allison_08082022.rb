=begin
Double Char (Part 1)
Write a method that takes a string, and returns a new string
in which every character is doubled.

PEDAC
Problem
-I have to write a method that takes a string
-this method returns a NEW string
-in the new string every characters is doubled

Examples
repeater('Hello') == "HHeelllloo"
repeater("Good job!") == "GGoooodd  jjoobb!!"
repeater('') == ''

Data structures
input: string
otput: new string

Algorighm
-initialize a new string /result variable
-iterate over the argument string
-while iterating I am going to multiply each character by 2 and add the result of that mutliplication to the new string
-return the new string

Code
=end
def repeater(str)
  str.split("").map!{ |letter| letter * 2 }.join("")
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''

=begin
What is this code doing?
Firstly, I'm calling the `String#split` method on the input `str` variable in order to split
the input string by the its characters. This will give me an array of characters.

Further on, I am calling the `Array#map!` method (mutatating version) on the return value
of calling the split method on the input string (so - on the array of single characters).
The `#map` method takes a block and a block parameter.

I'm passing `|letter|` as my block parameter. The `map!` method will pass
each element of the array to the block as the block parameter (called `letter`).
The action defined in the block will be performed on each element of the array.

The action of the `map!` method calls the `String#*` method in order to multiply
every chracter by `2`. The return value of calling the `map!` method will be an
array of characters, where every character is repeated twice, e.g. `['HH', 'ee', 'll', 'll', 'oo']`.

Lastly, I am calling the `Array#join` method on the array that is mutated by `map!`
with an empty string as `join`'s argument. The empty string tells `join` to
concatenate each element of the array into a single string with no characters
between them, which results in a new string where every character is doubled.



REMARKS
Formatting - backticks and paragraphs.
Flow and clarity, shorter sentences

--------------------------------------------------------------------------------

Algorighm
-initialize a new string /result variable  ([])
-iterate over the argument string
-while iterating I am going to multiply each character by 2 and add the result
 of that mutliplication to the new string (["hh", "ee", "ll", "ll", "oo"])
-return the new string

ALTERNATIVE ALGORITHM
create a variable `newStr` and init it to an empty string.
Iterate over the input string
concatenate the current character twice onto `new_str`
return `new_str`

Different approach because something else comes to mind.
My solution to this has been: When I find my head branching to a different solution:
1. Copy by algorithm up to point of branching.
2. Finish both algorithms as far as I can get them.

This approach is good practice outside of the interview because:
 1. Your head starts considering these branches MUCH sooner in the process.
 2. You get used to exploring alternative algorithms and it helps your head decide
    which path it likes more without actually going through the full process.

Want to jump into code to check if on the right path.
- Where you expect a change or a result, start typing out that change with
each line in your algorithm. Use the REPL (or any available terminal) to help you
test methods and see what they look like.
An important thing here though is to carefully consider the data
with which you are testing.
=end
