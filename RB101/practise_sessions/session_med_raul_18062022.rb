# Session med raul

# What does the following code return? What does it output? Why? What concept does it demonstrate?
arr = [1, 2, 3, 4]

counter = 0
sum = 0

loop do
  sum += arr[counter]
  counter += 1
  break if counter == arr.size
end

puts "Your total is #{sum}"
#####################################################################################
# What does the following code return? What does it output? Why? What concept does it demonstrate?
animal = "dog"

loop do |_|
  animal = "cat"
  var = "ball"
  break
end

puts animal
puts var

######################################################################################
# What does the following code return? What does it output and return? Why? What concept does it demonstrate?
def example(str)
  i = 3
  loop do
    puts str
    i -= 1
    break if i == 0
  end
end

example('hello')
########################################################################################################
# What does the following code return? What does it output? Why? What concept does it demonstrate?
a = 4
b = 2

2.times do |a|
  a = 5
  puts a
end

puts a
puts b
######################################################################################
# What does the following code return? What does it output? Why? What concept does it demonstrate?
a = 5.2
b = 7.3

a = b

b += 1.1

# What is `a` and `b`? Why?
######################################################################################
# What does the following code return? What does it output? Why? What concept does it demonstrate?
def fix(value)
  value << 'xyz'
  value = value.upcase
  value.concat('!')
end

s = 'hello'
t = fix(s)

# What values do `s` and `t` have? Why?

######################################################################################
# What does the following code return? What does it output? Why? What concept does it demonstrate?

names = ['Ewa', 'Raul', 'Med']

for name in names do
  index = names.index(name)
  puts name
end


puts index
######################################################################################















# Ewa
# What does the following code return? What does it output? Why? What concept does it demonstrate?
arr = [1, 2, 3, 4]

counter = 0
sum = 0

loop do
  sum += arr[counter]
  counter += 1
  break if counter == arr.size
  total_bill = 100
end

# puts "Your total is #{total_bill}"
#
# This code prints out the String "Your total is 10" and returns nil.

## Loop methhod is invoked in order to iterate over the elements of the array initialized on line 122.
# Inside the loop the locally scoped variable `sum` is available and and the Integer#+method
# (with the syntactical sugar equivalent to caller = caller +1) is called on sum.

# Counter is increased each time by 1 and we break out of the loop when we reach its size.

## The last line of the code uses #{} which allows for string interpolation - Ruby will evaluate what's inside
# the brackets and print it as a string. Inside the #{} variables of same or different scope can be printed.

# The last line of the code is a call to Kernel#puts method and this line prints
# "Your total is 10" and returns nil because puts always returns nil.

# This code demonstrates interpolation and local variable scope.

grade = 1
#####################################################################################
# What does the following code return? What does it output? Why? What concept does it demonstrate?
animal = "dog"   # main/global

loop do |_|
  animal = "cat"
  var = "ball"
  break
end

puts animal   # main/global
puts var

# This code will ouput String "cat" return nil and produce an error in turn. The code demonstrates the concept of scope.
#
# On last 2 lines we are calling the Kernels#puts method to output 2 variables.
# The first one, animal is initialized within outer scope and is accessible within a loop where we can change its value
# and then also after the loop, again in the main scope.
#
# The var variable however, has been defined within a loop so in the inner scope, and is not visible in the main scope,
# therefore calling to puts and passing var on the last line produces "Undefined local variable or method error".
#
# grade = 2

######################################################################################
# What does the following code return? What does it output and return? Why? What concept does it demonstrate?
def example(str)
  i = 3
  loop do
    puts str
    i -= 1
    break if i == 0
  end
end

example('hello')



# On line 173 we are invoking the exampe method and passing it a string 'hello' as an argument.
#
# Witin the body of the method we are initializng a method scoped variable
# i to the Integer 3. Subsequentlly we are invoking the loop method and within thhe body of the BLOCK we are outputting
# the string that we passed as an argument and then we descrease the value of i, using
# the Inteter#-method (with syntactical sugar equivalent to caller = calller -1).
# When i is equal to 0 we will break out of the loop method using the keyword break followed by a condition.
#
# This code will output the String 'hello' 3 times and return nil.
# The concept demonstrated here is method definition and variable scoping.
#
# The last expression evaluated is the loop method invocation with the block, which returns nil and so this method returns nil.

