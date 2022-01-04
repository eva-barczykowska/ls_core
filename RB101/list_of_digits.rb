# =begin
#
# PEDAC Template
# ==============
#
# (Understand the) Problem
# ------------------------

#Write a method that takes one argument, a positive integer, and returns a list of the digits in the number.

# Essential to understanding how to solve a problem. In order to be able to solve
# a problem, you have to at least understand what the problem is and what it is
# asking. Take some time to allow the problem to load into your brain.
#
# **Don't rush this.**
#
# First, identify the inputs and the outputs of the problem.
#
# -  Inputs: 1 argument, a positive integer
# -  Output: array of integers representing the number
#
# ---
#
# Check for Problem Domain: the Problem Domain is the area of expertise or
# application that needs to be examined to solve a problem. Basically any
# domain-specific terms or concepts that may be applicable.
#
# It limits the scope of the problem.
#
# For example, if the problem asks you to add up a set of multiples, you need to
# make sure you know what multiples are.
#
# Could one word have multiple meanings? etc
#
# **Problem Domain:**
#
# ---
#
# Check for Implicit Requirements. Are there requirements that are not explicitly
# stated?
#
# **Implicit Requirements:**
#
# ---
#
# Some questions to ask the interviewer (or perhaps yourself) to better understand
# the problem.
#
# **Clarifying Questions:**
#
# 1.It says write the method so probably I cannot use the existing .digits method?
# 2.What about really big numbers that Ruby allows the _, e.g. 123_000_000
# 3.
#
# ---
#
# A mental model is an explanation of someone's thought process about how
# something works in the real world. Think of it as a summary of the "entire
# problem" written in your own words.
#
# It is your perspective of *what* the problem requires--not *how*. How is
# implemented in the Algorithm section.
#
# As a rule of thumb, you can keep the number of mental models to one if it fully,
# and accurately, captures the requirements of the problem.
#
# **Mental Model:**
# To take a positive number and calculate its digits
# ---
#
# Examples / Test Cases / Edge Cases
# ----------------------------------
#
# The objective is to come up with examples that validate your understanding of
# the problem, and confirm that you are working in the right direction. Typically
# the confirmation will come from documentation of a process, or a person.
#
# **Examples:**
#
# puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
# puts digit_list(7) == [7]                     # => true
# puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
# puts digit_list(444) == [4, 4, 4]             # => true
#
# ---
#
# **Test Cases:**
#
# *Note: Rules for a specific problem are oftentimes an excellent place to find
# test cases. If you're working with collections, it's a good idea to find test
# cases that deal with zero, one or multiple elements in the collection. Try to
# provide test cases that handle any edge cases you can find.*
#
# Find test cases with the following conditions:
#
# -  Zero (`0`)
# -  Emptiness (`nil`, `null`, `""`, `[]`, `{}`)
# -  Boundary conditions (where conditions change)
# -  Repetition / duplication
# -  Upper case / lower case
# -  Data types
#
# As well as the following failures and bad inputs:
#
# -  Raise exceptions / report errors
# -  Special values (`nil`, `0`, `""`, surrogate pairs, char. encoding, special
#    char.)
#
# _Your Test Cases:_
#
# -  Example 3
# puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
# puts digit_list(7) == [7]                     # => true
# puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
# puts digit_list(444) == [4, 4, 4]             # => true
#
# ---
#
# **Edge Cases:**
#
# Edge cases are situations that occur along the "edge" of a specific problem.
#
# For example: problems that involve iterating over numbers have edge cases that
# are at both ends of the range. Typically can involve working with negative
# numbers, 0, or extremely high values.
#
# _Your Edge Cases:_
#
# -  Example 4
#   -  Inputs:
#   -  Output:
#
# ---
#
# Data Structure
# --------------
#I will use integers and arrays
# Determine what data structures you will work with to convert the input to the
# desired output.
#
# The chief considerations here are your intended programming language and your
# mental model.
#
# Are you going to use arrays, hashes, etc? Your data structure will influence
# your program.
#
# ---
#
# Algorithm
# ---------
#
# Start with your mental model if you have one. While you're still learning to
# solve problems, it would be a good idea to consistently create mental models to
# assist you.
#
# Otherwise you can start with your Data Structure, and think about how you'd
# build and manipulate it to get to the output. For example, if you're going to
# use an array maybe you would want to focus on constructing or iterating over a
# collection.
#
# The chief objective here is to determine a series of instructions that will
# transform the input into the desired output.
#
# -  The challenge is to get to the right amount of detail (think about the steps
#    to creating a peanut butter and jelly sandwich.)
# -  You want something that you can readily convert to code without actually
#    writing code.
# -  Before implementing the algorithm, you should test it manually with test
#    cases.
#
# -I will split the integer into single digits
# - But first I need to change it into string, because Integer does not have the split method
# - Once I have the string, I can split it but how?
# - Once I've split it, and I have an array but of strings
# - I will use map method to transform those strings to integers
# Code
num = 12345
#
# def digit_list(num)
#   arr = num.to_s.split("")
#   res = arr.map { |elem| elem.to_i }
# end
# #----------------------
# LS had 2 solutions, brute force and idiomatic Ruby

# BRUTE FORCE
# def digit_list(number)
#   digits = []
#   loop do
#     number, remainder = number.divmod(10)
#     digits.unshift(remainder)
#     break if number == 0
#   end
#   digits
# end

# IDIOMATIC RUBY
def digit_list(number)
  number.to_s.chars.map(&:to_i)
end

# I like this solution from students' solutions because it's very clear to read
# def digit_list(pos_int)
#   list = []
#   until pos_int.zero? do
#     list << pos_int % 10
#     pos_int /= 10
#   end
#   list.reverse!
# end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true
# =end
