# https://launchschool.com/exercises/a018e581
# Repeat Yourself
# Write a method that takes two arguments, a string and a positive integer, and prints the string as many times as the integer indicates.

# repeat('Hello', 3)

# output:
# Hello
# Hello
# Hello

# PEDAC
# Problem
# -write a method
# -the method takes 2 arguments, a str and a positive integer
# -the method prints the string as many times as the integers says
# Examples
# output (what the method prints):
# Hello
# Hello
# Hello

# Data Structures
# input: a str and integer
# output: strings as indicated by the integer argument
# Algorithm
# -in the body of the method I am going to mutliply the string by the integer
# -I will print the result
# Code

# def repeat(str, num)
#   count = 0
#   while count < num
#    puts str
#    count += 1
#   end
# end

def repeat(str, num)
  count = 0
  loop do
   puts str
   count += 1
   break if count == num
  end
end
repeat('Hello', 3)
