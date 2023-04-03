# Checklist for grading:

# Checklist:
# 1. Are ALL questions answered?
# 2. Is every answer given with precision? Is it correct? Is it accurate? Is it understandable?
# 3. Are backticks used for variable or method names to make it easier to read?
# 4. Are paragraphs used?
# 5. Is spelling/grammar/syntax correct? Is it clear?
# 6. Is my answer coherent? Is the flow nice? Do I repeat myself?

# 1.
# def scream(words)
#   words = words + "!!!!"
#   return
#   puts words
# end
#
# scream("Yippeee")
# The `scream method` is invoked on line 9 with a string literal `"Yipee"` as an argument.
# This method is defined on lines 2-6 with 1 parameter `words`.
# When the method is called both `words` and '"Yipee' are aliases, they point to the same object.
# However, within the body of the method, on line 3 `+` method is called on `words`. `+` is a non-destructive method and it concatenates `words` and `"!!!`.
# Subsequently the word return is used to return from the method, nothing below that word is evaluated and so line 5 will not be evaluated at all.
# Nothing gets printed when this method is invoked on line 9.
# Also, nothing is passed to return (???) so nil will be returned from the method.
# This code represents the concept of reassignment and concatenation (line 3) as well as returning from the method.


# # 2.
# animal = "dog"
#
# loop do |_|
#   animal = "cat"
#   var = "ball"
#   break
# end

# puts animal
# puts var

# When the Kernel#puts method is invoked on line 28, `"cat"` will be printed because the block has access to the variable
# `animal` initialized in the outer scope and so can reassign it to point to another variable.
# When we invoke puts and pass `var` as an argument, Ruby will throw an `undefined local variable or method var` error
# because `var` is initialized within the block and blocks have their own inner scope. This variable is accessible within
# the block but it is not accessible outside, in the main scope, when we try to output it.
# The concept demonstrated here
# is local variable scoping rules, namely that inner/block scope has access to outer/main scope but not vice versa.


# 3.
# def color_valid(color)
#   color == "blue" || color == "green"
# end
#
# what_color = "green"
#
# p color_valid(what_color)

# When we call the Kernel#p method on line 47, `true` will be printed because the boolean value is implicitly returned from the method
# defined on lines 41-43. Inside the body of the method we use the `||` operator, which returns true if any of the expressions,
# either the expression on the left or the expression on the right of this return true.
# The value of the argument passed to the method is
# `"green"` and so the right side of the `logical or` operator returns true and, because this line is the last line
# in the `color_valid` method, `true` will be implicitly returned frm the method.
# When we pass this method to `p` on line 47, `true` is what will get printed.
#
# This code represents implicit return from the method, namely that result of the last evaluated expression
# is returned from the method if the keyword `return` is not used.
# We can also say that this code represents the use of logical operators(???).

# -- second session ---
#  1. What is the output and return value of the following code snippet? What concept does it demonstrate?
#
num = 47.times do |num|
  num = 56
end

puts num

# The return value is 47 because Integer#times method returns its caller, which in this case is integer 47.
# Call to puts method on line 3 returns 47, because this is the return value of the times method called on 47.
# Even through within the block passed to the times method we seem to assign `num` to 56, this does not matter because
# `times` method returns its caller anyway.
#
# This snippet represents the concept of method return value and variable assignment.
#
#  2. What does the following code output and what concept does it demonstrate?

arr = [1, 2, 3, 4]
counter = 0
sum = 0

loop do
  sum += arr[counter]
  counter += 1
  break if counter == arr.size
end

puts "Your total is #{sum}"

# This code outputs 10 and returns nil. (what is returns was not asked though)
# The concept demonstrated here is variable reassignment on line 5 where we reassign `sum` to `sum` plus the subsequent
# element of the array. `+=` is actually what is called syntactical sugar and stands for `sum = sum + array[counter]`.
# We could also say that another concept demonstrated here is iteration, because we use the `loop` method and counter
# to iterate over the elements of the array.
# It could be also said that the concept demonstrated here is string interpolation because we use #{} syntax to evaluate
# and print in our string the value of `sum` converted to its string equivalent.

# # 3. What is `arr`? Why? What concept does it demonstrate?

