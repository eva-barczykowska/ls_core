# 1. Explain the concept of Variables and pointers and give a code example
# In Ruby variables themselves do not contain values but rather point to objects in memory.

carrot_price = 35
kale_price = carrot_price

carrot_price = 20

p kale_price
p carrot_price

# 2. Explain the concept of Variable shadowing and give a code example

school = "UCLA"

1.times do |school|
  school = "Launch School"
end

# 3. Explain the concept of Variable scope in relation to methods and give a code example
arg1 = "first"
arg2 = "second"

def my_method(arg1)
  arg1 + arg2
end
# my_method(5, 10)

# 3. Why doesn't this work? What concept is illustrated here?
CONVERSION = 1.6
kilometres = 100

def convert_to_miles(kilometres)
  miles = kilometres * CONVERSION
end

p convert_to_miles(kilometres)
# p miles

# 4. Explain the concept of Variable scope in relation to blocks and give a code example

product = "toothpaste"
1.times do
  product = "dental floss"
  fruit = "papaya"
  p fruit
end

p product
# p fruit

# 5. What control flow techniques do you know in Ruby? Give examples
# -comparison, which returns true or false
# -conditionals if-elsif-else, unless
# -ternary operator
# -case statement

# 7.Explain the difference between loop and for loop

# 8.When do we use ternary expression? Give an example of ternary expression
adult = true

adult ? "Can buy alcohol" : "NOT ALLOWED to buy alcohol"

# another example
adult = 15

adult ? "Can buy booze" : "NOT ALLOWED to buy booze"

# Ternary expression is should be used to select between 2 values and NOT 2 actions
# (we shouldn't be printing a value or setting a variable to a new value)

# Ternary operator's result should be assigned to a variable or returned by the method

# 9.When do we use case statement? Give an example(s) of case statements

# 10.Explain the difference between truthy and true? Give code examples
#
# 11. What loops and iterators do you know in ruby?
# -the Kernel#loop method
# -the while loop (not implemented as a method)
# -until loop (not implemented as a method)
# -the for loop (not implemented as a method)
#
# iterators: each, map, select, reject

# 11. How do we control a loop? Give code examples
# -use break
# -use the keyword next
# -use for loop that will loop over a limited number of elements by design
# -we can also have an if statement inside the loop
# -we can have a loop inside the loop as well
# do/while loops, not recommended by the creator or Ruby