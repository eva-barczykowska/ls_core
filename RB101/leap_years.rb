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
# #
# # Data structures:
# # -input: integer
# # -output: boolean
# #
# # # Algorithm:
# verify if the year is divisible by 4
# check if it's divisible by 100 as well
# check if it's divisible by 400 as well
# by 4 yes
# by 4 and by 100 no
# by 4, 100 and 400 yes

def divisible_by_four(number)
  number % 4 == 0
end

def divisible_by_four_and_a_hundred(number)
  number % 4 == 0 && number % 100 == 0
end

def divisible_by_four_hundred(number)
  number % 400 == 0
end

def leap_year?(year)
  if divisible_by_four(year) && divisible_by_four_and_a_hundred(year) && divisible_by_four_hundred(year)
    return true
  else
    return false
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
