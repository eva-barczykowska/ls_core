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
# # a = ‘hello world’
# # puts a # ‘hello world’
# # a.object_id # => 260 #?
# #
# # a.upcase!
# # puts a # ‘HELLO WORLD’
# # a.object_id # => 260 #?
# #
# # a.upcase
# # puts a # ‘HELLO WORLD’
# # a.object_id # => 260 #?
# #
# # b = a.upcase #
# # puts a # ‘HELLO WORLD’
# # puts b # ‘HELLO WORLD’
# # a.object_id # => 260
# # b.object_id # => 280 #?
#
# 2. What does this code output and why?
# def strange_method
#   if 2 > 3
#     'strange method'
#   end
# end
#
# puts strange_method

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
# fix it by changing the outer scope variable `course` to `best_course for example` and the interpolated variable as well

# --- sixth session ---
# 1. What does this line of code return and why?
# 1.frozen?
# Returns true because 1 is an integer and therefore an immutable object
#
# 2. What does the last line of code return and why?
# array = ["apple", "book", "car", "dog"]
# array.freeze
# array[0] << 'sss'
# p array
# Outputs ["applessss", "book", "car", "dog"] because the individual elements of the array are not frozen and can therefore be mutated.
#
# 3. What does this code return and why?]
# array = ["apple", "book", "car", "dog"]
# array.freeze
# array << "ear"
# array[0] = 'ant'
# Frozen error because frozen array cannot be modified by mutating methods such as `<<` or `Array[]=`

# --- sixth session ---
# 1. What concept is represented here?
# p "jenny" || 1
#
# 2. What does this code output? How to fix this? What concept is represented here?
# a = 5
# course = "RB101"
# a.times do |course|
#   puts "#{course} is a great foundation!"
# end
# fixing: change the name of the outer scope variable or use

# 3. What does the code below return?
# # Why does it work?
# a = 'hello'
# a.concat('!').upcase
#
# # --- seventh session ---
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
# 2. We were expecting last line of this code to output a string "SHAWN made a very good choice!".
# Why doesn't it? How to fix it?
def congratulate_student(name)
  name = name.upcase
  name << " made a very good choice!"
end

student = "Shawn"
congratulate_student(student)

puts student

# 3. What will this code output? What concepts are demonstrated here?

a = 6
b = 14.times do |a|
  a = 4
  puts a
end

puts a
puts b

