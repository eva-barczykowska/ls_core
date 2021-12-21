# Build a program that asks a user for the length and width of a room in meters
# and then displays the area of the room in both square meters and square feet.

# Note: 1 square meter == 10.7639 square feet

# Do not worry about validating the input at this time.

# Example run
# Enter the length of the room in meters:
# 10
# Enter the width of the room in meters:
# 7
# The area of the room is 70.0 square meters (753.47 square feet).

# PEDAC
# understand the Problem, input, output
# inputs
# -- integer or a float
# output
# -- a string, a sentence with interpolated result in m and sq.feet

# provide Examples
# Example run
# Enter the length of the room in meters:
# 10
# Enter the width of the room in meters:
# 7
# The area of the room is 70.0 square meters (753.47 square feet).

# what are the Data Structures you will work with
# -- string (for printing out the message), floats for input and area

# define your Algorithm
# -- take length input from user in meters
# -- convert it to float in meters
# -- take width input from user
# -- convert it to float
# -- calculate the area in square meters
# -- convert area in square meters into square feet and save it to a variable
# -- print the info for the user what is the area in m and sq.feet
# finally - Code!

puts "Hello. Enter the length of the room in meters:"
length = gets.chomp.to_f

puts "And now enter the width of the room in meters:"
width = gets.chomp.to_f

area_in_meters = length * width

area_in_feet = (area_in_meters * 10.7639).round(2)

puts "The area of the room is #{area_in_meters} square meters or #{area_in_feet.round(2)} square feet."


# LS solution includes the use of CONSTANT
# This is good practice any time you have a number whose meaning
# is not immediately obvious upon seeing it.
# also, remember about spaces between the lines - readibility!
# look at \ used to split a long line
# ==> improves readibility as well

SQMETERS_TO_SQFEET = 10.7639

puts '==> Enter the length of the room in meters: '
length = gets.to_f

puts '==> Enter the width of the room in meters: '
width = gets.to_f

square_meters = (length * width).round(2)
square_feet = (square_meters * SQMETERS_TO_SQFEET).round(2)

puts "The area of the room is #{square_meters} " + \
     "square meters (#{square_feet} square feet)."

# Futher exploration:
# Modify this program to ask for the input measurements in feet,
# and display the results in square feet, square inches,
# and square centimeters.

SQFEET_TO_SQCENTIMETERS = 329.03
SQFEET_TO_SQINCHES = 144

puts "Hello. Enter the length of the room in square feet:"
length = gets.chomp.to_f

puts "And now enter the width of the room in square feet:"
width = gets.chomp.to_f

area_in_sqfeet = length * width.round(2)

area_in_sqcentimeters = (area_in_feet * SQFEET_TO_SQCENTIMETERS).round(2)

area_in_sqinches = (area_in_sqfeet * SQFEET_TO_SQINCHES).round(2)

puts "The area of the room is #{area_in_sqfeet} square feet,\
 #{area_in_sqinches} square inches or #{area_in_sqcentimeters} square centimeters."

# inputs
# -- width and length in feet
# output
# -- display results in square feet, in square inches and square centimeters
