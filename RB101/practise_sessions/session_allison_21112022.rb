=begin
The British Empire adopted the Gregorian Calendar in 1752, which was a
leap year. Prior to 1752, the Julian Calendar was used.
Under the Julian Calendar,
leap years occur in any year that is evenly divisible by 4.

Using this information, update the method from the previous exercise
to determine leap years both before and after 1752.
=end
=begin pedac

*************Problem***************************
Overall goal: to update prior program to determine leap years before and after
1752
initial input: integer (year)
overall output: boolean (true if year is leap year)

explicit requirements:
modify existing program
if year < 1752,  leap year occur if year % 4 == 0
if year >= 1752 leap year occurs as per old program

implicit requirements:

questions:

*************Examples and Test cases************
++restate all test cases given
++add edge cases, 0 and empty:
leap_year?(2016) == true
leap_year?(2015) == false
leap_year?(2100) == false
leap_year?(2400) == true
leap_year?(240000) == true
leap_year?(240001) == false
leap_year?(2000) == true
leap_year?(1900) == false
leap_year?(1752) == true
leap_year?(1700) == true
leap_year?(1) == false
leap_year?(100) == true
leap_year?(400) == true

*************Data Structure********************

************Algorithm*************************
A. High Level Algorithm
  1. if year < 1752 if year % 4 == 0, return true. false otherwise
  2. if year >= 1752 do prior program
  3.
B Detailed Algorithm
  1.
  2.
  3.
=end

# def leap_year?(year)
#   if year >= 1752
#     if year % 400 == 0
#       true
#     elsif year % 100 == 0
#       false
#     else
#       year % 4 == 0
#     end
#   else
#     year % 4 == 0
#   end
# end

require 'pry'

def leap_year?(year)
  if year < 1752 && year % 4 == 0 # this works becasue && evaluates to true or false
  # if year < 1752
    # return true if year % 4 == 0
    # puts "#{(true if year % 4 == 0).class}"
    # return false if year % 4 != 0
    return true
  else
    if year % 400 == 0
      true
    elsif year % 100 == 0
      false
    else
      year % 4 == 0
    end
  end
end

puts
"another version where I provide 2 branches to go into: for true and false option"

def leap_year?(year)
  if year < 1752
    return true if year % 4 == 0 # I need to provide both returns, for the true and also for the false scenario
    # puts "#{(true if year % 4 == 0).class}"
    return false if year % 4 != 0
    return true
  else
    if year % 400 == 0
      true
    elsif year % 100 == 0
      false
    else
      year % 4 == 0
    end
  end
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == true
p leap_year?(1) == false
p leap_year?(100) == true
p leap_year?(400) == true

puts
puts
# Convert a String to a Number!
# The String#to_i method converts a string of numeric characters
# (including an optional plus or minus sign) to an Integer. String#to_i and
# the Integer constructor (Integer()) behave similarly. In this exercise,
# you will create a method that does the same thing.

# Write a method that takes a String of digits, and returns the appropriate
# number as an integer. You may not use any of the methods mentioned above.

# For now, do not worry about leading + or - signs, nor should you worry
# about invalid characters; assume all characters will be numeric.

# You may not use any of the standard conversion methods available in Ruby
# to convert a string to a number, such as String#to_i, Integer(), etc.
# Your method should do this the old-fashioned way and calculate the result
# by analyzing the characters in the string.

# Examples
# string_to_integer('4321') == 4321
# string_to_integer('570') == 570

# PEDAC
# Problem
# -we have a string, we need to convert it to an integer
# -no inbuild methods can be used
# -the method takes a string and returns corresponding integer

# Examples
# string_to_integer('4321') == 4321
# string_to_integer('570') == 570

# Data structures
# input: string Object
# output: Integer Object

# Algorithm
# -use a loop
# -we will start with counter = 0
# -initiliaze the number that will be returned as a result
# -loop until you reach the string version of the argument

# Code
puts 'here it is'
# def string_to_integer(str)
#   num = 0
#   loop do
#     num += 1 #--- 1, 2, 3, 4, 5,etc.
#     break if num.to_s == str #break returns nil! is 5.to_s == '5'
#   end
#   num
# end

def string_to_integer(str)
  num = 0
  while num != num.to_s
    num += 1
    if num.to_s == str # I am comparing a string to a string
      return num
    end
  end
end

p string_to_integer('4321') == 4321
# p string_to_integer('1570') == 570

puts
 puts "< will not work"
def string_to_integer(str)
  num = 0
  while num.to_s < str # '0' < '1' => true, '1' < '1' => true '2' < '1'=> FALSE but we add 1 to num on line 199
    # binding.pry
    p num
    num += 1
  end
  # num
end

# p string_to_integer('4321') == 4321
p string_to_integer('1570') #== 1570

# 0.to_s < '1570' => true
# 1.to_s < '1570' => true
# 2.to_s < '1570' => false because 2.to_s is GREATER than 1.to_s (it takes into consideration only the first character of the string)

puts
puts "!+ will work"
def string_to_integer(str)
 num = 0
 while num.to_s != str #this comparison will work thanks to !=
   # binding.pry
   num += 1
 end
 num
end

p string_to_integer('1570') #== 1570
p string_to_integer('1570') == 1570
