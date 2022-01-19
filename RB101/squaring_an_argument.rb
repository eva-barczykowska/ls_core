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

# p square(5) == 25
# p square(-8) == 64

# Further Exploration
# What if we wanted to generalize this method to a "power to the n" type method:
# cubed, to the 4th power, to the 5th, etc. How would we go about doing so
# while still using the multiply method?
# if the power is just 2, I return the result of the multiply_two_numbers method
# if the power is more than 2, I have to multiply that result
#   (of multiply_two_numbers) further
# further by the digit
# I have to keep multiplying the result of the first execution of multiply_two_numbers BY DIGIT until I reach the power number
# like (2 * 2) * 2 * 2 * 2

def power_to_the_n(digit, n)
  if n <= 2
    result = multiply_two_numbers(digit, digit)
  elsif n > 2
    counter = 2
    result = multiply_two_numbers(digit, digit)
    until counter == n
      result *= digit
      counter += 1
    end
  end
  result
end
#
# p power_to_the_n(7, 2) == 49
# p power_to_the_n(7, 3) == 343
p power_to_the_n(5, 3) == 125
p power_to_the_n(5, 4) == 625
p power_to_the_n(5, 5) == 3125
p power_to_the_n(4, 7) == 16384
