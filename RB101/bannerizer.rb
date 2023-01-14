# Write a method that will take a short line of text, and print it within a box.
# print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

# PEDAC
# Problem
# -write a method that takes a string as an argument
# -print the string within a box
# -if a string is empty, print an empty box
# -you can assume that the message will always fit in the Terminal window
#
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
#
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
# -Third line contains the quote,
#  with 1 space from the border at the beginning and at the end as well
# -Forth line is same as 2nd
# -last line is same as first
#
# make separate methods for all the lines, then call them in the final method
# called print_in_box(string)
# first time round doing this, without separate methods for each line:

def print_in_box(phrase)
  text_space = phrase.length + 2
  puts "+" + "-" * text_space + "+"
  puts "|" + " " * text_space + "|"
  puts "|" + " " + phrase + " " + "|"
  puts "|" + " " * text_space + "|"
  puts "+" + "-" * text_space + "+"
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('Love is all around.')
print_in_box('Ewa is the best.')
print_in_box('')
print_in_box('First time doing this.')

# ls solution:
puts "ls solution"
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
puts "*************************************************************************"
puts "Further exploration"
puts
# # Further exploration:
# 1.
# Modify this method so it will truncate the message if it will be too wide
# to fit inside a standard terminal window
# (80 columns, including the sides of the box).

def print_in_box(phrase)
  # p phrase.size
  text_plus_two_spaces = phrase.length + 2
  if phrase.size > 80
    phrase1 = phrase[0..75]
    phrase2 = phrase[76..-1]
    # p phrase1.size
    # p phrase2.size
    # p phrase1
    # p phrase2
    puts "+" + "-" * 78 + "+"
    puts "|" + " " * 78 + "|"
    puts "|" + " " + phrase1 + " " + "|"
    puts "|" + " " + phrase2 + " " * (77 - phrase2.size) + "|"
    puts "|" + " " * 78 + "|"
    puts "+" + "-" * 78 + "+"
  else
    puts "+" + "-" * text_plus_two_spaces + "+"
    puts "|" + " " * text_plus_two_spaces + "|"
    puts "|" + " " + text_plus_two_spaces+ " " + "|"
    puts "|" + " " * text_plus_two_spaces + "|"
    puts "+" + "-" * text_plus_two_spaces + "+"
 end
end

print_in_box('Borders? I have never seen one. But I have heard they exist in the minds of other people.')

puts "*************************************************************************"

# second time doing this, with separate methods for each line
def first_or_last_line(str)
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

def second_or_second_last_line(str)
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
str2 = "Our deepest fear is not that we are inadequate. Our deepest fear is that we are powerful beyond measure. It is our light, not our darkness that most frightens us. We ask ourselves, 'Who am I to be brilliant, gorgeous, talented, fabulous?' Actually, who are you not to be? You are a child of God. Your playing small does not serve the world."

def print_in_box(str)
  first_or_last_line(str)
  puts
  second_or_second_last_line(str)
  puts
  third_line(str)
  puts
  second_or_second_last_line(str)
  puts
  first_or_last_line(str)
end

print_in_box(str)
puts
print_in_box(str2)
puts
print_in_box('')
puts
print_in_box("Borders I have never seen one. But I have heard they exist in the minds of some people.")

puts

def first_or_last_line(str)
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

def second_or_second_last_line(str)
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
  first_or_last_line(str)
  puts
  second_or_second_last_line(str)
  puts
  third_line(str)
  puts
  second_or_second_last_line(str)
  puts
  first_or_last_line(str)
  puts
end

print_in_box(str)
print_in_box(str2)


