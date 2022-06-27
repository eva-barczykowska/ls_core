# Write a method that takes an Array of integers as input, multiplies all the numbers together,
# divides the result by the number of entries in the Array, and then prints the result
# rounded to 3 decimal places. Assume the array is non-empty.

# Examples:

# Copy Code
# show_multiplicative_average([3, 5])                # => The result is 7.500
# show_multiplicative_average([6])                   # => The result is 6.000
# show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667
# Hint

# given an Array
# multiply the elements together
# divide the number by the size of the Array
# return the quotient rounded to 3 decimal places

def show_multiplicative_average(array)
  puts format("%.03f", (array.reduce(:*) / array.size.to_f).round(3))
end

show_multiplicative_average([6, 6])
show_multiplicative_average([3, 5])
show_multiplicative_average([6])
show_multiplicative_average([2, 5, 7, 11, 13, 17])

# ls solution
def show_multiplicative_average(numbers)
  product = 1.to_f
  numbers.each { |number| product *= number }
  average = product / numbers.size
  puts "The result is #{format('%.3f', average)}"
end

show_multiplicative_average([6, 6])
show_multiplicative_average([3, 5])
show_multiplicative_average([6])
show_multiplicative_average([2, 5, 7, 11, 13, 17])

puts ""

puts "further exploration"
# further exploration
def show_multiplicative_average(numbers)
  product = 1
  numbers.each { |number| product *= number }
  average = product / numbers.size
  puts "The result is #{format('%.3f', average)}"
end

show_multiplicative_average([6, 6])
show_multiplicative_average([3, 5])
show_multiplicative_average([6])
show_multiplicative_average([2, 5, 7, 11, 13, 17])

# other solutions
# Would this be considered a good solution if the method is not printing the result
# on its own but we need to use p in front of it?

def show_multiplicative_average(arr)
  result = (arr.inject(:*).to_f / arr.size)
  format('%.3f', result)
end

#here we actually need to use p in order for the result to be printed
p show_multiplicative_average([6, 6])
p show_multiplicative_average([3, 5])
p show_multiplicative_average([6])
p show_multiplicative_average([2, 5, 7, 11, 13, 17])
