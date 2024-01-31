# PEDAC
# P:
# - write a method that takes a STRING of numbers
# - the method returns a STRING of 2 numbers, highest and lowest from the argument number

# E:
# high_and_low("1 2 3 4 5")  # return "5 1"
# "5 1" because 5 is the biggest, 1 is the smallest

# high_and_low("1 2 -3 4 5") # return "5 -3"
# high_and_low("1 9 3 4 -5") # return "9 -5"

# DS:
# - input: string of integers
# - middle: array, convert to integers
# - output: string of 2 numbers, n > n2

# Notes:
# -min, max, minmax
# A:
# - transform to an array of integers

# - extract the biggest and the smallest integer
# - select the MAXIMUM and MINIMUM integer

# - return a string/joined array

def high_and_low(str)
  str.split(" ").map! { |s| s.to_i }.minmax.reverse.join(" ")
end

p high_and_low("1 2 3 4 5") == "5 1"
p high_and_low("1 2 -3 4 5") == "5 -3"
p high_and_low("1 9 3 4 -5") == "9 -5"

