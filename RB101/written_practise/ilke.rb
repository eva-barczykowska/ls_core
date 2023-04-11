# 1.You run the following code...

# bootcamps = ['udemy', 'launchschool', 'codetree', 'coursera']
# bootcamps['launchschool'] = 'great'

# and get the following error
# /usr/bin/ruby /Users/ewabarczykowska/ls_core/RB101/written_practise/ilke.rb
# /Users/ewabarczykowska/ls_core/RB101/written_practise/ilke.rb:4:in `[]=': no implicit conversion of String into Integer (TypeError)
# 	from /Users/ewabarczykowska/ls_core/RB101/written_practise/ilke.rb:4:in `<main>'
#
# What is the problem and how can it be fixed?

# 2. You run the following code and it produces an error. What is the problem and how to fix it?
# day_of_the_week = thursday
# puts 'Today is #{day_of_the_week}.'
#
# Answer:
# 1. We are attempting to set the value of an element using a string as the key.
# Arrays are index with integers, not strings. We can change this code to
# bootcamps[1] = 'great'

# 3. What does this code print? What does it return and why? What concept is represented here?
# a = [1, 2, 3]
# a.map { |x| puts x**2 }

# 4. What does this code print? What does it return and why? What concept is represented here?
# def repeater(string)
#   result = ''
#   string.each_char do |char|
#     result << char << char
#   end
#   result
# end
#
# repeater('Hello')

# The  #<< method is invoked on result and passed char as an argument,
# then the #<< method is invoked for a second time on the return value
# of the first #<< invocation and passed char as an argument.
# What is the problem and how can it be fixed?

# --- second session ---
# 1. What does this code print or return? What concept is represented here?
a = "hello"
b = a
=begin
On line 1 variable `a` is initialized and assigned to the string object `"hello"`.
Then on line 2 variable `b` is initialized and assigned to the string object that
variable `a` is referencing.
Therefore the code returns the string `"hello"` and does not output anything.
The concept represented here is that of variables as pointers - variables do
not contain values themselves but point to objects in memory.

=end

# 2. What does this code print or return? What concepts are represented here?
def my_method(param)
 param += " planet"
 param + " universe"
 param << " word"
end

str = "hola"
my_method(str)

p str

=begin
On lines 19-23 the method `my_method` is defined with one parameter named `param`.
On line 25 variable `str` is initialized and assigned to string object `"hola"`.

On line 26 `my_method` is invoked and the object `str` is referencing is passed in
as an argument and assigned to method parameter `param`. `str` and `param` now reference
the same object.

On line 28 the `Kernel#p` method in invoked and passed `str` as an argument.
This outputs `"hola"` to the screen.

The reason for this output, as opposed to a modified string, is because of what happens
within the `my_method` method:

On line 20 the `String#+` method is invoked and passed `" planet"` as an argument, `param` is then
reassigned to the return value of `param + " planet"`.
`param` and `str` now no longer reference the same object, and the rest of the code in the method does
not affect the object `str` is referencing.

This demonstrates the concept that assignment (or reassignment) is NON-mutating, and that variables
are pointers referencing objects in memory.


=end

# 3.
# What do the last 3 lines print and why?
def merge(array_1, array_2)
  array_1 | array_2
end

arr1, arr2 = ['hello'], ['hello', 'world']
merged = merge(arr1, arr2)

puts "object_id of the ARRAY before changes"
p merged.object_id

puts "object id of the first character of the first array element after merge is called, now it's pointing to 'h'"
p merged[0][0].object_id #60

puts "array ---ELEMENT--- object_id before"
p merged[0].object_id

merged[0][0] = "J" # merged[0] returns the first element of the `merged` array, on which then String#[]= is used to mutate the string
puts "object id of the first character of the first array element after merge is called, now it's pointing to 'J'"
p merged[0][0].object_id #60 -- the first element of the array gets mutated coz we've called the destructive []= element on it merged[0] and then on the return value of this we are using []=

# puts "object id of the first character of the first element after merge is called, now it's pointing to 'j'" - these object_ids are different, does it mean we reassigned the string to point somewhere else? But the []= method is mutating
# p merged[0][0].object_id
puts "array ---ELEMENT--- object_id after"
p merged[0].object_id
puts "object_id of the ARRAY after changes"
p merged.object_id #60 and same as before changes, also 60, from which I conclude that this array has been mutated

