# Write a method that takes a string as an argument and returns the left most digit in the string.
#
# Notes
# Each string will have at least two numbers.
#   Return the result as an integer.
#   Examples
# N:
# char == char.to_i.to_s
# find

# P:
# - transform str arg into an array of chars
# - find the first integer by checking if each character converted to an integer
#   and then back to the str is the same as the initial string

# - change the resulting str to an integer and return it

def left_digit(str)

  str.chars.find { |char| char == char.to_i.to_s }.to_i
end
p left_digit("TrAdE2W1n95!") == 2
p left_digit("V3r1ta$") == 3
p left_digit("U//DertHe1nflu3nC3") == 1
p left_digit("J@v@5cR1PT") == 5

