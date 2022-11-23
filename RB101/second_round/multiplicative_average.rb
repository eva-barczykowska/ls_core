# https://launchschool.com/exercises/00ee768d
#
# Multiplicative Average
# Write a method that takes an Array of integers as input, multiplies all the
# numbers together, divides the result by the number of entries in the Array,
# and then prints the result rounded to 3 decimal places. Assume
# the array is non-empty.
#
# show_multiplicative_average([3, 5])                # => The result is 7.500
# show_multiplicative_average([6])                   # => The result is 6.000
# show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667

# PEDAC
# Problem
# -write a method that takes an array of numbers and returns the average of
#  these numbers, rounded to 3 decimal places
# -array will never be empty

# Examples
# show_multiplicative_average([3, 5])                # => The result is 7.500
# show_multiplicative_average([6])                   # => The result is 6.000
# show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667

# Data Structures
# input: Array
# output: a float that signifies the average, the float is rounded to 3 characters

# Algorithm
# -initialize `result`and point to to the multiplication all the integers in the array
# -divide the sum by the number of elements in the array
# -I will format the resulting number so that it has 3 decimal places
# -print the formatted string

# precision for `f' is number of digits after the decimal point
# 3f means we want to display 3 decimal places
sprintf("%.3f", 12) #=> "12.000"
sprintf("%0.3f", 12) #=> "12.000"
# 0 signifies to the TOTAL number of characters
sprintf("%10.3f", 12) #=> "    12.000"

sprintf("%20.8f", 1234.56789) #=> "       1234.56789000"
sprintf("%7.8f", 1234.56789) #=> " 12.000"


def show_multiplicative_average(array)
  res = array.inject(:*) / array.size.to_f
  "The result is #{sprintf("%0.3f", res)}"
end

p show_multiplicative_average([3, 5]) == "The result is 7.500"
p show_multiplicative_average([6])== "The result is 6.000"
p show_multiplicative_average([2, 5, 7, 11, 13, 17]) == "The result is 28361.667"
