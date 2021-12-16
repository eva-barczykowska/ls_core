# PEDAC Template
# ==============
# Write a method that takes one argument, a positive integer, and returns
# a string of alternating 1s and 0s, always starting with 1.
# The length of the string should match the given integer.

# Modify stringy so it takes an additional optional argument that defaults to 1.
# If the method is called with this argument set to 0,
# the method should return a String of alternating 0s and 1s, but starting
# with 0 instead of 1.
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
# -  Input: 1 argument, a positive integer
#
# -  Output: a string of alternating 1s and 0s, always starting with 1
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
# puts stringy(6) == '101010'
# puts stringy(9) == '101010101'
# puts stringy(4) == '1010'
# puts stringy(7) == '1010101'
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
# puts stringy(6) == '101010'
# puts stringy(9) == '101010101'
# puts stringy(4) == '1010'
# puts stringy(7) == '1010101'
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
# integer, a string, array
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
# take this integer, this will be the amount of times when to print 1 or 0
# create an array with integers from 1 to this integer, like 1 to 6
# save this array to a variable
# create another variable for the result
# for each element in the array print 1 if it's odd, otherwise print 0
# join the array because the method needs to return a string
# Code
#
def stringy(int)
  array_of_numbers = []
  result = []
  1.upto(int) { |num| array_of_numbers << num }
  array_of_numbers.each do |num|
    num.odd? ? result.push('1') : result.push('0')
  end
  result.join
end

# shorter solution that I liked
# the important thing here that I missed is that string also has the << method
# n times starts from 0 that's why here we have x.even? string << '1'
# it's doing something n times but starting from 0!
# very interesting!
# def stringy(n)
#   string = ''
#   n.times { |x| x.even? ? string << '1' : string << '0' }
#   string
# end

# also I like this one
# def stringy(num)
#   result = ''
#   num.times { |x| x.even? ? result += '1' : result += '0' }
#   result
# end

# and this one, because it's the most concise:
# I was also thinking of using range for this solution but didn't manage
# to figure out how
# def stringy(num)
#   (1..num).to_a.map { |num| num.odd? ? '1' : '0' }.join
# end
#
# puts stringy(6) == '101010'
# puts stringy(9) == '101010101'
# puts stringy(4) == '1010'
# puts stringy(7) == '1010101'

# Modify stringy so it takes an additional optional argument that defaults to 1.
# If the method is called with this argument set to 0,
# the method should return a String of alternating 0s and 1s, but starting
# with 0 instead of 1.
# def stringy(num, arg = 1)
#   if arg.zero?
#     (1..num).to_a.map { |x| x.odd? ? '0' : '1' }.join
#   else
#     (1..num).to_a.map { |x| x.odd? ? '1' : '0' }.join
#   end
# end
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