a = [1, 3]
b = [2]
arr = [a, b]
arr[1] = 5
arr

# `arr` is [[1, 3], 5] and this is because on line 4 we reassigned the element at index 1 of arr, which,
# after line 3 is [[1, 3], [2]], to point to integer 5 instead of integer 2, which it was pointing to before this reassignment.
# Syntax []= means index reassignment, and it is a destructive action, meaning it mutates the caller.
# We can easily check that the caller was mutated by calling .object_id on arr on line 3 and 5, the resulting numbers will be same.

# So the concept demonstrated here is mutation. The original array from line 3 has been mutated by indexed assignment.
#
# # 4. Bonus question: What does the following code output? Describe what is happening.
#
a = ""

a += "test"
a += "test"
a += "test"

puts a

# On line 1 we initialize a variable `a` to reference an empty string.
# Next, on lines 3, 4, and 5 we are reassigning the variable to the return value of concatenating the value that
# `a` is currently referencing and the string literal `test`.
#
# alternative:
# The String#+ is invoked on `a` and passed the String literal "test" as an argument.
# `a` is then reassigned to the return value of this method call.
#
# Because we've done this 3 times, when we call Kernel#puts method on the last line and pass a to it as an argument
# what will be returned is `nil` as puts always returns nil but what will be output is the string `testtesttest`

# From our discussion of string element reference, I modified this snippet to explore the concept further.
# What does the following code output? Why?
# What would happen if `capitalize` was changed to `capitalize!`? Why?

puts "first"
def name_jumble(string)
  string[0] = string[1].capitalize
end

name = 'Evan'
puts "name object_id before - SAME before and after(mutation"
p name.object_id
puts "name[1].object_id before"
p name[1].object_id
name_jumble(name)
puts "name object_id after - SAME before and after(mutation)"
p name.object_id
puts "name[1].object_id after, it's different coz string[1].capitalize returned a new string"
p name[1].object_id
puts "result:"
puts name

# Last line of this code outputs the string`"Vvan"` and returns `nil` because puts always returns nil.
# The value that `name` was originally pointing to on line 5, has been subjected to the destructive String[]= method on line 6.
# What happens there is that first we are retrieving the second character of the string using the `String[]` method,
# which returns a new string and then on this new string we use a non-destructive String#capitalize method.
# which returns "V". So a new string, `"V"` is assigned to the first character of the string argument using the aforementioned
# mutating String[]= method.

# We use non-destructive version of `capitalize` on the new string that the String[] method returned,
# so the second character of the original string argument is not mutated. Even if we used the destructive version
# of that method, capitalize!, the second character of the original string argument would still not be mutated because
# this method is called on the new string that the String[] method returned.
#
# The concept demonstrated here is mutation. We can see this by calling name.object_id before invoking 1name_jumble1
# method on the string object that `name` is referencing. Object ids will be same, which means that this is the same object,
# albeit mutated.

# We can also say that another concept demonstrated here is reassignment. We retrieve the second element of the
# argument string by the `String#[]` method and then point it to the return value of the `capitalize` method.
# So before invoking the `jumble_name` method the character at index 1 was pointing to another object in memory.
# We can see this by calling the object_id method on name[1] before invoking `jumble_method` on the object that `name`
# is referencing and after. Both object_ids will differ, which means that `string[1]` returned a new object`.


puts "the second example"
def name_jumble(string)
  string[0] = string[1].capitalize!
end

name = 'Evan'
puts "name object_id before - SAME before and after(mutation)"
p name.object_id
puts "name[1].object_id before"
p name[1].object_id
name_jumble(name)
puts "name object_id after - SAME before and after(mutation)"
p name.object_id
puts "name[1].object_id after, WHY IS IT DIFFERENT? HAS IT NOT BEEN MUTATED BY capitalize!  ???"
"*** It is because String[] returns a new string!!! ***"
p name[1].object_id
puts "result:"
puts name

# see description above
# 1. What does the last line of this code output and why? What does it return? What concept is illustrated here?
def all_zero
  0
end

puts 'true' if all_zero

# 2. What does the following code return and why? What concept is represented here?
['a', 'b', 'c', nil, 'd'].select do |letter|
  letter
