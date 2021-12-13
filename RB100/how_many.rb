# =begin
#
# PEDAC Template
# ==============

# Write a method that counts the number of occurrences of each element in a given array.
# The words in the array are case-sensitive: 'suv' != 'SUV'. Once counted, print each element alongside the number of occurrences.

# (Understand the) Problem
# ------------------------
# Essential to understanding how to solve a problem. In order to be able to solve
# a problem, you have to at least understand what the problem is and what it is
# asking. Take some time to allow the problem to load into your brain.
#
# **Don't rush this.**
#
# First, identify the inputs and the outputs of the problem.
#
# -  Input: array
#    vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck',
#               'motorcycle', 'motorcycle', 'car', 'truck']
# -  Output: hash
#                car => 4
#                truck => 3
#                SUV => 1
#                motorcycle => 2
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
# 1. How to form a hash out of the array?
# 2. How to take a word from this array and make it a key?
# 3. How to add a number to the value that will signify how many words I have?
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
#
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
# vehicles = [
#   'car', 'car', 'truck', 'car', 'SUV', 'truck',
#   'motorcycle', 'motorcycle', 'car', 'truck'
#  ]
# count_occurrences(vehicles)
# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2

# vehicles = [
#   'car', 'car', 'truck', 'car', 'SUV', 'suv', 'truck',
#   'motorcycle', 'motorcycle', 'car', 'truck
#   ]
#
# count_occurrences(vehicles)
# car => 4
# truck => 3
# SUV => 1
# suv => 1
# motorcycle => 2
#
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
# _Your Test Cases:_
# vehicles = [
#   'car', 'car', 'truck', 'car', 'SUV', 'truck',
#   'motorcycle', 'motorcycle', 'car', 'truck'
# ]
# vehicles1 = [
#   'car', 'car', 'truck', 'car', 'SUV', 'suv' 'truck',
#   'motorcycle', 'motorcycle', 'car', 'truck'
# ]
# vehicles2 = [
#   'car', 'car', 'truck', 'car', 'SUV', 'suv' 'truck', 'Truck'
#   'motorcycle', 'motorcycle', 'car', 'truck'
# ]
# vehicles3 = []
# -----------------
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
# array and hash
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
# iterate over the array
# create a Hash
# with iteration look at the first word of the array
# if my hash, does not have a key with that name, add a key to the array
# and add value as 1 at the same time
# else if such a key already exists, only increament the value
# keep iterating until the you've iterated over all the elements of the array
# return value from the method should be the resulting hash
# the method should differentiate between SUV and suv as well
# Code
def count_occurrences(array)
  h = {}
  array.each do |element|
    unless h.has_key?(element)
      h[element] = 1
    else
      h[element] += 1
    end
  end
  p h
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

vehicles1 = [
  'car', 'car', 'truck', 'car', 'SUV', 'suv', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]
vehicles2 = [
  'car', 'car', 'truck', 'car', 'SUV', 'suv', 'truck', 'Truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]
vehicles3 = []

count_occurrences(vehicles)
# count_occurrences(vehicles1)
# count_occurrences(vehicles2)
# count_occurrences(vehicles3)
# =end