# We mutated the `merged` array by mutating the first element.
# The first element of the `merged` array is a String object with the value `"hello"`, returned by merged[0]
# On this first element, i.e. on the String object with the value `"hello"`
# we're calling the destructive method []=, which is mutating the string, from `hello` it becomes `Jello.`

p merged
p arr1
p arr2

# The last 3 lines of the array
# The first line prints `merged` array, which is `["hello", "world"]`
# The second line prints `["Jello", "world"]` because previous use of `merged[0]` retrieved the first element of
# this array and subsequent use of destructive method `[]=` mutated this element. It's value from `hello` became `Jello`.
# This mutation however only affected the first element of the `arr1`, which forms part of `merged`.
# The first element of `arr2` does not form part of `merged` array, because it was left out out it by the `|` method,
# invoked on line 2 of this code snippet.
# `|` method does not include duplicate values in its return value. Literal `"hello"` from the `arr2` was a duplicate.

=begin
On lines 56-58 method `merge` is defined with two parameters named `array_1` and `array_2`.
On line 60, using parallel assignment, variables `arr1` and `arr2` are initialized to reference
array objects `['hello']` and `['hello', 'world']` respectively.
On line 61 variable `merged` is initialized and assigned to the return value of invoking `merge`
and passing it `arr1` and `arr2` as arguments. Variables `arr1` and `arr2` and method parameters `array_1` and `array_2`
now reference the same objects.
On line 62, using array and string element reference, the first character of the string at index `0` is changed to `"J"`.
This changed both the first element of the array referenced by `merged` and the first element of the array referenced
by `arr1` because

concepts: scope (methods have their own scope...)
merged[0][0] = "J" - method chaining, merged[0] returns first element of the array, a String, merged[0][0]
arr1, arr2 = ['hello'], ['hello', 'world'] - multiple assignment
=end

# --- fourth session---
# 1. What does the last line of this code output and why? What does it return? What concept is illustrated here?
def all_zero
  0
end

puts 'true' if all_zero

# The last line of this code outputs the string `"true"` because the `if statement` evaluates as `true`.
# The `if statement` is passed the `all_zero` method, whose value
# evaluates to true, and so the string `"true"` is printed.
# The concept that is represented here is the concept of truthiness. All objects in Ruby, except false and nil,
# evaluate as true, are considered truthy.
#
# The last line also returns `nil` because puts always returns nil.

# 2. What does the following code return and why?
['a', 'b', 'c', nil, 'd'].select do |letter|
  letter
end

# This code returns an array of 4 elements, all of them `nil`. This is because the Array#select method is used on
# an array of 5 elements and this method returns a new array. Elements placed in the return value of `select`
# are those, for which the block passed to `select` returned a truthy value. Since all objects, except `false` and `nil`
# evaluate as true, all elements except `nil` will be placed in the new array. `nil` will not be placed in the returned
# array because the block returns false when the `nil` element is passed to it and evaluated.

# The concept demonstrated here is iteration, selection and truthiness.
# The `Array#select` method iterates over the argument array, passed every value to the block parameter and inside the
# block evaluates the value. If the value evaluates as true, the element is selected and added to the array which will
# be returned when all the elements have been iterated over.

# 3. What do the last 2 lines of this code output and why?
def display_message(message = 'hi')
  puts message
end

display_message
display_message('goodbye')

# `display_message` outputs the string `"hi"` because when no arguments are passed to the method when the method is
# invoked, but the method has a default parameter(s) defined, then this default parameter(s) will be used.
#
# The last line of this snippet outputs the string `"goodbye"` because an argument has been passed and there is no
# need for the method to use its default argument.
#
# Both invocations return `nil` because puts always returns nil.

# --- fifth session ---
# 1. Examine the following code.  Using the lines 3, 7, 11, 16, and 17 to explain what concept is demonstrated.
a = "hello world"
puts a
a.object_id #?
p a.object_id

a.upcase!
puts a
a.object_id #?
p a.object_id

a.upcase
puts a
a.object_id #?
p a.object_id

b = a.upcase
puts a
puts b
a.object_id #
b.object_id #

