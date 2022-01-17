# Using the multiply method from the "Multiplying Two Numbers" problem, write a
# method that computes the square of its argument (the square is the result of
#   multiplying a number by itself).

# input: an integer
# output: an integer
# algorithm:
# - define a method with 1 parameter
# - inside the method compute the square of the argument
# - call the method with one argument

def multiply_two_numbers(num1, num2)
  num1 * num2
end

def square(n)
  multiply_two_numbers(n, n)
end

square(5) == 25
square(-8) == 64

# Further Exploration
# What if we wanted to generalize this method to a "power to the n" type method:
# cubed, to the 4th power, to the 5th, etc. How would we go about doing so
# while still using the multiply method?
