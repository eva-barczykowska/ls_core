
# 1.
snack = 'french fries'
num = 1

num.times do |num|
  puts "I'll love #{snack}, even when I'm #{num * 100}!"
end

# The concept demonstrated here is variable shadowing.
# We can also say that it demonstrates variable scoping rules, specifically that variables have scope.
#
# This code will output "I'll love french fries, even when I'm 0!".
# Because `num` is initialized to 1 on line 0, we might expect its value to be used in the second interpolation, within
# the string passed to the `puts` method on line 5. However, when `times` is called on `num` on line 4 and the block
# that is passed to it, delimited by the keywords do..end, has a block parameter `num` (exactly the same name as a local
# variable in the outer scope on line 2), this prevents the code in the block
# scope from accessing the value of `num` in the other scope, on line 2. `times` method executes a block given
# number of times, in this case 1 time, starting counting from 0. So this block will be executed once and when
# it's executed, it's the block parameter value, 0, that will be used in the second interpolation because when
# ruby interpreter is looking for a value `num`, and when it finds it within the block, in the form of the
# block parameter, it will not look further.


# 2.
array = [2, 4]
array.insert(0, 55)
# elements are shifted to the right
# array is mutated

# An array object is initialized on line 1 and pointed to an array of 2 integers: [2, 4].
# Subsequently, the insert method is called on it with 2 arguments, an integer 0 and and integer 55.
# The insert method can take 2 arguments and the first signifies the index whereas the second signifies the integer
# which is to be inserted. This method is mutating so our original array now looks like this [55, 2, 4].


# 3.
my_var = 3
puts "The variable is #{my_var}"

# First local variable my_var is initialized to point to an integer 3.
# Then the #puts method is used to output a string, within which string interpolation is used. String interpolation
# means that we are going to evaluate the expression used within the #{} and print it as a part of the string.

# When we use #{} inside a double-quoted string, Ruby EVALUATES the content inside the braces and puts the result into
# the string.


# 4.
'hi there 4'.to_f
# What does the invocation of `String#to_f` upon the string object `"hi there 4" return?  Namely, `'hi there 4'.to_f`
# It returns 0.0.


# 5.
# What is the output on line 4? Why? What is the underlying concept?

s = "string"
arr = [s, 1, 2]
arr[0][0] = 'S'
p arr

puts s


# 6.
def hello
  puts 'Hello!'
end


# 7.
if hello
  puts 'Nice to meet you!'
else
  puts 'Fine, be that way.'
end
# What is this `if..else`? Control flow structure. Also: `if..else` conditional statement.
# What does this code print? What concept does this snippet represent?

# Explain why the output on line 11 is "No rain today." every time the code is executed.
# How do we fix the code so that it behaves as expected? What is the underlying concept?

def rain?
  puts [true, false].sample
end

message = if rain?
            "It's raining!"
          else
            "No rain today."
          end

# puts message
# truthiness versus falsiness, i.e. rain? method always returns nil (because the last evaluated statement in the method
# returns nil) and since nil evaluates as false, only the else branch will be always executed.
# To change it, we need to remove puts from the method so that either true or false is returned as opposed to `nil`,
# which always evaluates as false:

def rain?
  [true, false].sample
end

message = if rain?
            "It's raining!"
          else
            "No rain today."
          end



# 8.
a = 'Hello'

def my_method(b)
  b = 'Hi'
end

my_method(a) #within the method, we reassign where a is pointing to
p a # what is output by this line?
# 'Hi' is output from this method
# reassignment is non mutating

# What is the relationship between Array#map and Enumerable#collect?
# They're aliases for each other, both do exactly the same thing.