end

# 3. What do the last 2 lines of this code output and why? What is the concept represented here?
def display_message(message = 'hi')
  puts message
end

display_message
display_message('goodbye')

#1. What does the following code output? Why? What concept does it demonstrate?

s = 'Hello World'
puts s[0]
puts s[2]
puts s[-1]
puts s[2, 3]
puts s[2, 3][2]

# LINE 2 outputs the string object `"H"`, because parts of strings (single characters) can be extracted from
# a string object using the String#[] method. This method, if passed a single index, returns a new string with
# a character at that index, the integer used here signifies index of the character and we start
# counting INDICES from `0`, so the first character/ the character at index `0` will be returned.
#
# THIRD line outputs the String object `"l"`, because, since we start counting INDICES from 0, `s[2]`
# will extract the character at index `2`/will extract 3rd character from this string.
#
# FOURTH line outputs the String object `"d"` because while extracting string characters, we can use also
# negative indices starting from `s[-1]`, which stands for the last character of the string.
#
# FIFTH line outputs the String object `"llo"` because `String#[]` method is also actually alias for the `String#slice`
# method which takes 2 integer arguments, first for the index from which we want to extract characters and second
# for the number of characters we want to extract.
#
# Last line calls the `String#[]` method on the return value of the previous line, which is `"llo"` and again,
# counting characters from 0, this way we can extract the 3rd character, which is the string `"o"`.

# THE CHARACTER AT INDEX `2`. - USE THIS
# The concept represented here is String element reference.

# Very important difference between String element reference and Array element reference:
#
"abc"[0].object_id == "abc"[0].object_id #=> false !!!
a[0].object_id == a[0].object_id #=> true !!!

# String element reference always returns a different object_id.
# Array element reference always returns the same object_id if the same number index is repeatedly
# referenced.

# When we call the String#[] method on str, it always returns a new String
# When we call it on the array, it returns the element at this index.

#2. What does the following code output? Why? What concept does it demonstrate?

arr = %w(a b c d e f g)
puts arr[0]
puts arr[1]
puts arr [-1]
puts arr[2, 3]
puts arr[2, 3][2]

# This code demonstrates Array element reference. We use the `Array#[]` method, which returns the element at index or
# returns a subarray, when 2 numbers are used inside the `[]` brackets, first number stands for the index we want
# to start extracting from, 2nd number stands for the numbers of characters we want to retrieve.

# On line 2, the `#puts` method is invoked and passed the return value of calling the `String#[]` method on an array `arr`.

# The concept demonstrated here is array element reference.

# We can access any element of the array using integer-based index, starting from `0` for the first element of the array
# or `-1` when counting backwards from the last element of the array.

# SECOND line will output array element at index `0`/ first element of the array, the String object `"a"`.

# THIRD line will output array element at index `1`, second element of the array, the String object `"b"`.

# FOURTH line will output last element of the array, the String object `"g"`.

# Penultimate line will RETURN A NEW ARRAY, `["e", "f", "g"]` and output strings `"e", "f", "g"` on separate lines.
# This is because Array has the Array#[]
# method which, apart from taking single integers for extracting element at the given index, also can take 2 integers as
# an argument, first will stand for the first element of the array to be retrieved and the second will signify the
# number of elements that are to be retrieved after this first element. This means that 3 elements of the array will be
# retrieved, starting from element at the index 2.
#
# Last LINE IS THE SAME AS THE PREVIOUS LINE BUT WITH AN ADDITION OF ANOTHER METHOD CALL, ARRAY#[] method on the return value `["e", "f", "g"]`. THIS ADDITIONAL METHOD CALL returns a new STRING, `"g"`. This is in turned passed to the puts method as an argument. So `"g"` will be output.
# by the last line of this code.

#3. What does the following code output? Why? What concept does it demonstrate?

array = ['a', 'b', 'c', 'd', 'e']

array.each do |letter|
  letter.upcase!
end

p array

# This code will output `["A", "B", "C", "D", "E"] `.
#
# The concept demonstrated here is mutation. We invoke a destructive method, String#upcase!, on each element
# while iterating through the calling Array object.
# The #each method, passes each element of the array to the block. where
# String#upcase! method is invoked on each element and because it is a mutating method,
# it will permanently change each element of this array.
#
# If we used #upcase, which is non-mutating, the caller array would remain unchanged.

