# // ###################################################
# // What does the following code return? What does it output? Why? What concept does it demonstrate?
# // def change_name(name)
# //   name = 'bob'
# // end

# // name = 'jim'
# // change_name(name)
# // puts name


# // ######################################################
# // What does the following code return? What does it output? Why? What concept does it demonstrate?
# // a = %w(a b c)
# // a[1] = '-'
# // p a



# // ########################################################
# // What does the following code return? What does it output? Why? What concept does it   demonstrate?
# // def add_name(arr, name)
# //   arr = arr + [name]
# // end

# // names = ['bob', 'kim']
# // add_name(names, 'jim')
# // puts names



# // ###########################################################
# // What does the following code return? What does it output? Why? What concept does it   demonstrate?
# // array = [1, 2, 3, 4, 5]

# // array.select do |num|
# //    puts num if num.odd?
# // end

# // ###########################################################
# // What does the following code return? What does it output? Why? What concept does it demonstrate?
# // arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# // new_array = arr.select do |n|
# //   n + 1
# //   puts n
# // end
# // p new_array

# // #############################################################

# // What does the following code return? What does it output? Why? What concept does it demonstrate?
# // a = "hello"

# // [1, 2, 3].map { |num| a }

# // ###############################################################
# // What does the following code return? What does it output? Why? What concept does it demonstrate?
# // def test
# //   puts "written assessment"
# // end

# // var = test

# // if var
# //   puts "written assessment"
# // else
# //   puts "interview"
# // end

# // #####################################################
# // What does the following code return? What does it output? Why? What concept does it demonstrate?
# // def fix(value)
# //  value[1] = 'x'
# //  value
# // end

# // s = 'abc'
# // t = fix(s)

# // What values do `s` and `t` have? Why?

################################################################################

# What does the following code return? What does it output? Why? What concept does it demonstrate?
#
# def change_name(name)
#   name = 'bob'
# end
#
# name = 'jim'
# change_name(name)
# puts name
#
# This code demonstrates the concept of reassignment and variable scoping rules in Ruby.
#
# On line 7 we declare a locally scoped variable referencing String object 'jim'.
# On line 8 we call the change_name method, which is defined on lines 3-5.
# When we invoke the method, we pass it as an argument the object that the variable 'name' is poiting to.
# So on line 2 both, method scoped variable `name` and locally scoped variable `name` point to the same object in memory.
# However, in the body of the method, on line 3 we change where the method scoped variable `name` is pointing to, now it is pointing to another String object,
# 'jim'. So this method returns 'jim'. But what happened in the method did not change the value of the locally scoped variable so `name` stays same and
# the code on line 9 will output 'jim' and return `nil`.
#
# 3

################################################################################
# What does the following code return? What does it output? Why? What concept does
# it demonstrate?
#
# a = %w(a b c)
# a[1] = '-'
# p a
#
# On the line 1 we initialize an array of 3 String object elements, using synctactical sugar expression %w().
# On line 2, we use Array[]= method to replace the element at index position 1 with a new string value `-`.
# This is a mutating operation that mutates the array.
# It does not mutate the element at index `1`, because that element gets replaced/reassigned.
# The last line will output ['a', '-' 'c'] and return ['a', '-' 'c'].
#
# This code example represents the concept of mutation.
#
# Another example for this:
#
# second_element = 'b'
#
# a = ['a', second_element, 'c']
# a[1] = '-'
# p a  # ['a', '-', 'c']
# p second_element # 'b'
#
#
# The []= method is mutating so the 'b' String object changes to '-',
# and the last line will output ['a', '-' 'c'] and return ['a', '-' 'c'].
#
# This code represents the concept of mutation.
#
# 2

########################################################
# What does the following code return? What does it output? Why? What concept does it demonstrate?
#
# def add_name(arr, name)
#   arr = arr + [name]
# end
#
# names = ['bob', 'kim']
# add_name(names, 'jim')
# puts names
#
# On line 4 we initialize a names variable referencing an Array object with 2 elements.
# On line 5 we invoke the add_name method and pass it the names array and the String object 'jim' as arguments.
# Within the method body we reassign the method scoped `arr` variable to point to
# result of concatening the array object that the `arr` originally referenced and
# the array object that contains the value that the name variable points to,
# namely 'jim'.
# So what the method returns is ['bob', 'kim', jim], but what happened in the method
# does not change the locally scoped variable `names` and when we pass it to the puts method
# as an argument on the last line, it prints ['bob', 'kim'] and returns nil.
#
# This code demonstrates the concept of reassignment, variables as pointers and `add_name` as a non-mutating method.
#
# 2
###########################################################
# What does the following code return? What does it output? Why? What concept does it demonstrate?
# array = [1, 2, 3, 4, 5]
#
# array.select do |num|
#    puts num if num.odd? # 1, 3, 5, the return value of the block is `nil`
#                         # 2, 4 for which odd returns false, the return value of the block is `nil`
# end
#
# On line 1 we initialize an array object with 5 elements.
# On line 2 we call select method on this object. The select method takes a block, delimited by the words do...end.
# The block takes a block parameter, num in this case. When the select method is invoked, each element of the array will
# be passed in turn to the block and the block will decide whether to output that element or not. The decision is based on the return value of
# `odd?` method called on each element of the array. This return value is then passed to the conditional and if the condition evaluates to true, the puts method
# is invoked and the value is output. This will happen in case of elements at index position 0, 2 and 4 so these integers will be output.
# Select returns a new array with elements selected according to the thruthiness of the return value of the block. The return value of the block
# is nil for every element of the array (because the puts method always returns nil) so this code will print 1, 3, 5 on separate lines and return an empty array.
#
# This code demonstrates the concept of selection and truthiness/falsiness.
#
# 3