grade = 3
########################################################################################################
# What does the following code return? What does it output? Why? What concept does it demonstrate?
a = 4
b = 2

2.times do |a|
  a = 5
  puts a
end

puts a
puts b

# On line 190 we are calling the Integer#times method on Integer 2 and passing it a block defined by keywords do..end.
# Within the body of the block we defined a block scoped variable |a|. Whenever the block is called, we will assign a to 5 and output it.
#
# So this code will output turn 5, 5, 4, 2 and return nil because a call to Kernel#puts method always returns nil.
#
# The concept demonstrated here is variables shadowing and scope. The actions taken within the block have not changed
# the value to where a is pointing to.
#
# grade = 3

######################################################################################
# What does the following code return? What does it output? Why? What concept does it demonstrate?
a = 5.2
b = 7.3

a = b

b += 1.1

# What is `a` and `b`? Why?
a i 7.3
b is 8.3

# we are reassigning var a to the value referenced by the var b, namely the value 7.3.A
# On line 209 we are making `b` to point to the same object in memory as a.
# We can say that a and b at this point are aliases.
# However, on the last line we are reassigning b to point to an entirely different object 8.3 while a is still point
# to the original object 7.3.
#
# This code demonstrates the concept of variables as pointers.
#
# grade = 1.5
######################################################################################
# What does the following code return? What does it output? Why? What concept does it demonstrate?
def fix(value)
  value << 'xyz'
  value = value.upcase
  value.concat('!')
end

s = 'hello'
t = fix(s)

# What values do `s` and `t` have? Why?
# s will have the value of helloxyz while t will have the value of "HELLOXYZ!" as a result of the value returned by the
# fix method invocation
# This code demonstrates the concept of mutation.
#
# When we invoke the fix method and pass it s as an argument, both value and s point to the same value.
# Within the method body the first thing we do is to mutate the value of s by appending xyz to it, using the << method. Then we are reassigning value to point to the return vallue of callling the upcase method on iself. At this point s and value point to different objects in memory and it is no longer possible to futher mutate the value that s is pointing to.
#
# grade = 3
######################################################################################
# What does the following code return? What does it output? Why? What concept does it demonstrate?

names = ['Ewa', 'Raul', 'Med']

for name in names do          # main/global scope
  index = names.index(name)   # main/global scope
  puts name                   # main/global scope
end                           # main/global scope


do..end is not a block here!!!

puts index

# This code will output all elements of the array on separate lines and then Integer 2, it will return nil.
#
# The for loop, which exists but is not very often used in ruby is called on the array and a name parameter is created.
# This parameter serves as a placeholder for each element of the array, whih will be printed.
#
# Within the body of the for loop we also initialize index variable and point it to the return value of calling
# index method on the names array and passing it the for loop parameter name.
#
# for loop is not a method, but reserved word in Ruby
#   concept: iteration

grade = 3


score = 16.5/21 => 79% => 75%
######################################################################################

=begin
# What does the following code return? What does it output? Why? What concept does it demonstrate?
arr = [1, 2, 3, 4]

counter = 0
sum = 0

loop do
  sum += arr[counter]
  counter += 1
  break if counter == arr.size
end

puts "Your total is #{sum}"

In `line 1` we initialize a variable to an `array` object.
We then initialize two variables to `0` in `lines 3 and 4`, `counter` and `sum`
We call the loop method from `lines 6-9` denoted by the keywords `do..end`
Within the loop we reassign `sum` to the value of adding the current value of `sum` + value located at the current index of the array,
specified by `[counter]`.
We add `1` to the counter and loop back until the condition in `line 8` is met, when `counter` equals the value of calling
the `size` method on the array, which breaks the loop.

