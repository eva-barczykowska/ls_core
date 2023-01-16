# For a real challenge, try word wrapping very long messages so they appear
# on multiple lines, but still within a box.
# ######################################################################
# =begin
# Algorithm - Allison
# PROBLEM
# - input is a string of characters
# - output is an array of strings of 76 characters or less
# (chopped from the input string)

# ALGORITHM
#     split input string into `arr` array of words
#     make a copy of `arr` into `copyArr`
#     initialize empty array `choppedStrings`
#     initialize `charCounter` to 0
#     begin iteration over `copyArr`
#     initialize `line` to empty array
#       begin iteration (while charCounter <= 76)
#         slice off front of `arr` and store in `word`
#         push `word` onto `line`
#         add length of `word` onto `charCounter`
#         if `charCounter` over 76
#           remove `word` from `line` and unshift back onto `arr`
#       end iteration
#
#       join `line` on spaces and push string onto `choppedStrings`
#     end iteration over `copyArr`
#
#   PROBLEM
#     - input is an array of chopped strings to a length of 76 chars or less
#     - output will draw a border around that array's elements.
#
#   ALGORITHM
#     draw top line (80 chars)
#     draw spacer line (80 chars)
#
#     begin iteration over input arr
#       drawText(currentArrElem)
#     end iteration
#
#     draw spacer line (80 chars)
#     draw top line (80 chars)
#
#
#   drawText(str)
#     initialize `line` to `| `
#     concat `str` to `line`
#     initialize `lineLengh` to current line length
#     initialize `padding` to `76 - lineLength`
#     concat `padding` spaces onto `line`
#     concat ` |` onto `line`
#     return `line`
# =end
#
# My Algorithm:
# -the length of the box depends on the first line, which is 80 characters
# -only print as many words as fits, don't cut the words in half
# -print the rest of the phrase on the consecutive line

# so, to cut the text properly, find the last character that is equal to " "
# before the index 76(including)
# if char 76 is a space, leave the line as it is
# if it is not, look for the last space
# which index is that
# cut the line until that index (included)
# add it to a single line
# pad to 76 with spaces
# move on to the next line
# method will return lines of 76 characters each, padded if necessary
# first return lines, then pad, then return padded lines

# Algorithm
# -I need to truncate this message every 80 characters, incl. sides of the box
# -so 2 characters for borders and 2 for spaces on both sides of the text
# -so 80 - 4 = 76, after every 76 characters I would have to cut the text
# -but best would be to cut it on the last space before I reach 76 characters
# (so that the word is not cut incorrectly like e.g. spont aneously).

# with Regex it would be like this
# cut string on the last space before 76 characters
# print that cut part of the string padding it until 78 characters,
# (including 2 spaces) + 2 borders
# proceeded with cutting the string and printing parts of it until no string is left

def first_or_last_line(str)
  if str.empty?
    print "+"
    print "--"
    print "+"
  else
    print "+"
    print "-" * 77
    print "+"
  end
end

def second_or_second_last_line
  print "|"
  print " "
  print " " * 75
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

def get_padded_lines(str) # prepare 76-character padded lines with borders
  padded_lines = []
  lines = str.scan(/\S.{0,74}\S(?=\s|$)|\S+/)
  lines.each do |line|
    while line.chars.size <= 75
      line += " "
    end
    padded_lines << line.prepend('| ')
  end
  padded_lines.map! { |line| line += "|" }
    puts padded_lines[0..padded_lines.size - 2]
    print padded_lines[-1]
end

# shortcomings:
# if lines are less than 3, not everything will get printed in the box
# I can fix this but the price is longer & less readable method
# fixed

str1 = "Borders I have never seen one. But I have heard they exist in the minds of some people. ― Thor Heyerdahl"
str2 = "Our deepest fear is not that we are inadequate. Our deepest fear is that we are powerful beyond measure. It is our light, not our darkness that most frightens us. We ask ourselves, 'Who am I to be brilliant, gorgeous, talented, fabulous?' Actually, who are you not to be? You are a child of God. Your playing small does not serve the world. There is nothing enlightened about shrinking so that other people won't feel insecure around you. We are all meant to shine, as children do. We were born to make manifest the glory of God that is within us. It's not just in some of us; it's in everyone. And as we let our own light shine, we unconsciously give other people permission to do the same. As we are liberated from our own fear, our presence automatically liberates others."
str3 = "Borders I have never seen one. But I have heard they exist in the minds of some people. Borders I have never seen one. But I have heard they exist in the minds of some people. Borders I have never seen one. But I have heard they exist in the minds of some people."

# get_padded_lines(str2)
# get_padded_lines(str3)
def print_in_box(str)
  first_or_last_line(str)
  puts
  second_or_second_last_line
  puts
  get_padded_lines(str)
  puts
  second_or_second_last_line
  puts
  first_or_last_line(str)
  puts
end

print_in_box(str1)
print_in_box(str2)
print_in_box(str3)
#
# #   arr = str2.scan(/\S.{0,74}\S(?=\s|$)|\S+/)
# #   arr.each do |e|
# #     puts '-element-'
# #     puts e.size
# #   end
# #
# #   def wrap_long_string(text,max_width = 20)
# #     (text.length < max_width) ?
# #       text :
# #       text.scan(/.{1,#{max_width}}/).join("<wbr>")
# #   end
#
#
# puts "***"
# very interesting:
arr = %w(zero one two three)
p arr # => ["zero", "one", "two", "three"]
puts arr[0, 2]
puts
puts arr[0, arr.size - 2]

puts "using coma gives me only element zero and one"
puts "using range will give me element zero, one and two:"
# but
puts arr[0..2]
puts
puts arr[0..arr.size - 2]


