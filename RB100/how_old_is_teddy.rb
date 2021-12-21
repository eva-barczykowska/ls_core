# Build a program that randomly generates and prints Teddy's age.
# To get the age, you should generate a random number between 20 and 200.

# PEDAC
# understand the Problem, input, output
# inputs
# -- none, we just run the programme
# -- unless it's further exploration exercise and there we ask the user to input name
# output
# -- A string with interpolated random number

# provide Examples
# -- we run the program and the output is for example: Teddy is 69 years old!
#                                                      Ewa is 109 years old!
# -- in further exploration the output is the name we gave when prompted followed
#    by the age

# what are the Data Structures you will work with
# -- strings (for printing out the message), integers (for providing the random number within a range)

# define your Algorithm
# -- how to generate a random integer in Ruby?
# -- it has to be between 20 and 200
# finally - Code!
#
# def how_old
#   number = Random.new
#   result = number.rand(20..200)
#   print "Teddy is #{result} years old!"
# end
# #
# how_old
# # Teddy is 69 years old!
# puts ""
#
# # LS solution was not a method
# # we are not told to write a method
# # read and reread the task, do not rush
# age = rand(20..200)
# puts "Teddy is #{age} years old!"

# Modify this program to ask for a name, and then print the age for that person.
# For an extra challenge, use "Teddy" as the name if no name is entered.
# puts ""

puts "Write a name here, I will give you the age of that person:"
name = gets.chomp
if name.empty?
  name = "Teddy"
end
age = rand(20..200)
puts "#{name} is #{age} years old!"