`Line 14` will output `your total 10` and return `nil`, since the `puts` method always returns `nil`. This snippet demonstrates the concept of reassignment of variables and variable scoping rules in Ruby.

grade = 3
################################################################################################################
# What does the following code return? What does it output? Why? What concept does it demonstrate?

animal = "dog"

loop do |_|
  animal = "cat"
  var = "ball"
  break
end

puts animal
puts var


On `line 1` we initialize a variable to the string object `'dog'` and start a `loop` on `lines 3-7` with an unused parameter.
within the `loop` reassign the main scoped variable `animal` to the string object `'cat'` and initialize a new local variable to
the string object `'ball'` then break the loop.

in `lines 9 and 10` we call the `puts` method on `animal` and `var`.
`line 9` outputs `"cat"` because the variable was reassigned to a new object in memory within the `loop` and returns `nil` because puts
always returns `nil`
`line 10` on the other hand returns an error since `var` is a local variable within the block passed to the `loop` method and cannot be accessed in the main scope.

This code snippet demonstrates the concepts of main and local scopes. variable scoping rules in Ruby/ variable scope

grade = 3
#############################################################################################################
# What does the following code return? What does it output and return? Why? What concept does it demonstrate?
def example(str)
  i = 3
  loop do
    puts str
    i -= 1
    break if i == 0
  end
end

example('hello')

- start by explaining the invocation
- move to the body of the method definition and explain what happens there

From `lines 1-8` we define an `example` method that takes one parameter. Within the method definition we initialize
the locally scoped variable
`i` to the integer `3` and then call the loop method from `lines 3-7` denothed by the keywords `do..end`.
within the loop we call the `puts` method on the argument given to output the string provided. in `line 5` we reassign `i`
to the value of calling the `-` method on `i` with `1` as a parameter, effectively removing `1` from the value of `i` every time it loops.
`line 6` contains a `break` condition to leave the loop whenever the statement `i == 0` evaluates as `true`.

On `line 10` we call the example method and pass it the string `'hello'` as an argument which will output `hello` three times
and return `nil`, because `puts` always returns `nil``.

This snippet demonstrates the concept of locally scoped variables.

grade = 3
########################################################################################################
# What does the following code return? What does it output? Why? What concept does it demonstrate?

a = 4
b = 2

2.times do |a|
  a = 5
  puts a
end

puts a
puts b

In `lines 1 and 2` we initialize two variables, `a` to the integer `4` and `b` to the integer `2`
On `lines 4-7` we call the `times` method on the integer `2` and pass it a block denoted by `do..end` and `a` as a method parameter.
within the the block initialize a new locally scoped variable `a` since we cannot access the main scoped `a` because of variable shadowing.
we then call `puts` to output `5` two times before returning `2` because the `times` method always returns the caller.

a.puts
b.puts

on `line 9 and 10` we call `Kernel#puts` on `a` and `b`. `line 9` still outputs `4` since we were not able to access it within the block passed to the times method
for reassignment, and returns `nil` because `puts` always returns `nil`.
`line 10` outputs `2` and returns `nil` because of `puts`.

This snippet demonstrates the concept of variable shadowing.

grade = 2
######################################################################################
# What does the following code return? What does it output? Why? What concept does it demonstrate?
a = 5.2
b = 7.3

a = b

b += 1.1

# What is `a` and `b`? Why?

On `lines 1 and 2` we initialize two variables. `a` to the float object `5.2` and `b` to the float object `7.3`
On `line 4` we reassign `a` to the value of `b`, now `a` and `b` are pointing to the same object in memory.
on `line 6` we reassign `b` to the value of calling the `+` method on `b` with `1.1` as an argument.

`a` is now equal to `7.3`, the value `b` used to point to.
`b` on the other hand was reassigned to `8.4` and points to a different object in memory.

This snippet demonstrates the concept of `Variables as pointers`.

grade = 3
######################################################################################
# What does the following code return? What does it output? Why? What concept does it demonstrate?
def fix(value)
  value << 'xyz'
  value = value.upcase
  value.concat('!')
