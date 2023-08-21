=begin
https://launchschool.com/exercises/29ffd590
Further Exploration
Modify this method so it will truncate the message if it will be too wide
to fit inside a standard terminal window (80 columns, including the sides of
the box). For a real challenge, try word wrapping very long messages so they
appear on multiple lines, but still within a box.

Problem
-I need to print this long string in the following way
-| + space + text(76 chars) + space + |
-80 characters space has to be filled by -| + space + text(76 chars) + space + |
-if text characters are less (because we don't want the word to be cut), then we need to add spaces to this line before we add space and |

Examples
| Our deepest fear is not that we are inadequate. Our deepest fear is that we |
| are powerful beyond measure. It is our light, not our darkness that most    |
| frightens us. We ask ourselves, 'Who am I to be brilliant, gorgeous,        |
| talented, fabulous?' Actually, who are you not to be? You are a child of    |
| God. Your playing small does not serve the world. There is nothing          |
| enlightened about shrinking so that other people won't feel insecure around |
| you. We are all meant                                                       |

Data
-I need to split this string and print lines plus | and space on both sides
-how to split this string into lines of 76 characters and print it line by line?

Algorithm - Allison
PROBLEM
- input is a string of characters
- output is an array of strings of 76 characters or less
(chopped from the input string)

-so the line has to be 76 characters or less
-I need to chop the input string into lines that are 76 characters or less
-but I should print only full words, e.g. my current method prints the text
 like this

 def draw_text(str)
   counter = 0
   until counter > str.size
   p str.slice!(0, 76)
   counter += 76
 end

"Our deepest fear is not that we are inadequate. Our deepest fear is that we "
"are powerful beyond measure. It is our light, not our darkness that most fri"
"ghtens us. We ask ourselves, 'Who am I to be brilliant, gorgeous, talented, "
"fabulous?' Actually, who are you not to be? You are a child of God. Your pla"
"ying small does not serve the world. There is nothing enlightened about shri"
"nking so that other people won't feel insecure around you. We are all meant "

I want the words not to be cut but I want the program to finish printing
when it knows the words cannot be FULLY printed

ALGORITHM
split input string into array of words
make a copy of array and save it into a variable copied_array
initialize an empty array called chopped_strings
initialize character_counter to 0
  begin iteration over copied_array
  initialize `line` to empty array
  begin iteration (while character_counter <= 76)
  slice off front of `array` and store in `word`
  push `word` onto `line`
  add length of `word` onto `character_counter`
  if `charCounter` over 76
  remove `word` from `line` and unshift back onto `arr`
end iteration

join `line` on spaces and push string onto `choppedStrings`
end iteration over copied_arr

PROBLEM
- input is an array of chopped strings to a length of 76 chars or less
- output will draw a border around that array's elements.

ALGORITHM
draw top line (80 chars)
draw spacer line (80 chars)

begin iteration over input arr
drawText(currentArrElem)
end iteration

draw spacer line (80 chars)
draw top line (80 chars)


  drawText(str)
    initalize `line` to `| `
    concat `str` to `line`
    initialize `lineLengh` to current line length
    initialize `padding` to `76 - lineLength`
    concat `padding` spaces onto `line`
    concat ` |` onto `line`
    return `line`
=end

str = "Our deepest fear is not that we are inadequate. Our deepest fear is"\
" that we are powerful beyond measure. It is our light, not our darkness that"\
" most frightens us."\
" We ask ourselves, 'Who am I to be brilliant, gorgeous, talented, fabulous?'"\
" Actually, who are you not to be? You are a child of God. Your playing small"\
" does not serve the world. There is nothing enlightened about shrinking so"\
" that other people won't feel insecure around you. We are all meant to shine,"\
" as children do. We were born to make manifest the glory of God that is"\
" within us. It's not just in some of us; it's in everyone. And as we let our"\
" own light shine, we unconsciously give other people permission to do the"\
" same. As we are liberated from our own fear, our presence automatically"\
" liberates others."

# divide the string on spaces > an array of words/strings
# see which words are fitting onto 76 character line
# keep adding words and keep checking the size of the line
# if line.size > 76, pop the last word and add it back to where it came from
# -I need some kind of temporary variable where I will store words and check for this variable size, it should not be more than 76 characters
# -if it is more I should push it to the next line

# def get_started(str)
# end
# split input string into array of words
# make a copy of array and save it into a variable copied_array
# initialize an empty array called chopped_strings
# initialize character_counter to 0
#   begin iteration over copied_array
#   initialize `line` to empty array
#   begin iteration (while character_counter <= 76)
#   slice off front of `array` and store in `word`
#   push `word` onto `line`
#   add length of `word` onto `character_counter`
#   if `charCounter` over 76
#   remove `word` from `line` and unshift back onto `arr`
# end iteration
#
# join `line` on spaces and push string onto `choppedStrings`
# end iteration over copied_arr

def draw_text(str)
  array = str.split
  copied_arr = array.dup
  # p array
  # p copied_array
end

# split input string into array of words
# make a copy of array and save it into a variable copied_array
# initialize an empty array called chopped_strings
# initialize character_counter to 0 --- I will count characters of the word added
#   begin iteration over copied_array
#   initialize `line` to empty array
#   begin iteration (while character_counter <= 76)
#   slice off front of `array` and store in `word`
#   push `word` onto `line`
#   add length of `word` onto `character_counter`
#   if `charCounter` over 76
#   remove `word` from `line` and unshift back onto `arr`
# end iteration

# join `line` on spaces and push string onto `choppedStrings`
# end iteration over copied_arr
# def draw_text(str)
#   loop do
#   puts str.slice!(0, 76)
#     break if str.size == 0
#   end
# end

# def draw_text(str)
#   p str.size
#   counter = 0
#   until counter > str.size
#     puts str[counter..(counter + 76)]
#     counter += 77
#   end
# end

p draw_text(str)
