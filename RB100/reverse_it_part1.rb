# PEDAC Template
# ==============

# Write a method that takes one argument, a string, and returns a new string with the words in reverse order.
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
# -  Input: 1 element, a string
#
# -  Output: a new string with the words in reverse order
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
# 1. How to split that string?
# 2. What is the method for reversing the order of the characters?
# 3. The words are in the same order but only the order of the characters in the string are reversed?
# 4. What happens if I have spaces, one or more?
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
# I need to split this string, reverse teh order of characters in every element and then put back together
# the string and return it, with the words in reverse order
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
# puts reverse_sentence('Hello World') == 'World Hello'
# puts reverse_sentence('Reverse these words') == 'words these Reverse'
# puts reverse_sentence('') == ''
# puts reverse_sentence('    ') == '' # Any number of spaces results in ''
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
# puts reverse_sentence('Hello World') == 'World Hello'
# puts reverse_sentence('Reverse these words') == 'words these Reverse'
# puts reverse_sentence('') == ''
# puts reverse_sentence('    ') == '' # Any number of spaces results in ''
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
# split the string by space, create an array of words
# reverse all the words
# convert the array of inverted words to 1 string
# Code
#
def reverse_sentence(sentence)
  array = sentence.split(' ')
  res = []
  counter = array.size
  while counter.positive?
    res << array.pop
    counter -= 1
  end
  res.join(' ')
end
# I really like how concise LS solution is:
# def reverse_sentence(string)
#   string.split.reverse.join(' ')
# end
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''
