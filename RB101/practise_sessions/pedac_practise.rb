# Write a method that takes two arguments, a string and a positive integer,
# and prints the string as many times as the integer indicates.
#
# repeat('Hello', 3)

# output
# Hello
# Hello
# Hello


# PEDAC
#
# Problem
# -write a method that takes 2 arguments
# -the arguments are 1.a String, 2. a positive Integer
# -the method prints the string as many times as the integer indicates

# Examples
# repeat('Hello', 3)

# output:
# Hello
# Hello
# Hello

# Data Structures
# -input: a String, an Integer
# -a String

# Algorithm
# 1. define a method with 2 parameters, a str and an int
# 2. within the body of the method /CORRECTION:concatenate the input str to itself an integer number of times
# 3. The above will give me `HelloHelloHello`
# 4. I will print each str on a separate line

# Feedback from Allison
# Algorithm
# 1. define a method with 2 parameters, a str and an int
# 2. within the body of the method multiply the str by int
# 3. print the multiplied values on separate lines,like in the example

# 1. It might help to define what variable names your code will use in your algorithm.
#    Doing this also helps me make sure I'm referencing the variables that I intend to in the rest of my algorithm.
#
# 2. The wording of 'multiply the str by int' implies that you already have a set
#    implementation in mind by using some sort of 'multiply' method. An alternate
#    way to talk about this point is to say 'concatenate the input str to itself
#    int number of times.' This is more general and separates the action from the
#    implementation.
#
# 3. 'print the multiplied values on separate lines' could be divided again into
#     another sub-problem. I'm visualizing that, as a result of your step 2, you'll
#     end up with something like the string 'HelloHelloHello'. How will you split this up
#     in such a way that you will be able to print each 'Hello' on a single line?
#     Your algorithm should also include those details.
#     Did I miss something - does 'multiply' actually return an array instead?
#     If it does, you still need to detail a way to traverse the data, find a separation
#     point and print each to a single line.

def repeat(str, number)
  number.times {|word| puts str }
end

p repeat('Hello', 3)
