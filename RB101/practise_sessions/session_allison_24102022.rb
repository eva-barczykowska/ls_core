# Fibonacci Number Location By Length

# The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...)
# such that the first 2 numbers are 1 by definition, and each subsequent number
# is the sum of the two previous numbers. This series appears throughout
# the natural world.

# Computationally, the Fibonacci series is a very simple series, but the
# results grow at an incredibly rapid rate. For example, the 100th Fibonacci
# number is 354,224,848,179,261,915,075 -- that's enormous, especially
# considering that it takes 6 iterations before it generates
# the first 2 digit number.

# Write a method that calculates and returns the index of the first Fibonacci
# number that has the number of digits specified as an argument.
# (The first Fibonacci number has index 1.)

# You may assume that the argument is always greater than or equal to 2.
=begin
find_fibonacci_index_by_length(2) == 7 # 1 1 2 3 5 8 13
find_fibonacci_index_by_length(3) == 12 # 1 1 2 3 5 8 13 21 34 55 89 144
find_fibonacci_index_by_length(10) == 45
find_fibonacci_index_by_length(100) == 476
find_fibonacci_index_by_length(1000) == 4782
find_fibonacci_index_by_length(10000) == 47847

PEDAC
Problem
-fibonacci number are 1,1,2,3,5,8,13,21
-in f.s. the next number is the sum of the previous 2 numbers,
except 2 first numbers, which are 1 and 1 respectively
-write a method that takes a number/integer as an argument
-this method calculates and returns the index of the 1st fibonacci number that
# has the number of digits specified in the argument

Examples
find_fibonacci_index_by_length(2) == 7 # 1 1 2 3 5 8 13
find_fibonacci_index_by_length(3) == 12 # 1 1 2 3 5 8 13 21 34 55 89 144
find_fibonacci_index_by_length(10) == 45
find_fibonacci_index_by_length(100) == 476
find_fibonacci_index_by_length(1000) == 4782
find_fibonacci_index_by_length(10000) == 47847

Data structures
input is an integer, signifies NUMBER OF DIGITS
output is also an integer, signifies INDEX

Algorithm
-I will create an array with 3 elements [1, 1, 2], initial numbers for the
Fibonacci sequence numbers
-I need to create a Fibonacci sequence array by adding the last
 2 elements of the array
-I will be executing the Fibonacci s. and adding the numbers to
 the fibonacci array until I reach a number that has the amount of digits
specified as the argument
-so whenever a new number is created and added to the fibonacci array,
 I will check how many digits it has (Integer.digits/.to_s.size)
-if I check the size of the number at a particular index in the fibonacci array,
 the size of the array should be equal to the argument and then I can stop
 adding more Fibonacci numbers to the fibonacci array and return the index
  of the number whose size is equal to the argument number
-return the index of the last number in the fibonacci array, adding one
 because as mentioned in the problem description, the first Fibonacci
  number has index 1.
Code
=end

def find_fibonacci_index_by_length(number)
fibonacci = [1, 1, 2]
while fibonacci.last.digits.size != number
fibonacci << fibonacci[-1] + fibonacci[-2]
end
return fibonacci.index(fibonacci.last) + 1
end

p find_fibonacci_index_by_length(2) == 7 # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12 # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847
