# ---compare if all the concepts that the exam has are covered here --- ADD EXAMPLES OF EACH HERE --- !!!

# VARIABLE SHADOWING
# As a result of the block parameter having the same name as the variable initialized in the outer scope, that outer
# scope variable will be inaccessible within the block, and attempts to access it will instead access the block parameter.
#
# A situation can occur in which a variable with the same name is initialized within the block - in the inner/block scope
# and outside of the block, in the outer scope.
# The program will not crash because of this but we may get unexpected results.
# Ruby parser while executing code in the block is looking for the variable with a certain name
# and when it finds it in the form of the block variable, it looks no further.
# Giving the block parameter the same name as the outer scope variable is considered something to be avoided
# because it can lead to unexpected results.
school = "UCLA"
p school
2.times do |school|
  school = "Launch School"
end

p school

# LOCAL VARIABLE SCOPING RULES
# The concept represented here is variable scope, specifically the fact that
# a block's inner scope has access to variables initialized in outer scope but not vice versa.
fruits = ["tangerine", "pear", "melon"]
fruits.each do |fruit|
  fruit << "s"
  vegetable = "carrot"
end
p fruits
#p vegetable #undefined local variable or method `vegetable' for main:Object (NameError)

# PASS BY REFERENCE
# Ruby acts like pass-by-reference with mutable objects like strings.
# When this object is passed to a method, the method can (but doesn't have to) mutate it.
# If an object passed to a method gets mutated, then the method acts like pass-by-reference with respect
# to that argument.

item = "pant"
p item

def pluralize(item)
  item << "s"
end

pluralize(item)
p item

# VARIABLES AS POINTERS
# Variables themselves don't contain objects, they point to objects in memory. Where a variable is pointing can be
# also changed so the variable points to some other object in memory. Whether it's the same of different object can be
# checked by calling the object_id on the object that the variable is referencing.
# This variable can either be reassigned to a new location, by variable reassignment, or the information in the memory
# location can be mutated by a mutating method or operation.
big_city_a = "NY"
big_city_b = big_city_a

p big_city_a
p big_city_b

big_city_b = "Johannesburg"

p big_city_a
p big_city_b

# PASS BY VALUE
# If an object passed to a method doesn't get mutated, then the method acts like pass-by-value with that argument.
# Ruby acts like pass-by-value with immutable objects like numbers.
# Operations in the method do not affect the original object.
# It is not possible for a method to mutate an immutable object. We can only reassign it.

age = 10
p age

def double(age)
  age * 2
end

double(age)
p age

# SHORT-CIRCUIT EVALUATION
# for the || operator, only 1 of the operands have to be true so when Ruby evaluated `age`, it doesn't evaluate
# further because the expression will be true anyway, same with the && if one of the operands is false
age = 10
kid = true
p age || kid

# same with the && if one of the operands is false:
adult = false
has_money = true

if adult && has_money
  puts "Allowed to buy cigarettes"
else
  puts "Not allowed to buy cigarettes"
end

# OPERATOR PRECEDENCE
p 2 > 1 || == 1

# What is call stack in Ruby?

# --CALL STACK-- is the order in which Ruby executes METHODS

# Whenever you call a method, Ruby places a --STACK FRAME-- on the call stack.
# This means that Ruby allocates memory for this method.
# It holds the method's arguments, space for internal variables, and the return address of the caller.

# It gives you an insight in which order methods are executed. For example, if one method has a call to another method
# within its body, that another method has to return, for the first method to be able to return.
# So the first method is put on the call stack and then the one that is inside it is put on the call stack because
# that has to return first.

def divide(number, divisor)
  number / divisor
end

puts divide(10, 2)


# divide
# puts
# main

# The stack at the moment of calling the / method would be
# concepts.rb in