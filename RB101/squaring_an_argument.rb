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
# algorithm:
# if the power is just 2, I return the result of the multiply_two_numbers method
# if the power is more than 2, I have to multiply that result
#   (of multiply_two_numbers) further
# further by the digit
# I have to keep multiplying the result of the first execution of
# multiply_two_numbers BY DIGIT until I reach the power number
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
p power_to_the_n(7, 2) == 49
p power_to_the_n(7, 3) == 343
p power_to_the_n(5, 3) == 125
p power_to_the_n(5, 4) == 625
p power_to_the_n(5, 5) == 3125
p power_to_the_n(4, 7) == 16384

# It took me 3 hours but I did it!!!

# I didn't account for power 0 or power 1, here's the changed code:

puts "Improved method:"
def power_to_the_n(digit, n)
  if n == 0
    result = 0
  elsif n == 1
    result = digit
  elsif n <= 2
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

p power_to_the_n(7, 0) == 0
p power_to_the_n(7, 1) == 7
p power_to_the_n(7, 2) == 49
p power_to_the_n(7, 3) == 343
p power_to_the_n(5, 3) == 125
p power_to_the_n(5, 4) == 625
p power_to_the_n(5, 5) == 3125
p power_to_the_n(4, 7) == 16384

puts "I liked this solution and was wondering about the reduce method myself:"

def multiply(x, y)
  x * y
end

def square(x)
  multiply(x, x)
end

def power(x, n)
  base_array = []
  (n).times do
    base_array << x
  end
  base_array.reduce(:*)
end

p power_to_the_n(7, 0) == 0
p power_to_the_n(7, 1) == 7
p power_to_the_n(7, 2) == 49
p power_to_the_n(7, 3) == 343
p power_to_the_n(5, 3) == 125
p power_to_the_n(5, 4) == 625
p power_to_the_n(5, 5) == 3125
p power_to_the_n(4, 7) == 16384

puts "I like this because it's very clear:"

def multiply(x, y)
  x * y
end

def square(num)
  multiply(num, num)
end

def power(x, n)
  case n
  when 0 then 1
  when 1 then x
  else multiply(x, power(x, n - 2))
  end
end

p power_to_the_n(7, 0) == 0
p power_to_the_n(7, 1) == 7
p power_to_the_n(7, 2) == 49
p power_to_the_n(7, 3) == 343
p power_to_the_n(5, 3) == 125
p power_to_the_n(5, 4) == 625
p power_to_the_n(5, 5) == 3125
p power_to_the_n(4, 7) == 16384

puts "The shortest:"

def power(number, power)
  multiply_two_numbers(number, 1) ** power
end

p power_to_the_n(7, 0) == 0
p power_to_the_n(7, 1) == 7
p power_to_the_n(7, 2) == 49
p power_to_the_n(7, 3) == 343
p power_to_the_n(5, 3) == 125
p power_to_the_n(5, 4) == 625
p power_to_the_n(5, 5) == 3125
p power_to_the_n(4, 7) == 16384
