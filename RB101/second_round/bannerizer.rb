# Write a method that will take a short line of text, and print it within a box.
=begin
print_in_box('To boldly go where no one has gone before.')
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+

print_in_box('')
+--+
|  |
|  |
|  |
+--+
You may assume that the input will always fit in your terminal window.

PEDAC
Problem
-write a method that prints text in the box
-if there is no text, the box is empty
-if there is text, it fits in 80 characters
-what does the box look like?
-first line is + + on both sides, 2 spaces and 76 hyphens
-second line is || on both sides, 78 spaces
-third line is || on both sides, text and spaces to fill up to 76
-4th line is like 2nd line
-5th line is like 1st line

-if the passed argument is an empty string
print +--+
      |  |
      |  |
      |  |
      +--+

Examples
print_in_box('To boldly go where no one has gone before.')
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+

print_in_box('')
+--+
|  |
|  |
|  |
+--+

Data Structures
input: String
output: String

Algorighm
-what does the box look like?
-first line is + + on both sides, 2 spaces and 76 hyphens
-second line is || on both sides, 78 spaces
-third line is || on both sides, text and spaces to fill up to 76
-4th line is like 2nd line
-5th line is like 1st line

-if the passed argument is an empty string
print +--+
      |  |
      |  |
      |  |
      +--+

Code
=end

def first_and_last_line(str)
  if str.empty?
    puts "+" + "--" * 1 + "+"
  else
    puts "+ " + "-" * str.size + " +"
  end
end

def second_and_penultimate_line(str)
  puts "|" + " " * str.size + " " + " |"
end

def text(str)
  puts "|" + " " + str + " " + "|"
end

def print_in_box(str)
  # if str.empty?
  #   puts "+--+"
  #   puts "|  |"
  #   puts "|  |"
  #   puts "|  |"
  #   puts "+--+"
  # else
    first_and_last_line(str)
    second_and_penultimate_line(str)
    text(str)
    second_and_penultimate_line(str)
    first_and_last_line(str)
  # end

end

print_in_box('')
print_in_box('To boldly go where no one has gone before.')