# Line 3 returns 260, this is when the local variable `a` is initialized and made reference String object `"hello world"
# Line 7 otputs the same number as object_id and this is because the destructive String#upcase! method was invoked on the
# object that `a` is referencing. This method mutated the object that `a` is referencing so when we pass it to the
# `Kernel#puts` method, it outputs `"HELLO WORLD"`.
#
# On line 11 the non-destructive method #`upcase`is invoked on the object that `a` is currently referencing,
# which is `"HELLO WORLD"`. This method returns a new object but its returned value is not saved anywhere so the object
# remains unchanged. We can see this by the object_id that is returned, it's same as previous object_id, which means that
# we are still dealing with the same object.
#
# Line 16 will return the same object_id as before because reassigning `a` to the return value of calling the `upcase!`
# method on the object that `a` is referencing does not change the original object that `a` is pointing to. Reassignment
# is non mutating, and we can see this by invoking the `object_id` method on line 11. The object id of `a` does not differ
# to when we previously checked it. This represents the concept of reassignment.
#
# Finally, the last line outputs a different object_id that all the previous lines, because we captured the return value
# of calling the #upcase method on the object that a is currently referencing, `"HELLO WORLD"`.
# Invoking the non-destructive #upcase method returns a new object, and hence its object_id will be different, even though
# its value is the same. This again represents the concept of reassignment.

# ilke
# The concept demonstrated here is that of "variables as pointers" and mutating
# methods.
#
# On line 1, variable `a` is initialized and assigned to string object "hello world".
# On line 3 the `String#object_id` method is called on `a`. This will return an integer.
# Let's use `60` for this example.
#
# On line 5, the mutating `String#upcase!` method is called on `a`, returning the
# value `'HELLO WORLD'`.
#
# On line 7, the `#object_id` method is again called on `a`
# and this will return the same integer as before (`60`), because the method call
# on line 5 returned the calling object.
#
# On line 9, the non-mutating `String#upcase` method is called on `a`. This returns
# a new string, but it is not stored anywhere.
#
# On line 11, `#object_id` method is
# again called on `a` and this will return the same integer as before (`60`).
#
# On line 14, variable `b` is initialized and assigned to the return value of
# calling `#upcase` on `a`. On line 16 `#object_id` method is called on `a`, and
# this returns `60`, and then on line 17 it is called on `b` and returns
# a different object id to that of `a`, for example `80`.

# 2. What does this code output and why?
def strange_method
  if 2 > 3
    'strange method'
  end
end

puts strange_method

=begin
On lines 1-4 the method `strange_method` is defined with no parameters.
Within the method body, on lines 2-4 we have an `if` statement that is evaluating if the condition `2 > 3`
evaluates to `true`. Since `2 > 3` evaluates to `false`, the `if` statement does not execute and returns `nil`.

Since the condition is NOT met the return value of the `if statement` is `nil`.

If condition is met: whatever the return value of the last evaluated expression within the `if` statement is,
this is the return value.

On line 6, the `Kernel#puts` method is invoked and passed the return value of
calling the `strange_method` method.

Because the return value of `strange_method` is `nil` (returned implicitly from the method as `nil` the return value
of the the last evaluated expression in the method), nothing is output to the screen.
=end

# 3. What is the problem here? How to fix it? What is the name of the concept represented?
names = ["maria", "jose", "ilke"]
best_course = "launchschool"
other = "some other bootcamp"

names.each do |name, course|
  if name == "ilke"
    puts "#{name} is enrolled in #{course}"
  else
    puts "#{name} is enrolled in #{other}"
  end
end

# ilke
# The problem here is that on line 7 the variable referenced in the string interpolation is the block parameter `course`.

# On each iteration we are trying to reference the object to which `course is` pointing to.
# However, since the method Array#each was called on an array and passed a `do..end block` with TWO block parameters,
# the second block parameter - namely course - remains unassigned to a value.
# It would seem that Ruby parses the code before running it, notices a block parameter and allocates a space for it.
# Since it is not assigned to a value during the iteration, Ruby assigns it to the value nil.
# That is why when Kernel#p is called on the last line and passed course as an argument, the object nil is outputted
# to the screen. Also, when course is interpolated on line 7, it doesn't appear in the string.

