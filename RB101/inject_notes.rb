# reduce is an alias for inject, these methods behave in the same manner

# We can use inject to sum elements of the array if they're all integers

[1, 2, 5, 8, 4, 80].inject { |sum, number| sum + number }
[1, 2, 5, 8, 4, 80].inject(:+)
[1, 2, 5, 8, 4, 80].inject(:*)

# if we are not passing arguments to inject, we can use the method shortcuts
# In the above example, summing starts from the first element of the array
# We can start from zero or any other number - in that case inject takes
# an argument:

[1, 2, 5, 8, 4, 80].inject(0) { |sum, number| sum + number }

# The result is the same but we can pass a number other than zero and then
# the result will be different:

[1, 2, 5, 8, 4, 80].inject(10) { |sum, number| sum + number }

puts "************************************************************************"

# We can use inject method to build a hash:

array = [[:student, "Terrence Koar"], [:course, "Web Dev"]].inject({}) do |result, element|
  result[element.first] = element.last
  result
end

# We can use inject method to build a convert data:
[[:student, "Terrence Koar"], [:course, "Web Dev"]].inject({}) do |result, element|
  result[element.first.to_s] = element.last.upcase
  result
end

#or

[[:student, "Terrence Koar"], [:course, "Web Dev"]].inject({}) do |result, element|
  result[element.first.to_s] = element.last.split
  result
end

# We can use inject method to filter and build new array:

[10, 20, 30, 5, 7, 9, 3].inject([]) do |result, element|
  result << element.to_s if element > 9
  result
end
