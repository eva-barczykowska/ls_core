# What does the following code return? What does it output? Why?
# What concept does it demonstrate?

# def example(str)
#   i = 3
#   loop do
#     puts str.upcase!
#     i -= 1
#     break if i == 0
#   end
# end

# a = 'hello'
# b = a.dup

# p example(b)

# Output:
# hello
# hello
# hello

# Return value:
# nil

# concept demonstrated: Pass by reference.

######################################################################

# def greetings(str)
#   puts str
#   puts "Goodbye"
# end

# word = "Hello"

# greetings(word)

# output:
# Hello
# Goodbye

# return value
# nil

# concept demonstarted:  Pass by reference.

###################################################################

# What does the following code return? What does it output? Why?
# What concept does it demonstrate?

# arr = [1, 2, 3, 4]

# counter = 0
# sum = 0

# loop do
#   sum += arr[counter] # sum = sum + arr[counter]
#   counter += 1
#   break if counter == arr.size
# end

# puts "Your total is #{sum}"

#########################################################################

# What does the following code return? What does it output?
# Why? What concept does it demonstrate?

# a = 4
# b = 2

# 2.times do |a|
#   a = 5
#   puts a
# end

# puts a #
# puts b # 2


########################################################################
# What does the following code return? What does it output? Why?
# What concept does it demonstrate?

# animal = "dog"

# loop do |animal|
#   animal = "cat" #block-scoped variable, not accessible outside of the block
#   break
# end

# puts animal #animal v. references the variable defined on line 84

#local variables - method scoped LV, block scoped LV

######################################################################
# What does the following code return? What does it output? Why?
# What concept does it demonstrate?

# a = "hi there"
# b = a
# a << ", Bob"

# puts a # "hi there, Bob"
# puts b # "hi there, Bob"

##################################################################
# What does the following code return? What does it output? Why?
# What concept does it demonstrate?

# def fix(value)
#   value.upcase!
#   value.concat('!')
#   value
# end

# s = 'hello'
# t = fix(s)

# puts s # 'HELLO!'
# puts t # 'HELLO!'


# #concept Pass by reference
# Mutating method
###################################################################
# What does the following code return? What does it output? Why?
# What concept does it demonstrate?

# def fix(value)
#   value = value.upcase # HELLO, at this point value and s no longer point to the same object, whatever will happen to value further on will not affect s.
#   value.concat('!')
# end

# s = 'hello'
# t = fix(s)

# puts s # 'hello!'
# puts t # 'HELLO!'

# concept: Variables as pointers, in particular Pass by reference

################################################################
# What does the following code return? What does it output? Why?
# What concept does it demonstrate?

# def fix(value)
#   value << 'xyz'
#   value.upcase # returns new a string object. However, `value` and `s`` still point to the same string object in memory => helloxyz
#   value.concat('!')
# end

# s = 'hello'
# t = fix(s)

# # Ewa
# puts s # HELLOXYZ!
# puts t # HELLOXYZ!

# # Raul
# puts s # helloxyz!
# puts t # HELLOXYZ!

###############################################################
# Write a method that finds all substrings in a string, no 1 letter words.

## Test Cases

# Problem
# find all substrings in a string

# input: string
# output: output is an ARRAY
# What are we supposed to return when the string is only 1 letter?
# Assumption: nothing, nil
# it should return an empty array

# Algorithm
# -define the result variable
# -define the counter, start from 1
# -loop over the string
# -return all the strings, start with the first letter, slice 2 letters and loop until there is only 1 letter left in the word
# -then stop looping because we do not want 1-letter substrings
# -then start with the 2nd letter, slice 2 lettes and loop and keep slicing until 1 letter is left
# -stop iterating when there is only 1 character left
# -stop returning characters if there is only 1 character left
# -while iterating, all all the substrings that are found into the result variable
# -return the result

def substrings(str)
  result = []
  counter = 2
  index = 0

  loop do
    loop do
      substring = str.slice(index, counter)
      result << substring
      break if str.match(/#{substring}$/)
      counter += 1
      end
      break if index == str.size - 2
      index += 1
      counter = 2
      end
  result
end

p substrings("band") == ['ba', 'ban', 'band', 'an', 'and', 'nd']
p substrings("world") == ['wo', 'wor', 'worl', 'world', 'or', 'orl', 'orld', 'rl', 'rld', 'ld']
p substrings("ppop") == ['pp', 'ppo', 'ppop', 'po', 'pop', 'op']

# Raul
# problem
# write a method that finds all substring in a string, no 1 letter words

# explicit requirements
# - input: string
# - output: array of strings

# examples and test cases
# p substrings("band") == ['ba', 'ban', 'band', 'an', 'and', 'nd']
# p substrings("world") == ['wo', 'wor', 'worl', 'world', 'or', 'orl', 'orld', 'rl', 'rld', 'ld']
# p substrings("ppop") == ['pp', 'ppo', 'ppop', 'po', 'pop', 'op']
# p substrinfs('b') == []

# data structures
# returns an array of strings that are at least 2 letters in length
# no element in the array should be longer than the original string

# algorithm
# define a method "substrings" that takes a string object as a parameter
# create an empty "substrings" array to contain all the substrings
# utilize the split method to split the string into substrings
