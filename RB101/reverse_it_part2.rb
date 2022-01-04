# PEDAC Template
# ==============
# Write a method that takes one argument, a string containing one or more words,
# and returns the given string with words that contain five or more characters
# reversed.
# Each string will consist of only letters and spaces.
# Spaces should be included only when more than one word is present.
#
# (Understand the) Problem
# ----
# Essential to understanding how to solve a problem. In order to be able to solve
# a problem, you have to at least understand what the problem is and what it is
# asking. Take some time to allow the problem to load into your brain.
#
# **Don't rush this.**
#
# First, identify the inputs and the outputs of the problem.
#
# -  Input: 1 element, a string containing 1 or more words,
#           -input is only letters and spaces
#
# -  Output: returns the given string with 5 or more characters reversed
# ----
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
# ---
#
# Check for Implicit Requirements. Are there requirements that are not explicitly
# stated?
#
# **Implicit Requirements:**
# ----
#
# Some questions to ask the interviewer (or perhaps yourself) to better understand
# the problem.
#
# **Clarifying Questions:**
#
# 1.
# 2.
# 3.
# 4.
# ----
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
# my method takes one argument, a string
# string contains only letters and spaces
# it can be one word or more words in a string
# the return value of the method should be also a string but with 5 or more
# characters reversed
# spaces will be included only when more than 1 word is present
# ----
#
# Examples / Test Cases / Edge Cases
# ----
#
# The objective is to come up with examples that validate your understanding of
# the problem, and confirm that you are working in the right direction. Typically
# the confirmation will come from documentation of a process, or a person.
#
# **Examples:**
#
# puts reverse_words('Professional')          # => lanoisseforP
# puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
# puts reverse_words('Launch School')         # => hcnuaL loohcS
# ---
#
# **Test Cases:**
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
# # _Your Test Cases:_
# puts reverse_words('Professional')          # => lanoisseforP
# puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
# puts reverse_words('Launch School')         # => hcnuaL loohcS
# ----
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
# string, array
# Algorithm
# ---------
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
# -----------------------------
# split the string by character
# I will have an array of characters
# take 5 or more of these characters
# reverse them
# Code
## Write a method that takes one argument, a string containing one or more words,
# and returns the given string with words that contain five or more characters
# reversed.
# Each string will consist of only letters and spaces.
# Spaces should be included only when more than one word is present.
def reverse_words(words)
  reversed = []
  words.split.each do |word|
    word.reverse! if word.size >= 5
    reversed << word
  end
  reversed.join(' ')
end
# a one line solution:
# def reverse_words(string)
#   string.split.map{|word| word.size >= 5 ? word.reverse : word }.join(' ')
# end
# or
# def reverse_words(string)
#   string.split.each { |x| x.reverse! if x.size > 4 }.join('')
# end

# a solution that I liked:
# def reverse_words(string)
#   arr = string.split
#   arr.each do |item|
#     if item.size >= 5
#       item.reverse!
#     end
#   end
#   arr.join(' ')
# end

puts reverse_words('Professional')          #=> lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
