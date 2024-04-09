# Write a method that computes the difference between the square of the sum of the first n positive integers and the sum of the squares of the first n positive integers.
#
#
# P:
# -method takes takes an integer
# square of the sum of the first n positive integers - sum of the squares of the first n positive integers
#
# SQUARE OF THE SUM of the integers
# SUM OF THE SQUARES of the integers
# -integers start from 1
#
# Examples:
# sum_square_difference(3) == 22
#    # => (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
#
# sum_square_difference(10) == 2640
# =>(1..10).to_a.inject(:+) - (1..10).to_a.inject(:**2) -separate method?
# SQUARE OF THE SUM
#
# sum_square_difference(1) == 0
# => if arg == 1, it's 0
#
# sum_square_difference(100) == 25164150
#
# DS:
# input: an int
# outpt: int
#
# A:
# -INIT numbers range, add them all and
# - CREATE SQUARE OF THE SUM
#
# -CREATE SUM OF THE SQUARES
# -take the range
# -map to ** 2
# -sum
#
# SUBSTRACT: SQUARE OF THE SUM of the integers - SUM OF THE SQUARES
# return the result
def sum_square_difference(int)
  square_of_sum = (1..int).to_a.inject(:+)**2
  sum_of_squares = (1..int).map { |n| n**2 }.sum

  square_of_sum - sum_of_squares
end
p sum_square_difference(3) == 22
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25_164_150