# Ilke's answers
# # 1. What does the last line of this code output and why? What does it return? What concept is illustrated here?
# # def all_zero
# #   0
# # end
#
# # puts 'true' if all_zero
#
# =begin
# The last line of this code outputs the string object `true`, and returns `nil`.
#
# The reason for this is as follows:
# On lines 1-3 a method, named `all_zero`, is defined with no parameters. Within
# the body of the method, on line 2, integer object `0` is implicitly returned from this method.
#
# On line 5, the `Kernel#puts` method is invoked and passed the expression
# `'true' if all_zero'. This is a one-line `if` statement, that outputs string object `'true'`
# if the return value of the `all_zero` method evaluates as `true`.
#
# Since the `all_zero` returns the integer `0`, and every expression in Ruby evaluates as true/ is "truthy"
# except for `nil` and `false`,
# the if statement evaluates to `true` and the string `"true"` is printed.
#
# This code demonstrates the concept of truthiness as well as that of the return
# value of a method being the last evaluated expression.".
# =end

# =begin
# The last line of this code outputs the string `"true"` because the `if statement` evaluates as `true`.
# The `if statement` is passed the `all_zero` method, whose value
# evaluates as true, and so the string `"true"` is printed.
# The concept that is represented here is the concept of truthiness. Every expression in Ruby, except false and nil,
# evaluate as true/are considered truthy in flow control.
#
# Furthermore the last line returns `nil` because puts always returns nil.
# =end

# 2. What does the following code return and why? What concept is represented here?
# ['a', 'b', 'c', nil, 'd'].select do |letter|
#   letter
# end
#
# =begin
# This code returns the array object `['a', 'b', 'c', 'd']`.
#
# The reason for this is that the `Array#select` method is invoked on the array
# ['a', 'b', 'c', nil, 'd'] and passed a `do..end` block as an argument. On each iteration
# `#select` passes an element from the array to the block an assigns it to block parameter `letter`.
# Within the block, `letter`, as an expression, is evaluated. Since `#select` considers the
# return value of the block, specifically its truthiness, and returns a new array with the elements
# that evaluate to `true`, /with the elements for which the return value of the block evaluates as true/is truthy
# -- the return value of `#select` is the array `['a', 'b', 'c', 'd']`.
# Notice that it is not identical to the original array, but that the element `nil` has been excluded.
# This is because `nil` evaluates to `false` or is "falsey".
#
# The concept demonstrated here is that of selection and that the `#select` method
# considers the truthiness of the block's return value.
# We can also way that another concept represented here is that of ITERATION. Select iterates over the elements
# of the calling array.
# =end
#
# 3. What do the last 2 lines of this code output and why? What is the concept represented here?
# def display_message(message = 'hi')
#   puts message
# end
#
# display_message
# display_message('goodbye')
#
# =begin
# On line 1-3 method `display_message` is defined with one default parameter `message = 'hi'`.
#
# Within the method body, the `Kernel#puts` method is invoked and passed `message` as an argument.
#
# On line 5, `display_message` is invoked and passed no arguments. This outputs `"hi"` to the screen.
# On line 6, `display_message` is invoked again and passed string object `"goodbye"` as an argument.
# This outputs `"goodbye"` to the screen.
#
# The concept demonstrated here is that of default method parameters: when no arguments
# are passed in upon method invocation, the value that the default method parameter
# is assigned to is passed in as an argument.
# =end

#snippet from Maranda
a = 6
b = 14.times do |a|
  a = 4
	puts a
  end
puts a
puts b

