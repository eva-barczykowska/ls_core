# One way to categorize Ruby methods is splitting them into mutating and non-mutating.
# A mutating method is one that causes some kind of permanent change to either the calling object
# or its (method's) arguments. Non-mutating methods will not be able to cause a permanent change to the Objects
# that they are called on. Instead, they return a new object, whose value can be captured by saving it to a variable.
#
# # non-mutating method
# a = "string"
# b = a.upcase
#
# puts "'#{a}' is the object located at #{a.object_id}"
# puts "'#{b}' is the object located at #{b.object_id}"
#
# # => 'string' is the object located at 260
# # => 'STRING' is the object located at 280
#
# # mutating method
#
# a = "string"
# b = a.upcase!
#
# puts "'#{a}' is the object located at #{a.object_id}"
# puts "'#{b}' is the object located at #{b.object_id}"
#
# # => 'STRING' is the object located at 300
# # => 'STRING' is the object located at 300


# Non-Mutating Methods
# A non-mutating method is a method that does not modify the calling object or any of its arguments.
# In documentation these methods are often said to return new_obj instead of self.
# Note that when dealing with immutable objects (like Integers, Nil, True or False, Range, Symbols),
# all methods can be considered non-mutating.

# Variable Assignment
# Variable assignment is always non-mutating.
# This is because it causes the variable to point to a new object, rather than changing the one it previously referenced.

# a = "string"
# puts a.object_id      # => 320
# a = "another string"
# puts a.object_id      # => 340

# This can cause copies to be created if we pass objects into methods that contain reassignment statements.

# def reassignment_method(object)
#   copy = object.upcase
#   copy
# end
#
# a = 'string'
#
# puts reassignment_method(a) # => 'STRING', which is a copy of the original 'string'
# puts a                      # => 'string', the original unmodified object

# Assignment operators such as +=, -=, *=, etc. can also cause this link between variable and object to be broken.

# def adds_an_s(string)
#   string += 's'
#   string
# end
#
# a = 'variable'
# b = adds_an_s(a)
#
# puts "The object referenced by `a` is '#{a}' located at #{a.object_id}"
# puts "The object referenced by `b` is '#{b}' located at #{b.object_id}"
#
# # => "The object referenced by `a` is 'variable' located at 360"
# # => "The object referenced by `b` is 'variables' located at 380"

# It is still possible for the variable being reassigned to reference the same object,
# but only if that same object is returned by the expression to the right of the assignment operator.
# The connection between variable and the object it references is still broken by assignment,
# but because what is being re-assigned is the same object,
# the connection between the two is reformed by the assignment operation itself.
#
# # breaks the connection between the variable and the object it references, assigning a new object
#
# a = 'hello'
# a.object_id           # => 400
# a = a.capitalize      # => 'Hello' (returns a new string)
# a.object_id           # => 420
#
# # breaks the connection between the variable and object it references
# # reassigns the same object back to variable `a`
#
# a = 'hello'
# a.object_id           # => 440
# a = a.capitalize!     # => 'Hello' (returns `self` the same object modified)
# a.object_id           # => 440
#
# Mutating Methods
# If a method modifies one of its arguments during execution, it is said to be mutating with respect to its arguments.
# This is less common than a method which is mutating with respect to its caller,
# which occurs when a method permanently modifies the calling object.

# Many mutating methods use ! at the end of their names to signify this side-effect.
# There are some methods, however, that do not have this indicator, such as Array#push and String#concat.
# If you write any mutating methods in your own code, it's a good idea to include the ! in their name.

# Indexed Assignment
# Indexed assignment is mutating even though it appears to resemble regular assignment operations,
# which are non-mutating.
# Indexed assignment occurs when a single element in a collection (such as a String, Array, or Hash) is re-assigned.
# Because the new object created in reassignment is only a copy of a single element,
# the reference for the collection as a whole remains the same.
# In this case, we consider the collection as a whole to have been mutated.

# def indexed_assignment(collection)
#   collection[1] = 0
#   collection
# end


# a = [1, 2, 3]
# a.each { |element| puts element.object_id }
# # => 3
# # => 5
# # => 7
#
# b = indexed_assignment(a)
# p a
# # => [1, 0 3]
# p a.object_id
# # => 480
# p b
# # => [1, 0, 3]
# p b.object_id
# # => 480
# a.each { |element| puts element.object_id }
# # => 3
# # => 1      (note that this object id has changed)
# # => 7

# Concatenation
# The shovel concatenation operator << used with collections such as strings and arrays may function similarly to +=,
# however it is mutating, whereas reassignment operations are not.

# # concatenation is mutating
# a = 'abc'
# puts a.object_id    # => 500
# a << 'def'
# puts a              # => 'abcdef'
# puts a.object_id    # => 500

# # reassignment is not
# b = 'abc'
# puts b.object_id    # => 520
# b += 'def'
# puts b              # => 'abcdef'
# puts b.object_id    # => 540

# Object Passing
# What is Object Passing?
# Object passing is the way in which different programming languages pass objects into methods.
# Most of the time, passed objects are either treated as "references" or "pointers" to the actual object in memory,
# or as "values", which are considered to be copies of the original object in memory.

# Pass by reference: variables act as pointers, and contain "references" to the actual object.
# 'Object' is a string literal object
# a = 'Object' we assign the string literal to the variable a
# a now contains a reference to 'Object', which can be revealed by calling the method object_id
# When we pass a into a method, the reference to that original object in memory is passed in
# This can be demonstrated via a mutating method, which affects the original object

# def change_object(string)
#   string.upcase!
# end

# a = 'Object'
# puts a                  # => 'Object'
# change_object(a)
# puts a                  # => 'OBJECT'

# Pass by value: when objects are passed to a method, only a copy of the original object (or value)
# will be passed to the method.
# This means that any manipulations performed on the object within the method will have no effect on the original object.

# Ruby is not pass by value, but sometimes it can act like it is, when a copy is generated within a method and reassigned to the variable in question.
# This breaks the link between the variable and the object it references
# Below we can see that a copy is made when we pass a into the method (because of variable reassignment).
# The original object referenced by a, therefore, is not modified by the method

# def change_object(string)
#   string += "!"
# end
#
# a = "Value"
# puts a                      # => "Value"
# puts change_object(a)       # => "Value!"
# puts a                      # => "Value"

# What happens in Ruby?
# In the case of immutable objects, or when dealing with a non-mutating method,
# Ruby acts like a pass by value language.
# In the case of mutating methods, it acts like a pass by reference language. So what's really going on here?

# In reality, Ruby is a pass by reference language,
# but it passes a copy of that reference when passing Objects into methods. This is known as pass by reference value.

# The key here is the fact that variables act as pointers.
# i.e., they contain a reference to the associated object in memory.
# Just because we pass this reference into a method doesn't necessarily mean that the object will automatically be mutated.
# Non-muting operations, such as reassignment, can change the pointer
# by causing the variable to point to a different object in memory.
# Immutable objects, such as integers, cannot be modified.
# In these cases, a new object is generated and the variable in question then references that object after the operation is concluded.

# Whether any particular method acts as pass by reference or acts as pass by value (i.e. whether it is mutating or non-mutating)
# depends on how it is defined.
# Does the method contain mutating methods within that modify its arguments or caller destructively?
# Or does it use methods that return a new object so that those references passed into it remain unchanged?