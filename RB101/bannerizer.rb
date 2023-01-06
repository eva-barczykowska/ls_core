# # Write a method that will take a short line of text, and print it within a box.
#
# # def print_in_box(phrase)
# #   text_space = phrase.length + 2
# #   puts "+" + "-" * text_space + "+"
# #   puts "|" + " " * text_space + "|"
# #   puts "|" + " " + phrase + " " + "|"
# #   puts "|" + " " * text_space + "|"
# #   puts "+" + "-" * text_space + "+"
# # end
# #
# # print_in_box('To boldly go where no one has gone before.')
# # print_in_box('Love is all around.')
# # print_in_box('Ewa is the best.')
# # print_in_box('')
# #
# # print_in_box('To boldly go where no one has gone before.')
# # +--------------------------------------------+
# # |                                            |
# # | To boldly go where no one has gone before. |
# # |                                            |
# # +--------------------------------------------+
#
# ls solution:
def print_in_box(message)
  horizontal_rule = "+#{'-' * (message.size + 2)}+"
  empty_line = "|#{' ' * (message.size + 2)}|"

  puts horizontal_rule
  puts empty_line
  puts "| #{message} |"
  puts empty_line
  puts horizontal_rule
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('Love is all around.')
print_in_box('Ewa is the best.')
print_in_box('')
puts
#
# # Further exploration:
# # 1.
# # Modify this method so it will truncate the message if it will be too wide
# # to fit inside a standard terminal window
# # (80 columns, including the sides of the box).
# # For a real challenge, try word wrapping very long messages so they appear
# # on multiple lines, but still within a box.
#
# # Algorithm:
# # -the length of the box depends on the first line, which is 80 characters
# # -only print as many words as fits, don't cut the words in half
# # -print the rest of the phrase on the consequitive line
#
# def print_in_box(phrase)
#   p phrase.size
#   text_plus_two_spaces = phrase.length + 2
#   if phrase.size > 80
#     phrase1 = phrase[0..75]
#     phrase2 = phrase[76..-1]
#     p phrase1.size
#     p phrase2.size
#     p phrase1
#     p phrase2
#     puts "+" + "-" * 78 + "+"
#     puts "|" + " " * 78 + "|"
#     puts "|" + " " + phrase1 + " " + "|"
#     puts "|" + " " + phrase2 + " " * (77 - phrase2.size) + "|"
#     puts "|" + " " * 78 + "|"
#     puts "+" + "-" * 78 + "+"
#   else
#     puts "+" + "-" * text_plus_two_spaces + "+"
#     puts "|" + " " * text_plus_two_spaces + "|"
#     puts "|" + " " + text_plus_two_spaces+ " " + "|"
#     puts "|" + " " * text_plus_two_spaces + "|"
#     puts "+" + "-" * text_plus_two_spaces + "+"
#  end
# end
# print_in_box('Borders? I have never seen one. But I have heard they exist in the minds of other people.')

# 2. For a real challenge, try word wrapping very long messages so they appear
# on multiple lines, but still within a box.
# PEDAC
# Problem
# -so if a line is more than 76 characters it has to be split
# -74 because + 2 for the border  + 4 for spaces from each side
# -so basically print 74 characters on 1 line, 74 on the next etc. until string is over

# puts "further explanation --- WIP"
#
# print_in_box('Borders? I have never seen one. But I have heard they exist in the minds of  |
# | other people. Borders? I have never seen one. But I have heard they exist in the minds of  |
# | other people.  Borders? I have never seen one. But I have heard they exist in the minds of  |
# | other people.  ')

# puts "solving it 2nd time around"
# Write a method that will take a short line of text, and print it within a box.
# print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

# print_in_box('')
# +--+
# |  |
# |  |
# |  |
# +--+
# Pedac
# -write a method that takes a string as an argument
# -print the string within a box
# -if a string is empty, print an empty box
# -you can assume that the message will always fit in the Terminal window

# Examples
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

# print_in_box('')
# +--+
# |  |
# |  |
# |  |
# +--+

# Data structures
# -input: string
# -output: string
#
# Algorithm
# -measure the string
# -prepare a space that is 2 spaces greater on the left and write
# -on the first line print + as the first and last character
# -print - in between then
# -second line is empty, except 2 pipes for the beginning and end of the line
# -Third line contains the quote, with 1 space from the border at the beginning and at the end as well
# -Forth line is same as 2nd
# -last line is same as first
#
# make separate methods for all the lines, then call them in the final method called draw_the_box(string)

def first_line_or_last_line(str)
  if str.empty?
    print "+"
    print "--"
    print "+"
  else
    print "+"
    print " "
    print "-" * str.size
    print " "
    print "+"
  end
end

def second_line_or_penultimate_line(str)
  print "|"
  print " "
  print " " * str.size
  print " "
  print "|"
end

def third_line(str)
  print "|"
  print " "
  print str
  print " "
  print "|"
end

str = 'To boldly go where no one has gone before.'

def print_in_box(str)
  first_line_or_last_line(str)
  puts
  second_line_or_penultimate_line(str)
  puts
  third_line(str)
  puts
  second_line_or_penultimate_line(str)
  puts
  first_line_or_last_line(str)
end

print_in_box(str)
puts " "
print_in_box('')
puts " "
print_in_box("Borders I have never seen one. But I have heard they exist in the minds of some people.")

puts ""
# other solutions
def print_in_box(string)
  width = string.length + 2
  dashes = "+#{'-' * width}+"
  center_padding = "|#{' ' * width}|"
  puts dashes
  puts center_padding
  puts "|#{string.center(width)}|"
  puts center_padding
  puts dashes
