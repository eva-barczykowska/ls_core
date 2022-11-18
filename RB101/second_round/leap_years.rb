# https://launchschool.com/exercises/f44b8f8b
#
# Leap Years (Part 1)
# In the modern era under the Gregorian Calendar,
# leap years occur in every year that is evenly divisible by 4,
# unless the year is also divisible by 100.
#   If the year is evenly divisible by 100, then it is not a leap year unless
# the year is evenly divisible by 400.
#
# Assume this rule is good for any year greater than year 0.
# Write a method that takes any year greater than 0 as input,
# and returns true if the year is a leap year, or false if it is not a leap year.
#
# PEDAC
# Problem
# -when is it a leap year?
# -if the year is divisible by 4 but not by 100 - hypothesis to test
# -if the year is divisible by 100 and also by 400 - hypothesis to test
#
# -so every year divisible by 4 or 400 will be a leap year
# -then the year has to be evenly divisible by 4 but not by 100
#
#
# Examples
# leap_year?(2016) == true
# leap_year?(2015) == false
# leap_year?(2100) == false
# leap_year?(2400) == true
# leap_year?(240000) == true
# leap_year?(240001) == false
# leap_year?(2000) == true
# leap_year?(1900) == false
# leap_year?(1752) == true
# leap_year?(1700) == false
# leap_year?(1) == false
# leap_year?(100) == false
# leap_year?(400) == true
#
# Data Structures
# input: integer representing a year
# output: boolean (true or false)
#
# Algorithm
# repeated from the problem:
# -this reminds me of a funnel, sifting through the possibilities
# -so every year divisible by 4 or 400 will be a leap year
# -then the year has to be evenly divisible by 4 but not by 100
#
# Code

def leap_year?(year)
  if year % 4 == 0 && year % 400 == 0 # tested this line and it's OK.
    true
  else
    year % 4 == 0 && year % 100 != 0 # then we need to check if the year is divisible by 4 but not by 100
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
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true
