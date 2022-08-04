# In the modern era under the Gregorian Calendar, leap years occur in every year
# that is evenly divisible by 4, unless the year is also divisible by 100.
# If the year is evenly divisible by 100, then it is not a leap year unless
# the year is evenly divisible by 400.
#
# Assume this rule is good for any year greater than year 0. Write a method
# that takes any year greater than 0 as input, and returns true if the year is a
# leap year, or false if it is not a leap year
#
# Explicit requirements:
# -a method that takes any number greater than 0 as input and returns true
# if the year is a leap year
# leap year - each year divisible by 4
# but NOT if it is evenly divisible by 4 and 100
# unless it's evenly divisible by 4 and 100 and 400 then it's a leap year.
#
# Data structures:
# -input: integer
# -output: boolean
#
# # Algorithm:
# verify if the year is evenly divisible 400 --
# all those years are 100% leap years
# return true if yes
# then check if the year is divisible by 100 and return false if it is
# then check if the year is evenly divisible by 4

def leap_year?(year)
  if year % 400 == 0
    true
  elsif year % 100 == 0
    false
  else year % 4 == 0
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

# So first we are checking if the year is divisible by 4 and 400 because those
# years will ALWAYS be leap years. And we explicitly return true if this is true.
# Then, from all the years that are possibly left, those won't be divisible by
# 4 and 400. But the question is - are they still divisible by 4? If yes,
# this means that they are also leap years and so we return true.

puts ""
# ls solution

def leap_year?(year)
  if year % 400 == 0
    true
  elsif year % 100 == 0
    false
  else
    year % 4 == 0
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

# or

def leap_year?(year)
  (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)
end

puts ""
# Further Exploration
# The order in which you perform tests for a leap year calculation is important.
# For what years will leap_year? fail if you rewrite it as:

def leap_year?(year)
  if year % 100 == 0
    false
  elsif year % 400 == 0
    true
  else
    year % 4 == 0
  end
end

#for those years which are divisible both by 100 and 400

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
