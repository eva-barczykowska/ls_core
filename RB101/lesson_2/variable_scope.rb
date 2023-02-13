a = 1         # outer scope variable

loop do       # the block following the invocation of the `loop` method creates an inner scope
  puts a      # => 1
  a = a + 1   # "a" is re-assigned to a new value
  break       # necessary to prevent infinite loop
end

puts a        # => 2  "a" was re-assigned in the inner scope

# This example demonstrates two things.
# 1. Inner scope can access outer scope variables.
# 2. You can change variables from an inner scope and have that change affect the outer scope.
# For example, when we re-assigned the variable in the inner scope with a = a + 1,
# that reassignment was visible in the outer scope.
puts
puts "INNER scope variable cannot be accessed in the OUTER scope"
# Main is the outer scope here and it does not have a b variable.
# Remember: where a variable is initialized determines its scope.
# In the above example, b is initialized in an inner scope.
loop do       # the block following the invocation of the `loop` method creates an inner scope
  b = 1
  break
end
# puts b        # => NameError: undefined local variable or method `b' for main:Object

puts
puts "Peer blocks cannot reference variables initialized in other blocks"
# This means that we could use the same variable name x in the block of code that follows the loop method invocation.
# However, it's not the same variable as in the first block!
puts

2.times do
  x = 'hi'
  puts x     # 'hi' <= this will be printed out twice due to the loop
end

loop do
  # puts x      # => NameError: undefined local variable or method `a' for main:Object
  break
end

# puts x       # => NameError: undefined local variable or method `a' for main:Object

puts
puts "Nested blocks"

a = 1           # first level variable
loop do         # second level
  b = 2
  loop do       # third level
    c = 3
    puts a      # => 1
    puts b      # => 2
    puts c      # => 3
    break
  end
  puts a        # => 1
  puts b        # => 2
  # puts c        # => NameError # c was initialized in the 3rd level, line 52
  break
end
puts a          # => 1
# puts b          # => NameError # b was initialized in the 2nd level, line 50
# puts c          # => NameError # c was initialized in the 3rd level, line 52

puts
puts "Variable shadowing"
# this doesn't cause any problem
[1, 2, 3].each do |n|
  puts n
end

puts

# but this yes
n = 10
[1, 2, 3].each do |n|
  puts n
end

puts
puts "Variable shadowing prevents us from making changes to the outer scoped n"
puts "Choosing long and descriptive variable names is one simple way to ensure that you don't run into any of these weird scoping issues."
n = 10

1.times do |n|
  n = 11
end

puts n          # => 10

puts
puts "Methods in Ruby have their own isolated scopes."
puts "They can't access any variables defined in the outer scope."

item = 1

def print_item(item)
  puts item
  item = 2
end

print_item 5      # prints 5
puts item         # prints 1

puts
# Let's change the name of item on line 3 to verify this:

item = 1

def print_item(foo)
  # puts item
  item = 2
end

print_item 5 # undefined local variable or method `item' for main:Object (NameError)
puts item    # this code never runs
# This code demonstrates that print_item is unable to see the item variable from line 1.

puts
puts "Methods can only access variables that were initialized inside the method"
puts "or that are defined as parameters. (Note: we're only talking about local variables for now)."
puts "You must explicitly pass in any parameters to a method definition!"

puts
puts "A method definition can't access variables defined in another scope"
a = 'hi'

def some_method
  # puts a
end

# invoke the method
some_method     # => NameError: undefined local variable or method `a' for main:Object

puts
puts "A method definition can access objects passed in"
def some_method(a)
  puts a
end

some_method(5)  # => 5
# In the code above, the integer 5 is passed into some_method as an argument,
# assigned to the method parameter, a, and thus made available to the method body as a local variable.
# That's why we can then call puts a from within the method definition.
#
puts
puts "Ruby look up:"
puts "Ruby will first search for the local variable, and if it is not found,"
puts "then Ruby tries to find a method with the given name."
puts "If neither local variable nor method is found, then a NameError message will be thrown."

hello = 'hi'

def hello
  "Saying hello!"
end

puts hello