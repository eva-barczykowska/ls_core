# https://launchschool.medium.com/live-session-beginning-ruby-part-2-f87d821ce926
# 1. What does this code print? What does it return? What concept does it represent?
def prefix(str)
  str + "hola"
  "Mr." + str
end

name = "joe"
name = prefix(name)

puts name

# 2. What is the problem with this code?
def prefix(str)
  str << " -adding this-"
  "Mrs." + str
end

name = "gillian"
name = prefix(name)

puts name
# - method permanently modifies its argument AND I'm capturing the return value
# - this can get out of hand fast
# - it's difficult to know from the penultimate line that this happens
# - we need to read the implementation
# - code with intention, be explicit:
# - do you only care about the return value or you want to only change the caller?

# 4.
def prefix(str)
  "Mr. " + str
end

name = "joe"
prefix(name)

puts name

# to fix it we need to capture the return value or the body of the method should be   "Mr. " << str
# and then it would be also good to add the ! after the method name, i.e. prefix!

# 5.
def amethod(param)
  param + " world"
end

str = "hello"
# amethod

p str

# 6.
def amethod(param)
  param + " world" # string concatenation, non-destructive action, returns a new object, syntactical sugar for param.+( "world")
end

str = "hello"
amethod(str) # method has no permanent effect, i.e. does not mutate the object passed to it as an argument

p str

# 6.
a = "hello"
b = a

# we have 2 variables here but one object, we can access this object via any of these variables
# we can check this calling object_id method on `a` and `b`
# calling a mutating method on one of those variables, either `a` or `b` will mutate the object that the `a`/`b` is referencing
# concept: variables as pointers

# 6.
def amethod(param)
  param += " universe" # this means param = param + " universe"
  param + " universe" # returns new string but that new string is not saved anywhere
  param << " world"
end

str = "hello"
amethod(str)

p str

# maranda
# The above code returns and outputs "hello".
# The method return value is "hello universe world".
# This concept demonstrates Ruby acting like Pass by Value, or that operations performed on the object in
# the method have no affect on the original object outside the method because the method only has a copy of
# the original object. This also demonstrates the concept of variables as pointers,
# in particular is how the variable doesn’t hold the value, they point to a specific location
# in memory that contains the value.  This variable can either be reassigned to a new location,
# by variable reassignment, or the information in the memory location can be mutated by a mutating method or operation.
# Variable reassignment is where a variable that already refers to a value is reassigned to a new location in memory.
#
# On line 7, the local variable str is initialized and assigned to the string object "hello".
# On line 8, we invoke the custom method amethod with one argument, str.
# On line 9, we pass str to the p method, and the output is "hello".
# On lines 1-5 we define our custom method, amethod with a single parameter, param.
# On line 2, we reassign param to the result of param concatenated to " universe" resulting in "hello universe".
# On line 3, we have ’param + ” universe” which results in no changes.
# On line 4, we use the shovel operator to append " world" which results in "hello universe world".
# On line 5 we end our custom method with the end keyword. (edited)
# concepts: reassignment, concatenation, mutation
#
# my answer:
def amethod(param)
  param += " universe" # this means param = param + " universe"
  param + " universe" # returns new string but that new string is not saved anywhere
  param << " world"
end

str = "hello"
amethod(str)

p str

# On lines 1-5 a custom method `amethod` is defined with 1 parameter, `param`.
# Within the body of the method, on the 1st line, `param` is reassigned to point to the return value of
# concatenating `param` and " universe".
# So it becomes a new string, `"hello universe"`.
# On the 3rd line that new string is subjected to String#+ method, concatenation, but the result of this concatenation,
# a new string, is not saved anywhere so this line brings no change.
# On the last line of the method, the line that becomes method's implicit return, the string object " world" is appended
# to the `param` using the destructive `<<` method. This method mutates the caller.
#
# `amethod` method is invoked on line 8, and an argument is passed to it: the object that `str` is pointing to. `str`
# was initialized on line 7  to point to a string object `"hello"`.
# The method's return value is `"hello world universe"` but it is not saved anywhere or printed.
#
# When we use the Kernel#p method on the last line and pass `str` as an argument, unchanged string "hello" is printed
# and returned.
#
# The reason why `str` remains unchanged is that `param` has been reassigned to point to another string on the 1st line
# of the body of the method and from that moment on it is not possible to change the original `str` passed to the
# method an an argument.
#
# This code represents the concept of Variables as pointers, specifically that variables are not values themselves
# but they point to objects in memory. A pointer can be changed as so a variable will hold a different value.
#
# We can also say that this code illustrates that Ruby acts as Pass by Value, i.e. operations performed inside the method
# have no effect on the object passed to the method as an argument because it is actually a copy of the object that was
# passed and not the object itself.

# 6.
def amethod(param)
  param + " world" # concatenation, returns a new string but we are not saving it to a variable, so no change, it would be different it the operator would be +=
  param << " world"
end

str = "hello"
amethod(str)

p str

# 6.
def amethod(param)

end

str = "hello"
amethod(str)

p str

# str remains unchanged because inside the method nothing happened
# empty method returns `nil`

def amethod(param)
  param += " universe"
  param + " universe"
  param << " world"
end

str = "hello"
amethod(str)
p str

# 7.
a = "hello"
b = a

b << " ewa"


puts a
puts b

# both point to "hello ewa"
# 2 variables are pointing to 1 object
# variables as pointers, mutation

# 8.
a = "hello"
b = a

a += " world"
b << " ewa"


puts a
puts b

# 2 variables, 2 objects
# each variable is referencing a different object now

# 9.
a = "hello"
b = a

b << " world"

# 2 variables are pointing to 1 object

puts a
puts b

a = "hey"

puts a
puts b

# 2 variables, 2 objects

# 10.
a = "hello"
b = a

b << " world"

p a
p b

# mutation, mutating both a and b are referencing "hello world" now

# 11.
a = "hello"
b = a

a += " world"

p a
p b

# reassignment, non-mutating

# 11.
a = "hello"
b = a

a + "world"

p a
p b

# concatenation, non, mutating, returns a new string but the new string is not saved anywhere so both a and b remain unchanged

# 12.
def amethod(param)
  param += " universe" # param = param += " universe"
  param << " world"
end

str = "hello"
amethod(str)

p str

# reassignment, 2nd line returns a new string and then that string (and not our argument passed to the method) is
# subjected to mutation
# str remains unchanged

# 13.
def amethod(param)
  str += " world" # param = param += " world"
end

str = "hello"
amethod(str)

p str

# guarantees error because `str` doesn't exist within the method and the method doesn't have access to it
# because `str` is initialized in different (outer) scope and methods create their own scope.
# If we want `str` to be accessible within the method, we must pass it into the method, as a method parameter.
# Then the param (method scoped variable) and `str` (locally scoped variable) become aliases, i.e. they point to
# the same string object. And that string object becomes available within the method and we can perform different actions
# on it.

# 14.
def amethod(param)
  param += " world"
end

str = "hello"

amethod(str)

p str

# method returns new string object, which has no effect on `str`
# concept demonstrated is reassignment, which is a non-destructive action that returns a brand new string object

# 15.
def amethod(param)
  param << " world"
end

str = "hello"

amethod(str)

p str

# This method mutates the argument passed to it
# Concept demonstrated is mutation