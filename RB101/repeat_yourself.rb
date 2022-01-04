
# Write a method that takes two arguments, a string and a positive integer,
# and prints the string as many times as the integer indicates.

# Example:
# repeat('Hello', 3)
# Output:
#      Hello
#      Hello
#      Hello
#
# Problem solving steps:
# inputs:
#   an integer > 0 and a string

# outputs:
#   a string

# clarifying questions:
#   what if string is empty?
#   print uppercase/lowercase?
#   need to validate input? (e.g., check that the integer is positive)
#   separated by spaces or newlines? => example indicates new lines
#   (check this assumption)

# data structures:
#   input is a string & a number
#   output is a string

# algorithm
# read input, a string and an integer, as parameters into the method;
# multiply string and new line character by integer, print string output

# example
# repeat('hi, Bob', 2) => hi, Bob
#                         hi, Bob

def repeat(str, pos_integer)
  pos_integer.times do
    puts str
  end
end

# test cases
# repeat('hello', 0)
# repeat('hello', 3)
# repeat('hello', 1)
# repeat('hello', 10)
# repeat('', 2)
# repeat('Hello', 4)
repeat('hello', -1)