# If we wanted the name of the course to be printed, we could change the name of the interpolated variable to `best_course`,
# since the variable `best_course`, in the outer scope, is available to the inner scope of the block.

# Alternatively we could change the `names` array to a hash containing key and value pairs.
# That way the second block parameter would have a value to be assigned to on each iteration.
# The concepts represented here are string interpolation, variable scope and the correct use of block parameters.
#
# ADDITIONAL INFO
# Remember the definition for each:
# each yields control to the given block once for each element in the caller/receiver array,
# one element at a time, and assigns each element to the block parameter. The second parameter remains assigned to nil.

# --- sixth session ---
# 1. What does this line of code return and why?
1.frozen?
# Returns true because 1 is an integer and therefore an immutable object
#
# 2. What does the last line of code return and why?
array = ["apple", "book", "car", "dog"]
array.freeze
array[0] << 'sss'
p array
# Outputs ["applessss", "book", "car", "dog"] because the individual elements of the array are not frozen and can therefore be mutated.
#
# 3. What does this code return and why?]
array = ["apple", "book", "car", "dog"]
array.freeze
# array << "ear"
# array[0] = 'ant'
# Frozen error because frozen array cannot be modified by mutating methods such as `<<` or `Array[]=`

# 4. Why reassigning number to 7 did not affect a's value?
def some_method(number)
  number = 7
end

a = 5
some_method(a)
puts a

# Coz `number` is scoped at the method definition level. At the moment of invoking the `some_method` method,
# both `number` and `a` are pointing to the same object. They're aliases.
# However, the method scoped variable `number` is reassigned
# to point to another integer, `7`. From this moment on, we are dealing with a different object, the object that number
# has been reassigned to.
# --- sixth session ---
# 1. What concept is represented here?
# p "jenny" || 1
#
# 2. What does this code output? How to fix this? What concept is represented here?
a = 5
course = "RB101"
a.times do |course|
  puts "#{course} is a great foundation!"
end
# fixing: change the name of the outer scope variable or use

# 3. What does the code below return?
# # Why does it work?
# a = 'hello'
# a.concat('!').upcase
#
# --- seventh session ---
# 1. You wanted to print ["bob: some other bootcamp", "eva: launch school"].
# Why didn't you succeed and how to fix it? What concept is represented here?
names = ["bob", "eva"]
launch_school = ": Launch School"
bootcamp = ": some other bootcamp"

names.each do |name|
  if name == "eva"
    name + launch_school
  else
    name + bootcamp
  end
end

p names

# solution:
names = ["bob", "eva"]
launch_school = ": Launch School"
bootcamp = ": some other bootcamp"

names.each do |name|
  if name == "eva"
    name << launch_school
  else
    name << bootcamp
  end
end

p names

# 2. What is the output and return? of this code and why? What concept is represented here?
("42" < "402") ? "Yes, 42 is smaller" : "No, 42 is not smaller!"

# The concept represented is comparison, specifically how strings are compared in Ruby.
#
# Strings are compared character by character. First Ruby parser compares
# the first character from the first string with the first character from the second string.
# If the first character from the first string is less than the first character form the second string,
# the first string is considered smaller than the second. And  "is less" means the character's value
# in the ASCII table is less than that of the other character(the ASCII value is checked by Ruby behind the scenes
# and we can check it ourselves by calling the #ord method on each character).
# In this example firstly `4` will be compared with 4, their value in the ASCII table is equal so Ruby parser will
# proceed to the second character in every string, `2` and `0`respectively. The value of `2` in the ASCII table
# is greater than the value of `0` and so this comparison returns the boolean value `false` for this character and
# for the whole string.
#
# A Ruby idiom an an alternative for the 1if..else` conditional statement, ternary operator has been used here.
# The program first evaluates what is to the left of the `?`.
# If this is a boolean true or this expression evaluates as true, then the code immediately to the right of the `?`
# gets executed. If this is a boolean false or this expression evaluates as false,
# then the code to the right of `:` gets executed.
#
# In this case the result returned by the `<` operator is the boolean `false` and so the string `""No, 42 is not smaller!""`
# gets printed.
#
# We could also say that a wider concept represented here is Flow Control.

