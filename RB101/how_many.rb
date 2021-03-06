# PEDAC Template
# ==============

# Write a method that counts the number of occurrences of each element in a given array.
# The words in the array are case-sensitive: 'suv' != 'SUV'. Once counted, print each element
# alongside the number of occurrences.
# additional requirement after finishing this: Try to solve the problem when words are case insensitive,
# e.g. "suv" == "SUV".
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
# -  Input: array
#    vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck',
#               'motorcycle', 'motorcycle', 'car', 'truck']
# -  Output: hash - is this a hash? There are are no symbols, so this is not a hash.
#            this is printing keys and values of a hash. How to do it?
#                car => 4
#                truck => 3
#                SUV => 1
#                motorcycle => 2
#
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
#
# ---=
#
# Check for Implicit Requirements. Are there requirements that are not explicitly
# stated?
#
# **Implicit Requirements:**
#
# ----
#
# Some questions to ask the interviewer (or perhaps yourself) to better understand
# the problem.
#
# **Clarifying Questions:**
#
# 1. How to form a hash out of the array?
# 2. How to to count elements of the array? Is there a method for it?
# 3. How to print the result?
#
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
#
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
# array and hash
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
# create an empty hash for occurrences
# iterate over each unique element of the array
# array.count
# then print each of the occurrences in the format word => how many
# the method should differentiate between SUV and suv as well
# Code

def count_occurrences(arr)
  occurrences = {}

  arr.uniq.each do |element|
    occurrences[element] = arr.count(element)
  end

  occurrences.each do |element, count|
    puts "#{element} => #{count}"
  end
end

# the solution which I liked as most elegant was this one:
# def count_occurences(array)
#   hash = array.to_h { |ele| [ele, array.count(ele)] }
#   hash.each do |k, v|
#     puts "#{k} => #{v}"
#   end
# end

# I also liked this as the shortest:
# def count_occurrences(arr)
#   arr.uniq.each { |word| puts "#{word} => #{arr.count(word)}" }
# end

# And this one is the easiest to understand quickly, like I just look at it
# and it is immediately clear
# def count_occurrences(array)
#   hash = {}
#   array.each do |el|
#     if hash.has_key?(el)
#       hash[el] += 1
#     else
#       hash[el] = 1
#     end
#   end
#   hash.each { |car, number| puts "#{car} => #{number}" }
# end

vehicles = %w[car car truck car SUV truck motorcycle motorcycle car truck]

vehicles1 = %w[car car truck car SUV suv truck motorcycle motorcycle car truck]
vehicles2 = %w[car car truck car SUV suv truck Truck motorcycle motorcycle car truck]
vehicles3 = []

count_occurrences(vehicles)
puts ''
count_occurrences(vehicles1)
puts ''
count_occurrences(vehicles2)
puts ''
count_occurrences(vehicles3)
# =end
# ---------------------------------------------------
# additional requirement after finishing this: Try to solve the problem when words are case insensitive,
# e.g. "suv" == "SUV".

# puts '*****'
# def count_occurrences(arr)
#
#   arr = arr.map { |e|  e.downcase }
#
#   occurrences = {}
#
#   arr.uniq.each do |element|
#     occurrences[element] = arr.count(element)
#   end
#
#   occurrences.each do |element, count|
#     puts "#{element} => #{count}"
#   end
# end
#
# vehicles2 = %w[car car truck car SUV suv truck Truck motorcycle motorcycle car truck]
#
# count_occurrences(vehicles2)
