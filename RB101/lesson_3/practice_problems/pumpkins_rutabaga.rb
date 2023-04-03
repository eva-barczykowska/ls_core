def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
# In both cases, Ruby passes the arguments "by value", but unlike some other languages,
# the value that gets passed is a reference to some object.
# The string argument is passed to the method as a reference to an object of type String.
# Similarly, the array is passed to the method as a reference to an object of type Array.

# The important distinction is that while a reference is passed, the method initializes a new local variable for both
# the string and the array and assigns each reference to the new local variables.
# These are variables that only live within the scope of the method definition.
#
# So, if both arguments live inside the method as a new variable that stores a reference to the passed object...
# why don't the string and the array behave the same way in our output?

# The difference lies in what Ruby does when the program executes either a String#+= operation or an Array#<< operation.

# The String#+= operation is re-assignment and creates a new String object.
# The reference to this new object is assigned to a_string_param.
# The local variable a_string_param now points to "pumpkinsrutabaga", not "pumpkins".
# It has been re-assigned by the String#+= operation.
# This means that a_string_param and my_string no longer point to the same object.

# With the array, one array object can have any number of elements.
# When we attach an additional element to an array using the << operator,
# Ruby simply keeps using the same object that was passed in, and appends the new element to it.

# So, because the local variable an_array_param still points to the original object,
# the local variables my_array and an_array_param are still pointing at the same object,
# and we see the results of what happened to the array "outside" of the method.
#
puts

def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga'] # literal ['pumpkins', 'rutabaga'] array is a new object, and we are assigning it to the local variable an_array_param.
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# As you can see, we have achieved the opposite effect from our last example.

# We are still passing in the same two string and array arguments, but the results are the opposite,
# because our method does the "same thing" to each, but in a different way than before.
# That is, in both cases, the method attempts to change the string from "pumpkins" to "pumpkinsrutabaga"
# and add "rutabaga" to the array.
#
# Despite the similarity of the results inside the method definition,
# the results outside the method definition are the opposite.

# As before, the explanation is all about what Ruby does with a variable when we change the object it points to.
# Does it create a new object? Or is it able to just modify the existing object?
# In this case, our literal ['pumpkins', 'rutabaga'] array is a new object,
# and we are assigning it to the local variable an_array_param.

puts
# Depending on a method to modify its arguments can be tricky:
def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# Whether the above "coincidentally" does what we think we wanted depends upon what is going on inside the method.

# How can we change this code to make the result easier to predict and easier for the next programmer to maintain?
# That is, the resulting method should not mutate either argument, but
# * my_string should be set to 'pumpkinsrutabaga'
# * my_array should be set to ['pumpkins', 'rutabaga']

def not_so_tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]

  return a_string_param, an_array_param # return here
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = not_so_tricky_method(my_string, my_array) # assign the return value to the variables my_string, my_array

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

puts
# another example
# What is the result of the last line in the code below?
#
# greetings = { a: 'hi' }
# informal_greeting = greetings[:a] # when we mutate this (informal_greeting) variable, which points to the same place in memory as greetings, we are also mutating greetings
# informal_greeting << ' there'
#
# puts informal_greeting  #  => "hi there"
# puts greetings

# The output is {:a=>"hi there"}. The reason is because informal_greeting is a reference to the original object.
# The line informal_greeting << ' there' was using the String#<< method, which modifies the object that called it.
# This means that the original object was changed, thereby impacting the value in greetings.
# If instead of modifying the original object, we wanted to only modify informal_greeting but not greetings,
# there are a couple of options:

# we could initialize informal_greeting with a reference to a new object containing the same value by: informal_greeting = greetings[:a].clone.
# we can use string concatenation, informal_greeting = informal_greeting + ' there', which returns a new String object instead of modifying the original object.
# 1
greetings = { a: 'hi' }
informal_greeting = greetings[:a].clone # use a clone of the orginal object that the variable is pointing to, in this case now informal greeting is pointing to a clone of greetings[:a]
informal_greeting << ' there' # we are mutating the clone this time, not to original value like we did on line 110 (look at 109 where we do NOT use clone but point the variable to reference the original object greetings = { a: 'hi' })

puts informal_greeting  #  => "hi there"
puts greetings

2.
greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting = informal_greeting + ' there' # returns a new string and so it does not modify the original object

puts informal_greeting  #  => "hi there"
puts greetings

