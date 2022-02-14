# Write a method that will take a short line of text, and print it within a box.

# def print_in_box(phrase)
#   text_space = phrase.length + 2
#   puts "+" + "-" * text_space + "+"
#   puts "|" + " " * text_space + "|"
#   puts "|" + " " + phrase + " " + "|"
#   puts "|" + " " * text_space + "|"
#   puts "+" + "-" * text_space + "+"
# end
#
# print_in_box('To boldly go where no one has gone before.')
# print_in_box('Love is all around.')
# print_in_box('Ewa is the best.')
# print_in_box('')

# print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

# ls solution:
# def print_in_box(message)
#   horizontal_rule = "+#{'-' * (message.size + 2)}+"
#   empty_line = "|#{' ' * (message.size + 2)}|"
#
#   puts horizontal_rule
#   puts empty_line
#   puts "| #{message} |"
#   puts empty_line
#   puts horizontal_rule
# end
#
# print_in_box('To boldly go where no one has gone before.')
# print_in_box('Love is all around.')
# print_in_box('Ewa is the best.')
# print_in_box('')
# puts

# Further exploration:
# Modify this method so it will truncate the message if it will be too wide
# to fit inside a standard terminal window
# (80 columns, including the sides of the box).
# For a real challenge, try word wrapping very long messages so they appear
# on multiple lines, but still within a box.

# Algorithm:
# -the length of the box depends on the first line, which is 80 characters
# -only print as many words as fits, don't cut the words i half
# -print the rest of the phrase on the consequitive line


def print_in_box(phrase)
  p phrase.size
  text_plus_two_spaces = phrase.length + 2
  if phrase.size > 80
    phrase1 = phrase[0..75]
    phrase2 = phrase[76..-1]
    p phrase1.size
    p phrase2.size
    p phrase1
    p phrase2
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
