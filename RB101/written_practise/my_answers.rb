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
# # 1. What is the output and return value of the following code snippet? What concept does it demonstrate?
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
# # 2. What does the following code output and what concept does it demonstrate?
#
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

# `arr` is [[1, 3], 5] and this is because on line 4 we reassigned the first element of arr, which,
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
# Next, on lines 3, 5, and 5 we are reassigning the variable to point to itself and the string `test`.
# Because we've done this 3 times, when we call Kernel#puts method on the last line and pass a to it as an argument
# what will be returned is `nil` as puts always returns nil but what will be output is the string `testtesttest`

