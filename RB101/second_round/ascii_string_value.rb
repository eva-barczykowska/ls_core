# ASCII String Value
# Write a method that determines and returns the ASCII string value of a string
# that is passed in as an argument. The ASCII string value is the sum of the
# ASCII values of every character in the string.
# (You may use String#ord to determine the ASCII value of a character.)

# ascii_value('Four score') == 984
# ascii_value('Launch School') == 1251
# ascii_value('a') == 97
# ascii_value('') == 0

# PEDAC
# Problem
# -write a method that takes 1 argument: a string
# -the method returns ASCII value of the string
# -the ACII value is calculated by summing the ASCII value of each character
# in the string
# -we can find out the ASCII value of each character by calling the #ord method

# Examples
# ascii_value('Four score') == 984
# ascii_value('Launch School') == 1251
# ascii_value('a') == 97
# ascii_value('') == 0

# Data structures
# -input is a string
# -middle: array
# -output: integer representing the sum of all characters

# Algorithm
# -if arg is '', I return 0
# -initialize the sum variable
# -divide the string into characters
# -iterate through this array and as I go,
# -I will add values representing ASCII character value to the sum
# -return the sum

def ascii_value(str)
  sum = 0
    str.chars.each do |ch|
      sum += ch.ord
    end
  sum
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

puts

def ascii_value(str)
  return 0 if str.empty?
  str.chars.map { |ch| ch.ord }.inject(:+)
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

puts

def ascii_value(str)
  return 0 if str.empty?
  str.chars.map(&:ord).inject(:+)
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0
