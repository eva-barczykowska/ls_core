# ---compare if all the concepts that the exam has are covered here --- ADD EXAMPLES OF EACH HERE --- !!!

# VARIABLE SHADOWING
# As a result of the block parameter having the same name as the variable initialized on in the outer scope, that outer
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
# Operations in methods affect objects passed as arguments to those methods.
# If an object passed to a method doesn't get mutated, then the method acts like pass-by-value with that argument.
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
# Operations in the method do not affect the original object.
# If an object gets mutated by a method than we know that the method shows pass-by-reference behaviour with that
# argument.
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
#