end

puts " "

puts "Further exploration"

# Modify this method so it will truncate the message if it will be too wide to
# fit inside a standard terminal window (80 columns, including the sides of the box).
# For a real challenge, try word wrapping very long messages so they appear
# on multiple lines, but still within a box.

# Algorithm
# -I need to truncate this message every 80 characters, including sides of the box
# -so 2 characters for borders and 2 for spaces on both sides of the text
# -so 80 - 4 = 76, after every 76 characters I would have to cut the text
# -but best would be to cut it on the last space before I reach 76 characters
# (so that the word is not cut incorectly like e.g. spont aneously).
#
# -first find out how long the string is, divide it by 74
# -accordingly change the definitions to account for printing 74 characters + spaces + borders
# -first and last will change only in the sense that 74 dashes will be printed in between 2 spaces and 2 borders (++)
# -2nd and penultimate method will change in the sense that it has 74 spaces + 2 more spaces and 2 borders (++)
# -3rd line will be printed once or more times, depending on the length of the string
# -we can split the string on spaces and print only until the last space before size 74
# -then print the rest etc. until the size of the array is reached
# how to find a space in regex? The space before character number 74
# print 78 characters and pad with 2 spaces (spaces are included in the 78 characters) and 2 borders

# with Regex it would be like this
# cut string on the last space before 76 characters
# print that cut part of the string padding it until 78 characters, (including 2 spaces) + 2 borders
# procdeed with cutting the string and printing parts of it until no string is left
# can I do it also without the Regex?
# so find the last character that is equal to " " before the index 75 and check which index is that
# cut the string from index 0 to that index, pad with spaces to 78, add 2 pipes as borders
# countinue until no more letters are left in the string


def first_line_or_last_line(str)
  if str.empty?
    print "+"
    print "--"
    print "+"
  else
    print "+"
    print "-" * 78
    print "+"
  end
end

def second_line_or_penultimate_line(str)
  print "|"
  print " "
  print " " * 76
  print " "
  print "|"
end

def third_line(str)
  counter = 0
  until counter > str.size
    print "|" + " "
    s = str.slice(counter, 76)
    print s.ljust(76, " ")
    print " " + "|"
    counter += 76
    print "\n" if counter < str.size
  end
end

str = "Borders I have never seen one. But I have heard they exist in the minds of some people. ― Thor Heyerdahl"


def print_in_box(str)
  first_line_or_last_line(str)
  puts
  second_line_or_penultimate_line(str)
  puts
  third_line(str)
  puts
  second_line_or_penultimate_line(str)
  puts
  first_line_or_last_line(str)
  puts
end

print_in_box(str)

puts ""
puts "Rewriting the method to properly split the words"
puts "**************************************************************************"

################################################################################
=begin
Algorithm - Allison
  PROBLEM
    - input is a string of characters
    - output is an array of strings of 76 characters or less (chopped from the input string)


  ALGORITHM
    split input string into `arr` array of words
    make a copy of `arr` into `copyArr`
    initialize empty array `choppedStrings`
    initialize `charCounter` to 0
    begin iteration over `copyArr`
    initialize `line` to empty array
      begin iteration (while charCounter <= 76)
        slice off front of `arr` and store in `word`
        push `word` onto `line`
        add length of `word` onto `charCounter`
        if `charCounter` over 76
          remove `word` from `line` and unshift back onto `arr`
      end iteration

      join `line` on spaces and push string onto `choppedStrings`
    end iteration over `copyArr`

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

def first_line_or_last_line(str)
  if str.empty?
    print "+"
    print "--"
    print "+"
  else
    print "+"
    print "-" * 78
    print "+"
  end
end

def second_line_or_penultimate_line(str)
  print "|"
  print " "
  print " " * 76
  print " "
  print "|"
end

# so find the last character that is equal to " " before the index 75 and check which index is that
# cut the string from index 0 to that index, pad with spaces to 78, add 2 pipes as borders
# continue until no more letters are left in the string
def third_line(str)
  counter = 0
  until counter > str.size
    print "|" + " "
    s = str.slice(counter, 76)
    print s.ljust(76, " ")
    print " " + "|"
    counter += 76
    print "\n" if counter < str.size
  end
end

str1 = "Borders I have never seen one. But I have heard they exist in the minds of some people. ― Thor Heyerdahl"
str2 = "Our deepest fear is not that we are inadequate. Our deepest fear is that we are powerful beyond measure. It is our light, not our darkness that most frightens us. We ask ourselves, 'Who am I to be brilliant, gorgeous, talented, fabulous?' Actually, who are you not to be? You are a child of God. Your playing small does not serve the world. There is nothing enlightened about shrinking so that other people won't feel insecure around you. We are all meant to shine, as children do. We were born to make manifest the glory of God that is within us. It's not just in some of us; it's in everyone. And as we let our own light shine, we unconsciously give other people permission to do the same. As we are liberated from our own fear, our presence automatically liberates others."


def print_in_box(str)
  first_line_or_last_line(str)
  puts
  second_line_or_penultimate_line(str)
  puts
  third_line(str)
  puts
  second_line_or_penultimate_line(str)
  puts
  first_line_or_last_line(str)
  puts
end

print_in_box(str1)
print_in_box(str2)

# -what I need to do is to look at every line and cut it at the space
# -the space after the last word that is able to be printed fully on the line
# -then I need to move the subsequent word (the one that we are not able to print as a whole)
#  to the next line
# split the string into words
# try to fit the word into the line, if it fits all, enter it
# if it doesn't fit all, it has to go to the next line and the number of spaces
# has to be increased so that the borders are at the correct space

