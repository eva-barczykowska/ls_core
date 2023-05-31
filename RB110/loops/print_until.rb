# Print Until
# Given the array of several numbers below, use an until loop to print each number.
# numbers = [7, 9, 13, 25, 18]
#
# Expected output:
# 7
# 9
# 13
# 25
# 18

numbers = [7, 9, 13, 25, 18]
counter = 0
until numbers[counter] == nil
  puts numbers[counter]
  counter += 1
end

puts

numbers = [7, 9, 13, 25, 18]
counter = 0
until counter == numbers.size
  puts numbers[counter]
  counter += 1
end