end

s = 'hello'
t = fix(s)

What values do `s` and `t` have? Why?

On `lines 7 and 8` we initialize two variables. `s` to the string object `'hello'` and 't' to the return value of calling the `fix`
method and passing it `s` and an argument.

On `lines 1-5` we deine the method `fix` which takes one parameter. In `line 2` within the method we mutate the argument by concatenating
the string 'xyz' to it. On `line 3` we reassign `value` to the return value of calling the `upcase` method on `value`. From this point on
`s` and `value` point to different objects in memory. On `line 4` we mutate `value` by concatenating `!` at the end of the string.

The value of `s` is `helloxyz` because it was mutated on `line 2` by concatenating 'xyz' to it.
The value of `t` is `HELLOXYZ!` because we reassigned its value on `line 3` and mutated it on `line 4`, all of wich didnt affect `s` since
the reassignment made `value` point to a different place in memory than `s`.

This snippet demonstrates the concept of `Variables as pointers` and more specifically `Mutability`.

grade = 3

######################################################################################
# What does the following code return? What does it output? Why? What concept does it demonstrate?

names = ['Ewa', 'Raul', 'Med']   # main/global scope

for name in names do             # main/global scope
  index = names.index(name)      # main/global scope
  puts name                      # main/global scope
end                              # main/global scope


puts index

On `line 1` we initialize the main scoped variable `names` to an array containing three string elements.

We then start a `for loop` on `lines 3-6` with `names` as a method parameter.
within the method we initialize a locally scoped variable `index` to the return value of calling the `index` method on `names` with `name` as
an argument.
We then use `puts` to output the current name.

The loop will iterate through every `name` in the array and output it. `Ewa`, `Raul`, `Med` will be output,
returning `nil` everytime since `puts` is the last evaluated statement.

on `line 9` we call the `puts` method on `index` which will output `2` because that was the last value of `index` in the `for loop` after
iterating through all the names. It will return `nil` since `puts` always returns `nil`.

This snippet demonstrates `main scoped and locally scoped variables`. The `index` variable inside the `for` loop is still accessible in
the main scope because `for` is a `keyword` and not a `method`.

grade = 1.5


score = 18.5/21 = 88% > 50%
####################################################################################
=end

# Given a string that consists of some words (all lowercased) and an assortment of non-alphabetic characters,
# write a method that returns that string with all of the non-alphabetic characters replaced by spaces.
# If one or more non-alphabetic characters occur in a row,
# you should only have one space in the result (the result should never have consecutive spaces).

=begin
Problem
Write a method that given a string with non-alphabetic characters and some words will return the letters normally but
non-alphabetic characters as a space. consecutive non-alphabetic characters will only output one space.
  - explicit requirements
  - implicit requirements
  - questions

Examples/Test Cases
cleanup("---what's my +*& line?") == ' what s my line '

Data Structures
Input: String with words and non-alphabetic characters
Output: String with words and spaces

Algorithm
- Initialize a variable as an array containing every letter of the alphabet
- Initialize a variable within the method to an empty string
- Transform non-alphabetic characters into spaces ignoring consecutive non-alphabetic characters and add them into the empty string
- Add alphabetic characters into the empty string without altering them
- Squeeze spaces so that there aren't any consecutive spaces at a time
- return the new string

Code
=end

def cleanup(string)
  letters = ('a'..'z').to_a + ('A'..'Z').to_a
  new_str = ''

  string.chars do |char|
    if letters.include?(char)
      new_str << char
    else
      new_str << ' '
    end
  end
  new_str.squeeze(' ')
end


p cleanup("---what's my +*& line?") == ' what s my line '
p cleanup("*** Hello#!%World(*&") == ' Hello World '
p cleanup("This##is!@%#$%!#an&!!!!!*^&example") == 'This is an example'
p cleanup("Consecuutiive!!letteeers@!#aree&%^okay") == "Consecuutiive letteeers aree okay"
- [ ]