# The concepts illustrated here are variable reassignment, variable shadowing, variable scope and return value of the method.
# On line 1 a local variable `a` is initialized to reference an Integer object 6.
#
# On line 2, another local variable, `b` is initialized and made reference the return value of calling the #times
# method on the integer `14`. The #times method takes a block, denoted by the words `do..end` and the block parameter,
# `|a|`. This method will pass all integers from 1 to 14 to the block and within the body of the block `a`
# seems to be reassigned 14 times to point to an integer `6`, at least (I think) this is the intention.
#
# What happens, however,
# is that the name of the block variable is also `a` and when Ruby parser goes through the code, it looks
# for the variable `a` in order to reassign it, and when it finds it in the form of the block variable and stops looking further,
# outside the block, in the other scope where the main scoped `a` resides.
# Normally the variable `a` could be reassigned from within the block but because of the concept
# described above, called `variable shadowing`, it can't.
# If we wanted to reassign `a` to point to another object, we should have used another block variable name.
#
# What happens next is that since the inner/block scoped variable `a` is pointing to `6`, `6` is passed to the
# Kernel#puts method as an argument and this method invocation prints number `4` 14 times and returns nil.
#
# The return value of the Integer#times method is its caller and because`b` was made to reference the
# return value of calling the #times method on  `14` `b` points to `14`. When `puts` is invoked and `b`
# is passed in as an argument, `14` is printed and `nil` is returned.
a = 6
b = 14.times do |a|
  a = 4
  puts a
end
puts a
puts b
# maranda's explanation
# The above return value of the method(which method? #times? #puts? which #puts?) is to print 4 to the console 14 times.
#
# The output of line 6 is 6 and the output of line 7 is 14.
# The return value of both is nil.
#
# The output of line 7 is due to the local variable `b` being initialized and assigned to the return value
# of the times method called on the integer 101(---???---) with a block passed as an argument.
#
# The times method when called with a block returns self.
# It is this return value of 14 that is assigned to b.   Due to our block variable being the same name as our
# outer scoped local variable this concept shows variable shadowing,
# when the block parameter name is the same name as our outer local variable,
# the inner scoped local variable will use the block parameter and we will be blocked
# from using the outer scoped local variable.  This also keeps us from making any changes to the outer scope local variable.
#
# On line 6, we call the puts method and pass in the local variable a as an argument.
# On line 7, we call the puts method and pass in the local variable b as an argument.
#
# The puts method prints out with a newline at the end of your message (---which message?---)
# and returns nothing, and so returns nil. (---is nothing same as nil?---)
#
# On line 1, we initialize and assign the local variable a to the integer object 6. ---here there is a lot of repetition---
# On line 2, we initialize and assign the local variable b to the return value of the times method call.
# The times method is called on the integer object 14 with a block passed as an argument.
# The block takes one block variable, also named a.
# Noted that from inside the block, the local variable a references the block variable.
# Due to variable shadowing of 2 variables with the same name, a , but with different scopes,
# the outer variable a is shadowed from inside the block and cannot be accessed.
# On line 3, from inside the block, the local variable a is reassigned to the value 4 as times iterates
# through the block 14 times. This action, again, does not have any effect on the outer scope a.
# On line 4, we puts a as times iterates through the block 14 times.  On Line 5, we end our block with our end keyword. (edited)
puts

#ilke to ewa:
#1. What does the following code output? What does it return? Why?
string = 'Hello
'
puts string[5]
puts string[-6]

# On line 1 a local variable `string` is initialised to point to the String object `"Hello"`.
# On line 2 the `String[]` method is invoked on the object that `string` is pointing to and the return value is passed
# to `Kernel#puts` method.
# `String[]` uses index to retrieve a particular character from the array but if no character is present at a given
# index, it returns `nil`. Indices are counted from 0 and the last character that can be retrieved from this string
# is at index 4. Index 5 will return `nil`, which will be in then passed to `puts` and so NOTHING IS PRINTED and `nil` will be returned from the `puts` method.
#
# The same goes for the last line of code, this is because even though we can use negative indices to retrieve string
# characters, while using negative indices we start counting from the end of the string and again, when we try to
# retrieve the character at index `-6`, we see that it does not exist, and so in this case the `String[]` method returns
# `nil` which is in turn passed to `puts`. Nothing gets printed, `nil` is returned.
#
# The concept represented here is String element reference AND OUT OF BOUND
# INDICES.

#2. What is the value of variable `a`? And variable `b`? Why?
a = "hi there"
b = a
a << ", Bob"
p a

# The value of `a` on the last line is "hi there, Bob" and this is because we mutated the value/the object that both `a` and `b`
# are pointing to. The concept represented here is `mutation` and we could have called the destructive `<<` method
# also on `b` because as a matter of fact both `a` and `b` are pointing to the same object, namely the string
# `"hi there"`

