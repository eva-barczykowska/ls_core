# Write a program that asks the user to enter an integer greater than 0, then
# asks if the user wants to determine the sum or product of all numbers between
# 1 and the entered integer.
# input: integer and string
# output: sum or product of all numbers between 1 and entered integers
# algorithm:
# - ask for input
# - depending on the input, process integer
# - create a range and convert it to an array
# - work with that array either adding all the numbers with .sum method
# - or use a method to make a product, .reduce or .inject

# puts ">> Please enter an integer greater than 0:"
# number = gets.chomp.to_i
#
# puts ">> Enter 's' to compute the sum, 'p' to compute the product."
# choice = gets.chomp
#
# if choice == 's'
#   p "The sum of numbers between 1 and #{number} is #{(1..number).to_a.sum}."
# elsif choice == 'p'
#   p "The product of integers between 1 and #{number} is #{(1..number).to_a.reduce(1) { |product, n| product * n }}."
# end

# >> Please enter an integer greater than 0:
# 5
# >> Enter 's' to compute the sum, 'p' to compute the product.
# s
# The sum of the integers between 1 and 5 is 15.
#
#
# >> Please enter an integer greater than 0:
# 6
# >> Enter 's' to compute the sum, 'p' to compute the product.
# p
# The product of the integers between 1 and 6 is 720.

# another solution with the use of methods:

puts ">> Please enter an integer greater than 0:"
number = gets.chomp.to_i

puts ">> Enter 's' to compute the sum, 'p' to compute the product."
choice = gets.chomp

initial_num = 1

def calculate_sum(initial_num, number)
  (initial_num..number).to_a.sum
end

def calculate_product(initial_num, number)
  (initial_num..number).to_a.reduce(1) { |product, next_num| product * next_num }
end

if choice == 's'
  p "The sum of the integers between 1 and #{number} is #{calculate_sum(initial_num, number)}."
elsif choice == 'p'
  p "The product of the integers between 1 and #{number} is #{calculate_product(initial_num, number)}."
else
  p "Oops, unknown operation!"
end

# ls solution:
def compute_sum(number)
  total = 0
  1.upto(number) { |value| total += value }
  total
end

def compute_product(number)
  total = 1
  1.upto(number) { |value| total *= value }
  total
end

puts ">> Please enter an integer greater than 0"
number = gets.chomp.to_i

puts ">> Enter 's' to compute the sum, 'p' to compute the product."
operation = gets.chomp

if operation == 's'
  sum = compute_sum(number)
  puts "The sum of the integers between 1 and #{number} is #{sum}."
elsif operation == 'p'
  product = compute_product(number)
  puts "The product of the integers between 1 and #{number} is #{product}."
else
  puts "Oops. Unknown operation."
end
