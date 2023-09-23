# Create a function that takes an integer and returns the factorial of that integer.
#   That is, the integer multiplied by all positive lower integers.


def factorial(num)
  (1..num).to_a.inject(:*)
end
p factorial(3) == 6
# 1*2*3
p factorial(5) == 120
# 1*2*3*4*5
p factorial(13) == 6227020800