###########################################################
# What does the following code return? What does it output? Why? What concept does it demonstrate?
# arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
#
# new_array = arr.select do |n|
#   n + 1
#   puts n
# end
# p new_array
#
# On line 1 we initialize an array Object with 10 Integer elements.
# On line 3 we initialize a new_array variable and point it to the return value of the select method
# called on the array initiliazed on line 1. The select method takes a block delimited by the words do...end.
# The block takes a parameter n and within the block body 1 is added to n, however we do not save the return value of
# this expression into any variable.
# So when n is being output on a subsequent line, it will otput on separete lines all the elements of the array from 1 to 10.
# When we print the new_array variable on `line 7`, it will ouput an empty array, because select chooses elements based on the truthiness of the block's
# return value, if the return value of the block is truthy, then element is selected. The return value of the block is
# its last line and here it is a call to the puts method, where n is passed as an argument. Puts always return nil and nil is falsy/nil evaulates to false
# in Ruby so none of the elemnts will be selected and the last line will produce an empty array.
#
# This code demonstrates the concept of truthiness.
#
# 2

################################################################################

# What does the following code return? What does it output? Why? What concept does it demonstrate?
# a = "hello"
#
# [1, 2, 3].map { |num| a }
#
# This code demonstrates the concept of transformation.
#
# Map is called on an array of 3 elements, a block is passed to map and within the block, a block variable num
# is defined. Map is a non-mutating method, it returns a new array, with its elements transformed according to the retun value of the block.
# Each time the block is called, it will take a subsequent element of the array and transform it into a.
# So this code will not output anything but it will return an array of 3 strings ['hello', 'hello', 'hello'].
#
# 1
################################################################################
# What does the following code return? What does it output? Why? What concept does it demonstrate?
#
# def test
#   puts "written assessment"
# end
#
# var = test
#
# if var
#   puts "written assessment"
# else
#   puts "interview"
# end
#
# p test.object_id
# p var.object_id
#
# This code demonstrates the concept of variables as pointers and also truthiness/falsiness.
#
# On line 4 we point the var variable to the same place in memory as the RETURN VALUE of the test method invocation is pointing to.
# Subsequently we are using a conditional statement and saying if the variable var is pointing to a truthy object/evaluates to true, then a string
# 'written assessment' will be printed, else the string 'interview' will be printed.
# Since the return value of the test method is nil(because a return value of the method is its last line if there is no explicit return and the last line
# of this method contains a call to puts, which always returns nil) and nil is falsy/evaluates to false in ruby,
# this code will output the string 'interview' and return nil.

# 2
#####################################################
# What does the following code return? What does it output? Why? What concept does it demonstrate?
# What values do `s` and `t` have? Why?
# def fix(value)
#  value[1] = 'x'
#  value
# #  puts 'Bob is fat' # `nil`
# end
#
# s = 'abc'
# t = fix(s)
#
#
# This code demonstrates the concept of mutation.
#
# On line 6 we initialize a locally scoped variable `s` referencing a String object 'abc'
# On line 7 we pass the object that the variable points to as an argument to the fix method.
# Within the body of the method we use the String []= method in order to change the value of
# the second character of the string. the []= is mutating so it will change the object in place.
# So the last line of this code initialized a variable t pointing to the return value of the fix method.
# The return value of this method is the last evaluated expression, which is 'axc'.
# However this method is mutating, so the value of s will also be changed and now it points to 'axc'.
#
# 3

# Ewa   18/24 => 75% ~=> 90 %

#########################################################################
#
# Examine the code example below. The last line outputs the String 'Hi'
# rather than the String 'Hello'. Explain what is happening here and identify
# the underlying principle that this demonstrates.
#
# greeting = 'Hello'
#
# loop do
#   greeting = 'Hi'
#   break
# end
#
# puts greeting
#
# *** remember to write in paragraphs
#
# The local variable greeting is assigned to the String 'Hello' on line 1.
# The do..end alongside the loop method invocation on lines 3 to 6 defines a block,
# within which greeting is reassigned to the String Hi on line 4.
# The puts method is called on line 8 with the variable greeting passed to it
# as an argument; since greeting is now assigned to 'Hi', this is what is output.
#
# This example demonstrates local variable scoping rules in Ruby;
# specifically the fact that a local variable initialized outside of a block is
# accessible inside the block.
#
# def a_method
#   puts "hello world"
# end
#
# The method invocation outputs the string hello world, and returns nil.
#
# greeting = 'Hello'
#
# Most of the Launch School material describes this statement as:
#
# The greeting variable is assigned to the string 'Hello'.
#
# or:
#
# The string 'Hello' is assigned to the greeting variable.
# Choose one of these 2 above and be consistent.
#
# In Ruby, false and nil are FALSEY or we can say: EVALUATE AS FALSE
# everything else is TRUTHY or EVALUATES AS TRUE in a boolean context
#
# This is different to being TRUE or FALSE
#
# a = "Hello"
#
# if a
#   puts "Hello is truthy"
# else
#   puts "Hello is falsey"
# end
#
#  * a evaluates as true/evaluates to true in the conditional statement and so 'Hello is truthy' is output
#  -- would be a correct answer
#
#  * a is truthy and so 'Hello is truthy' is output
#  -- would also be correct a correct answer