#3. what does the following code output? What does it return? Why?
def bad_math
  if 2 < 3
    'bad math'
  end
end

puts bad_math

# On the last line we are invoking Kernel#puts method and passing in the return value of the `strange_method` as an argument.

# `bad_math` is defined on lines 1-5 and within its body an `if condition` is used. The `if condition` evaluates if
# integer `2` is smaller than integer `3` and this expression evaluates as true in the flow control,
# so the following line is evaluated and, since it is the last statement evaluated in this method, this is ultimately the
# return value from the method.
#
# Then 'bad math' is passed to `puts` on the last line and so the string 'bad math' is output and `nil` is returned
# because `puts` always returns `nil`.

# The concept represented here is the return value of the if statement in a method and the return value of the method
# itself.


#4. What does this code output? Why? MISSING
n = 0
puts 'true' if n = 3
puts n

# The last line outputs integer 3 because of the assignment that happened in the `if condition`.
# Line 2 of this code outputs string object `true` because the condition `n = 3` passed to if
# evaluates as true. As a matter of fact this condition will always evaluate as `true` and so the flow control loses its
# purpose. What was probably meant by the coder was to write the condition `if n == 3`. Then the flow control could have
# 2 possible ways of evaluating: as `true` or as `false`.
#
# ilke to ewa:
# 1. What does the following code return? What does it output? Why? What concept does it demonstrate?

a = %w(a b c)
a[1] = '-'
p a

# This code outputs and returns an Array object `["a", "-", "c"]`. This is because on line 2 an Array element setter method `[]=`
# has been used. This method mutates the caller - the array which was initialized on line 1 to `["a", "b", "c"]`.
#
# The concept represented here is `mutation`. After this code runs, the array object on which the mutative `[]=` method
# was used is still the same object as the object initialized on line 1.
# This can be confirmed by calling the object_id method on `a` before and after calling the `[]=` method. Both numbers will be same.

# Within the array, object at index 1 is reassigned from string `"b"` to string
# `"-"`.

# `array[]=` array element setter
# `array[]` array element getter
#
# puts
#
# 2. What does the following code output? Why?

array = ['blue', 'green']
a, b = array
puts a #blue
puts b #green

a = 'purple'
puts array #blue, green

puts

# Multiple assignment of consecutive elements of the `array` array, `'blue'`, `'green'`, to variables `a` and `b` respectively, does not affect
# the object which `array` references. Neither does the reassignment of `a` to point to another String object, `"purple"`.
# These actions have nothing to do with our array object referenced by `array` on line 1,
# it simply remains unmodified by these actions and last line outputs ['blue', 'green'].

# 3. What does the following code output? Why? What concept does it demonstrate?

i = 0
while i < 1 do
  a = "abcdefg"
  i += 1
end
#the above will execute once
loop do
  b = "abcdefg" # interesting because this should have given us an error but it didn't and this is because `b`
  break         # has been initialized in the previous snippet so this is reassignment!!!
end
# This will also execute once

puts a
puts b

# So to get the error that I'm supposed to get I need to not use `b` but name this variable differently
# (use meaningful variable names)

i = 0
while i < 1 do
  a = "abcdefg"
  i += 1
end
#the above will execute once
loop do
  x = "abcdefg"
end
# This will also execute once

puts a
puts x # will throw an error

# # Both lines 47 and 48 will print the String object `"abcdefg"` and return nil.
# #
# # The concept represented here is local variable scope, specifically that the scope of a variable in Ruby is
# # decided by the location where this variable was created. Sometimes a variable is created in the block scope or
# # method definition scope and then the main scope has no access to this variable. Here it is not the case.
# #
# # In the first part of the code, lines 1-5, `while loop` does not create a separate scope and so the variable initialized
# # inside this loop, `a`, is accessible throughout the program.
# #
# # As far as the second part of the code is concerned, lines 7-10 constitute the `loop` method, which again doesn't
# # create its own inner scope(???)and so the variable initialized within the loop method, `b` is also accessible throughout
# # the program.
# #
# # We can successfully print both variables.