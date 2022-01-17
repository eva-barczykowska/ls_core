# Create a method that takes two arguments, multiplies them together, and
# returns the result.
#
# input: 2 integers as parameters to a method
# output of the method: an integer, a result of multiplication of the 2 integers
# algorithm:
# - create a method with 2 parameters
# - inside the body of the method, multiply them
# -return the result

def multiply_two_numbers(num1, num2)
  num1 * num2
end

# multiply_two_numbers(5, 3) == 15

# futher exploration:
# For fun: what happens if the first argument is an Array?
# What do you think is happening here?
multiply_two_numbers([5, 3], 10)
