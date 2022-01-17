# Write a program that prompts the user for two positive integers, and then
# prints the results of the following operations on those two numbers: addition,
# subtraction, product, quotient, remainder, and power. Do not worry
# about validating the input.

# input: 2 positive integers from the user
# output: results of addition, substraction, product, quotient, remainder, power
# algorithm:
# - ask for input
# - print out strings with all the actions interpolated

puts "==> Enter the first number:"
num1 = gets.chomp.to_i
puts "==> Enter the second number:"
num2 = gets.chomp.to_f
puts "==> #{num1} + #{num2} = #{num1 + num2}"
puts "==> #{num1} - #{num2} = #{num1 - num2}"
puts "==> #{num1} * #{num2} = #{num1 * num2}"
puts "==> #{num1} / #{num2} = #{num1 / num2}"
puts "==> #{num1} % #{num2} = #{num1 % num2}"
puts "==> #{num1} ** #{num2} = #{num1**num2}"
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

# ls solution:
# def prompt(message)
#   puts "==> #{message}"
# end
#
# prompt("Enter the first number:")
# first_number = gets.chomp.to_i
# prompt("Enter the second number:")
# second_number = gets.chomp.to_i
#
# prompt("#{first_number} + #{second_number} = #{first_number + second_number}")
# prompt("#{first_number} - #{second_number} = #{first_number - second_number}")
# prompt("#{first_number} * #{second_number} = #{first_number * second_number}")
# prompt("#{first_number} / #{second_number} = #{first_number / second_number}")
# prompt("#{first_number} % #{second_number} = #{first_number % second_number}")
# prompt("#{first_number} ** #{second_number} = #{first_number**second_number}")

# solution I liked
# def prompt(str)
#   puts ">> #{str}"
# end
#
# nums = []
# operations = [:+, :-, :*, :/, :%, :**]
#
# prompt('first num?')
# nums << gets.to_i
# prompt('second num?')
# nums << gets.to_i
#
# operations.each do |op|
#   prompt("#{nums[0]} #{op} #{nums[1]} = #{nums.inject(op)}")
# end

# here I like that he enclosed all the operations in the method
# def operations(num1, num2)
#   puts "#{num1} + #{num2} = #{num1 + num2}"
#   puts "#{num1} - #{num2} = #{num1 - num2}"
#   puts "#{num1} * #{num2} = #{num1 * num2}"
#   puts "#{num1} / #{num2} = #{num1 / num2}"
#   puts "#{num1} % #{num2} = #{num1 % num2}"
#   puts "#{num1} ** #{num2} = #{num1 ** num2}"
# end

# puts "==> enter the first number:"
# num1 = gets.chomp.to_i
#
# puts "==> enter the second number:"
# num2 = gets.chomp.to_i
#
# operations(num1, num2)

# here with the .inject method
# operations_array = %i(+ - * / % **)
#
# puts "=> Enter the first number:"
# first = gets.chomp.to_f
# puts "=> Enter the second number:"
# second = gets.chomp.to_f
#
# operations_array.each do |operation|
#   result = [first, second].inject(operation)
#   puts "#{first} #{operation} #{second} = #{result}"
# end
