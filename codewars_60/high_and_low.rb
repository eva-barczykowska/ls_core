# In this little assignment you are given a string of space separated numbers, and have to return the highest and lowest number.
# high_and_low("1 2 3 4 5")  # return "5 1"
# high_and_low("1 2 -3 4 5") # return "5 -3"
# high_and_low("1 9 3 4 -5") # return "9 -5"

# All numbers are valid Int32, no need to validate them.
# There will always be at least one number in the input string.
# Output string must be two numbers separated by a single space, and highest number is first.

# Problem
# =======
# -input is a string of space separated numbers
# -method returns the highest and lowest number in a string, spearated by space

# Examples
# ==========
# high_and_low("1 2 3 4 5") == "5 1"
# =>
# high_and_low("1 2 -3 4 5") == "5 -3"
# =>
# high_and_low("1 9 3 4 -5") == "9 -5"
# =>
# p [1, 9, 3, 4, -5].min

# Algorithm
# ==========
# split this string on a space into an array
# TRANSFORM to numbers
# FIND max number and min number (minmax method?), reverse
# JOIN and return the string containing both

def high_and_low(str)
  arr = str.split.map(&:to_i).minmax.reverse.join(' ')
end
p high_and_low('1 2 3 4 5') == '5 1'
p high_and_low('1 2 -3 4 5') == '5 -3'
p high_and_low('1 9 3 4 -5') == '9 -5'
