#   Arithmetic Integer
# Write a program that prompts the user for two positive integers,
# and then prints the results of the following operations on those two numbers:
# addition, subtraction, product, quotient, remainder, and power. Do not worry about validating the input.
# end

# PEDAC
# PROBLEM
# -write a method
# -the method takes 2 ingeters as input
# -the method returns result of adding/substracting, multiplying, dividing, remainder, and power of those 2 numbers

# Examples
# ==> Enter the first number:
# 23
# ==> Enter the second number:
# 17
# ==> 23 + 17 = 40
# ==> 23 - 17 = 6
# ==> 23 * 17 = 391
# ==> 23 / 17 = 1
# ==> 23 % 17 = 6
# ==> 23 ** 17 = 141050039560662968926103

# Data structure
# input: 2 Integers
# output: 6 strings for each operation

# Algorithm

# -get the user input, convert to integers and save it to 2 variables: first_number and second_number
# -convert the input to integers
# -create an output where the user can see both numbers, operation and result as in the examples
# Code

def prompt(message)
  puts "==> #{message}"
end

prompt("Enter the first number:")
first_number = gets.chomp.to_i

prompt("Enter the second number:")
second_number = gets.chomp.to_i


puts "==> #{first_number} + #{second_number} = #{first_number + second_number}"

puts "==> #{first_number} - #{second_number} = #{first_number - second_number}"

puts "==> #{first_number} * #{second_number} = #{first_number * second_number}"

puts "==> #{first_number} / #{second_number} = #{first_number / second_number}"

puts "==> #{first_number} % #{second_number} = #{first_number % second_number}"

puts "==> #{first_number} ** #{second_number} = #{first_number ** second_number}"