# 3. What will this code output? What concepts are demonstrated here?

a = 6
b = 14.times do |a|
  a = 4
  puts a
end

puts a
puts b


# --- eighth session ---
# 1. Indicate all the ways in which we could change this code in order for the last line to output "hi there".
def extend_greeting(greeting)
  greeting + " there"
end

greeting = "hi"
extend_greeting(greeting)

puts greeting

# Select all the ways in which we could change this code in order for the last line to output "hi there".
#
# A. Change greeting + " there" to greeting += " there".
#
# B. Change extend_greeting(greeting) to greeting = extend_greeting(greeting).
#
# C. Remove puts greeting and change extend_greeting(greeting) to puts extend_greeting(greeting)
#
# D. Change greeting + " there" to greeting << " there".
#
# 2. We assign the return value of calling upcase! to `letter`. Why doesn't it change our caller array elements
# permanently?

array = ['a', 'b', 'c', 'd', 'e']

array.each do |letter|
  letter = letter.upcase
end

p array

# 3. This code throws no implicit conversion of String into Array (TypeError). How can we fix it so that program
# doesn't terminate and last line is printed?

# def not_so_tricky_method(an_array_param)
#   an_array_param += "lettuce"
#
#   return an_array_param
# end
#
# my_array = ["tomato"]
# my_array = not_so_tricky_method(my_array)
# puts "My array looks like this now: #{my_array}"

# 4. What does `puts` print and return?

# --- exam ---
# 1. Is `time` getting evaluated here? Why?
opportunity = true
money = true
if opportunity && money || time
  puts "We will do it"
end

# 2. We were expecting last line of this code to output a string "SHAWN made a very good choice!".
# Why doesn't it? How to fix the code so it does output the expected result?

def congratulate_student(name)
  name = name.upcase
  name << " made a very good choice!"
end

student = "Shawn"
congratulate_student(student)

puts student

# 2. This code produces an error, why?
# -2 > "22"

# 3.Can this operation be successful? Why?
# 15 + "15"

# 4. Can you describe how Ruby evaluates this?
# !(15 == 15)

# 5. What is the first stack frame of this code? (the frame Ruby starts with?)
def first
  puts "first method"
end

def second
  first
  puts "second method"
end

second

# 6. What's the return value of each line? What is this concept called?
# a.
nil && 55

# b.
"hey" || 55

# 7. What is the value of adult here?
adult = "smokes" || 18

# 8. What does this line of code return?
a = 5
!!a

# 9. Write a code example for how Ruby acts like pass by value.

# 10. Write a code example for how Ruby acts like pass by reference.
#
# 1.
["brad", "angelina"].to_h {|s| [s.size, s]}
# ---ANSWERS---
# 4.
# First RUby evaluates what's in the parenthesis and then the `!` operator changes it to the opposite.
# In this case the `==` operator returns `true` for the used operands and then the `!` negates `true` so it
# becomes `false`.

# 6. When using the `&&` and `||` logical operators, a concept called `shortcutting` can take place.
# For the first expression to evaluate as true, both operands have to evaluate as true. If the first one evaluates
# as false, which is the case here, Ruby parser does not evaluate the second operand because, since both have to evaluate
# as true, there is no chance that this expression can evaluate as true if the first operand evaluates as false.
# && return the last evaluated value, so code `a` returns `nil`.
# In the example `b` `||` operator is used, also called `logical OR`. This operator requires one of its operands to
# evaluate as true for the whole expression to evaluate as true. If the first operand evaluates as true, which is
# the case here, the whole expression evaluates as true and Ruby doesn't need to check what the second operand
# evaluates to. And since what `||` returns is the last evaluated expression, `"hey"` is returned here.
#
# 8. `!!a` is equivalent to `!(!a)`. `!a` turns the truthy value to a boolean value `true` and the second `!` flips the
# value to its opposite, a boolean value `false`.
#
fruit = ['papaya', 'banana', 'pear', 'apple']

fruit.each do |fruit|
  fruit = fruit.upcase
end

p fruit
# 100%
#
# --- ninth session ---
# 1. Explain how Ruby acts like pass-by-value and provide a code snippet.
# 2. Explain how Ruby acts like pass-by-reference and explain a code snippet.