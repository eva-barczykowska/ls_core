# Write a method that takes a year as input and returns the century. The return
# value should be a string that begins with the century number, and ends with
# st, nd, rd, or th as appropriate for that number.
#
# New centuries begin in years that end with 01. So, the years 1901-2000 comprise
# the 20th century.
#
# Explicit requirements:
# -a method
# -input: a year/integer
# -output: a string, begins with a century number and ends with -st, -nd, -rd or th
#
# Data structures: integer, string
#
# Algorithm:
# -if 1 digit, it's first
# -if 2 digits, it's 2nd
# -if 3 digits, it's 3rd
# if it is more, look at first 2 digits, and select next digit as the century, then....
# -when i arrive at the number, I will check and add a correct ending
# -if it ends with 1 add -st to it
# -if it ends with 2 add -nd to it
# -if it ends with 3 add -rd to it

def century(year)
  century = year / 100 + 1
  century -= 1 if year % 100 == 0
  century.to_s + century_suffix(century)
end

def century_suffix(century)
  return 'th' if [11, 12, 13].include?(century % 100)
  last_digit = century % 10

  case last_digit
  when 1 then 'st'
  when 2 then 'nd'
  when 3 then 'rd'
  else 'th'
  end
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'

# ls solution

# First, notice a pattern about a century. It is equal to the current year
# divided by 100 plus 1. The exception to this is if the year is some multiple
# of 100. In that case, the century is the current year divided by 100.
#
# Next we need to understand which suffix to append for our century, the options
# being: 'th', 'nd', 'rd', 'st'. We decide which one to use by checking the last
# digit of the century. Though, before we do that, we do need to do one extra
# check. If the century's value mod 100 ends in either 11, 12, or 13, then we
# should return 'th'. Any other time, we can return a suffix determined by our
# case statement and the value of century % 10.
