# Fibonacci Number Location By Length
# The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...)
# such that the first 2 numbers are 1 by definition, and each subsequent number
# is the sum of the two previous numbers. This series appears throughout
# the natural world.

# Computationally, the Fibonacci series is a very simple series, but the results
# grow at an incredibly rapid rate. For example, the 100th Fibonacci number is
# 354,224,848,179,261,915,075 -- that's enormous, especially considering that it
# takes 6 iterations before it generates the first 2 digit number.

# Write a method that calculates and returns the index of the first Fibonacci
# number that has the number of digits specified as an argument.
# (The first Fibonacci number has index 1.)

# find_fibonacci_index_by_length(2) == 7       # 1 1 2 3 5 8 13
# find_fibonacci_index_by_length(3) == 12      # 1 1 2 3 5 8 13 21 34 55 89 144
# find_fibonacci_index_by_length(10) == 45
# find_fibonacci_index_by_length(100) == 476
# find_fibonacci_index_by_length(1000) == 4782
# find_fibonacci_index_by_length(10000) == 47847

# You may assume that the argument is always greater than or equal to 2.

# PEDAC
# Problem
# -write a method that takes an int as an argument
# -the method calculates and returns the INDEX of the first Fibonacci number
# that has the number od digits specified by an argument

# Examples
# find_fibonacci_index_by_length(2) == 7       # 1 1 2 3 5 8 13
# find_fibonacci_index_by_length(3) == 12      # 1 1 2 3 5 8 13 21 34 55 89 144
# find_fibonacci_index_by_length(10) == 45
# find_fibonacci_index_by_length(100) == 476
# find_fibonacci_index_by_length(1000) == 4782
# find_fibonacci_index_by_length(10000) == 47847

# Data Structures
# input: integer
# output: integer

# Algorithm
# -initialize a variable `fibonacci` and point it to [1, 1]
# `[1, 1]` are my first fibonacci numbers,
# out of which I can start generating other numbers in the fibonacci sequence

# -to produce fibonacci numbers, I will keep adding the last
# 2 elements of the array

# -each time I will produce a new number, I will convert it to a string and
# check its size
# if the size of the string, is equal to the integer agrument,
#   I can stop generating new numbers

# finally, I will return the size of the fibonacci array because the size is 
# actually size of the index, since we calculate the index from 1

# Code

def find_fibonacci_index_by_length(int)
  fibonacci = [1, 1]

  loop do
    fibonacci << fibonacci[-1] + fibonacci[-2]
    break if fibonacci.last.to_s.size == int
  end
  fibonacci.size
end

p find_fibonacci_index_by_length(2) == 7
p find_fibonacci_index_by_length(3) == 12      # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847
