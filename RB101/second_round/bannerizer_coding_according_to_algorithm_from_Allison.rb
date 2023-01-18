=begin
Algorithm - Allison
PROBLEM
- input is a string of characters
- output is an array of strings of 76 characters or less
- words should not be cut in half when transferring from one line to another
(chopped from the input string)

ALGORITHM
-split input string into `arr` array of words
-make a copy of `arr` into `copyArr`
-initialize empty array `choppedStrings`
-initialize `charCounter` to 0
-begin iteration over `copyArr`
-initialize `line` to empty array
-begin iteration (while charCounter <= 76)
-slice off front of `arr` and store in `word`
-push `word` onto `line`
-add length of `word` onto `charCounter`
-if `charCounter` over 76
-remove `word` from `line` and unshift back onto `arr`
-end iteration

-join `line` on spaces and push string onto `choppedStrings`
-end iteration over `copyArr`

PROBLEM
- input is an array of chopped strings to a length of 76 chars or less
- output will draw a border around that array's elements.

ALGORITHM
-draw top line (80 chars)
-draw spacer line (80 chars)

-begin iteration over input arr
-drawText(currentArrElem)
-end iteration

    draw spacer line (80 chars)
    draw top line (80 chars)


-drawText(str)
-initialize `line` to `| `
-concat `str` to `line`
-initialize `lineLengh` to current line length
-initialize `padding` to `76 - lineLength`
-concat `padding` spaces onto `line`
-concat ` |` onto `line`
 -return `line`
=end

str = "Our deepest fear is not that we are inadequate. Our deepest fear is that we are powerful beyond measure. It is our light, not our darkness that most frightens us. We ask ourselves, 'Who am I to be brilliant, gorgeous, talented, fabulous?' Actually, who are you not to be? You are a child of God. Your playing small does not serve the world. There is nothing enlightened about shrinking so that other people won't feel insecure around you. We are all meant to shine, as children do. We were born to make manifest the glory of God that is within us. It's not just in some of us; it's in everyone. And as we let our own light shine, we unconsciously give other people permission to do the same. As we are liberated from our own fear, our presence automatically liberates others."
# first started coding according to Allison's algorithm

# def get_lines(str)
#   copied_str = str # why do we need to make a copy?
#   arr = copied_str.split("") # splitting on a character, an array of characters
#   array_of_chopped_strings = [] # this will be my result
#   character_counter = 0
#   arr.each do |character| # iterate over each character
#     line = []
#     while character_counter < 76
#       line << character # this will give me 76 characters
#       character_counter += 1 # increase counter by 1 each time you add a character to the temporary line array
#       if line.size > 76
#         space = line.rindex(" ") #let's say it's 73
#         line.pop([space..-1]) # removing the excess characters from line
#         array_of_chopped_strings << line
#       end
#       end
#     array_of_chopped_strings
#       end
#     end
#
# p get_lines(str)

# I was not able to come up with a working solution coding according to Allison's algorithm
# but the algorithm gave me ideas to create temporary variable

# Algorithm - Ewa
# *** Reminding myself of the problem ***

# PROBLEM
# - input is a string of characters
# - output is an array of strings of 76 characters or less
# - words should not be cut in half when transferring from one line to another
# (chopped from the input string)

# Algorithm
# initialize `lines` array that will be ultimately returned from this method
# start looping over the input string
# initialize a `temp` variable where you will always take 76 characters from the input string (and then again 76 etc...)
# single out a group of 76 characters and save it to the temp
# from this group, where is the last space? - find out
# cut characters from the string until this space(included)
# append the characters that you have just cut to `lines` array
# increase the start variable (the variable that signifies the starting index - where you start cutting the string from)
# because in the next iteration you don't want to start cutting from the same index, otherwise you will never finish cutting lol
# do this (i.e. cutting, appending and moving on to the next set of 76 characters) until there are no more characters left
# return the `lines` array

# well, there is a problem with my loop:
# last value of `start` in the loop is 767 and str.size is 775, this means that
# we break out of the loop and the last word is not included
# I tried to break later, e.g. `break if start > 775 + 76` but this does not break out from the loop
# why not? Maybe coz Ruby sees only 775 first and then immediately breaks? I'm not sure -- does Amy know? :-)
# I think this is because if my target, which is 75 characters has more consecutive spaces BUT
# when we use str[start, how_many_chars] like so str[0, 55] AND there str has only 5 characters,
# Ruby will NOT take those 5 characters and add 50 spaces. Ruby only takes what is there, 5 characters.
# And in those 5 characters, there is no space... so...
# there is NO possibility to cut the string from starting point to the last space (coz I don't have the space variable!)
# that is why, I'm using an if condition
# end

def get_lines(str)
  lines = []
  start = 0
  loop do
    break if start >= str.size
    temp = str[start, 75]
    space = temp.rindex(" ")
    if temp.chars.include?(" ") && space != 0 # [' ', 'o', 't', 'h', 'e', 'r', 's', '.']
      lines << str[start, space]
      start += lines.last.size # why can't I do start += space?
    else
      lines << str[start..-1]
      start += lines.last.size
    end
  end
  puts lines
end

get_lines(str)

