# Build a program that randomly generates and prints Teddy's age.
# To get the age, you should generate a random number between 20 and 200.

# PEDAC
# understand the Problem, input, output
# -- none, just call the method
# provide Examples
# -- how_old
# what are the Data Structures you will work with
# -- strings (for printing out the message), integers (for providing the random number within a range)
# define your Algorithm
# -- how to generate a random integer in Ruby?
# -- it has to be between 20 and 200
# finally - Code!

def how_old
  number = Random.new
  result = number.rand(20..200)
  print "Teddy is #{result} years old!"
end

how_old
# Teddy is 69 years old!
puts ""

# LS solution was not a method
# we are not told to write a method
# read and reread the task, do not rush
age = rand(20..200)
puts "Teddy is #{age} years old!"
