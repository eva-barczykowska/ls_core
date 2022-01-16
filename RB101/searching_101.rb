# Write a program that solicits 6 numbers from the user, then prints a message
# that describes whether or not the 6th number appears amongst the
# first 5 numbers.

# input: from the user, 6 numbers
# output: String with interpolated 6th number and array of input numbers and
# stating appears or does not appear
# algorithm:
# - get input for every number
# - change it to integer using .to_i method
# - build an array from all the integers minus the last one
# - iterate over the whole array and see if any of the first five elements
# elements == num_6

numbers = []
puts "==> Enter the 1st number:"
num1 = gets.chomp.to_i
puts "==> Enter the 2nd number:"
num2 = gets.chomp.to_i
puts "==> Enter the 3rd number:"
num3 = gets.chomp.to_i
puts "==> Enter the 4th number:"
num4 = gets.chomp.to_i
puts "==> Enter the 5th number:"
num5 = gets.chomp.to_i
puts "==> Enter the last number:"
last_number = gets.chomp.to_i

numbers << num1 << num2 << num3 << num4 << num5

if numbers.any? { |number| number == last_number }
  puts "The number #{last_number} appears in #{numbers}."
else
  puts "The number #{last_number} does not appear in #{numbers}."
end

# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 17
# The number 17 appears in [25, 15, 20, 17, 23].
#
#
# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 18
# The number 18 does not appear in [25, 15, 20, 17, 23].

# ls solution:
numbers = []

puts "Enter the 1st number:"
numbers << gets.chomp.to_i
puts "Enter the 2nd number:"
numbers << gets.chomp.to_i
puts "Enter the 3rd number:"
numbers << gets.chomp.to_i
puts "Enter the 4th number:"
numbers << gets.chomp.to_i
puts "Enter the 5th number:"
numbers << gets.chomp.to_i
puts "Enter the last number:"
last_number = gets.chomp.to_i

if numbers.include? last_number
  puts "The number #{last_number} appears in #{numbers}."
else
  puts "The number #{last_number} does not appear in #{numbers}."
end
