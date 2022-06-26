
# Ewa
# e following code return? What does it output? Why? What concept does it demonstrate?
def test
  p "written assessment"
end

var = test  #=>

p var

if var
  puts "written assessment"
else
  puts "interview"
end

# This code will output `'written assessment'` and return `nil`.
# The code demonstrates the concept of truthiness, i.e. that everything in Ruby
# except `false` and `nil` is truthy, which is not the same as true.
#
# The `var` variable on `line 6` is pointed to the return value of the test method, namely the string `'written assessment'`, which is truthy.
# An `if` condition is used to check if that return value is truthy, and if yes, which is
# the case, the string `'written assessment'` is printed out.

# grade = 3
###############################################################################################
# What does the following code return? Why? What concept does it demonstrate?

{ a: "ant", b: "bear", c: "cat" }.any? do |key, value|
  value.size > 4
end

# This code will return false because we are using Enumerable#any? method that returns a
# boolean. This method takes a block denoted by words do..end. We are using block parameters `key`, `value`
# and the way that this will work is that when `any?` method is be called, the current `key` and `value` from the hash will be passed
# to the block parameters and the `line 27` will be executed, where we ask if the value associated with the current key is greater than 4.

# This does not evaluate to true for any of the key-value pairs and so the `any?` method returns the boolean value `false`.
#
# The concept demonstrated here is truthiness and falsiness.

# grade = 3
# # #############################################################################################
# # # What does the following code return? Why? What concept does it demonstrate?

[1, 2, 3].all? do |num|
  num > 2
end

# This code will return false because we are using Enumerable#all? method that returns a
# boolean. This method takes a block denoted by keywords do..end. We are using block parameter `num`
# When `all?` method will be invoked, the block is invoked internally for each element of the array
# and each element from the array will be passed to the block parameter and the
# `line 39` will be executed where we and ask if the value of the current number passed as a parameter is greater
# than the Integer 2. This  evaluates to true only for the last element ( Integer 3)
# but for the `all?` method to return true, the block should return a truthy value
# at each block iteration for all elements of the array.
# So the `all?` method returns the boolean value `false`.

# grade = 2
# ############################################################################################
# # What does the following code return? What does it output? Why? What concept does it demonstrate?

words = %w(jump trip laugh run talk)

new_array = words.map do |word|
  word.start_with?("t")
end

p new_array

# This code demonstrates the concept of transformation.

# It will output and return `[false, true, false, false, true]` because map
# transforms the array on which it is invoked based on the retun value of the block.
# The return value of the block is determined by the String#start_with method,
# where `t` is passed as an argument. This method will return true if a String element in the array
# starts with `t` and false if it does not. Accordingly, true or false
# will be placed in the returned new array and saved in the `new_array`variable.

# grade = 3
# # ############################################################################################
# # # What does the following code return? What does it output? Why? What concept does it demonstrate?

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.select do |n|
  n + 1
end
p new_array

# This code represents the concept of selection.
#
# The code will print [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] and return [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].

# This is because we are invoking on the array the Array#select method,
# which selects elements based on the truthiness of the reuturn value of the block and
# places those elements in the new array.
# The block's return value is its last line, here, it is the expression `n + 1`,
# which evaluates true for every element of the array and so all the elements
# of the original array will be selected and placed in the new array returned by
# `select` method.

# We save the return value of invoking the select method on the array in a variable `new_array`.

# grade = 3
############################################################################################
# What does the following code return? What does it output? Why? What concept does it demonstrate?

a = %w(a b c)  #=> ["a", "b", "c"]
a[1] = '-'
p a  # ["a", "-", "c"]

a = %w(a b c)  #=> ["a", "b", "c"]
p a[0].object_id # 60
p a[1].object_id # 80
p a[2].object_id # 100

# a[1] << '-'
# p a  # ["a", "b-", "c"]

p a[0].object_id   # 60
p a[1].object_id   # 80
p a[2].object_id   # 100

# This code represents the concept of mutation, in particular, how index-assigment,
# element-assignement mutates the array.

# The code will print and return ["a", "-", "c"].
# This is because we reassigned the element at the index 1 of the array to point
# to another value, `-`.

# grade = 3
###########################################################################################
# What does the following code return? What does it output? Why? What concept does it demonstrate?
# What values do `s` and `t` have? Why?

def fix(value)
 value[1] = 'x'
 value
end

s = 'abc'
t = fix(s)

s #=>  axc


# This code demonstrates the concept of mutation.
# After we invoke the fix method, the value of s will be mutated as well.

# `s` initally pointed to a String value `abc`, but after we executing this code
# both `s` and`t` point to the String value 'axc'. This is because we made `'t'`
# point to the return value the `fix` method and when we invoke this method and
# pass `s` and an argument, both `value`, which is the `parameter` and `s`, which is
# the argument, point to the same object in memory. However, in the body of the method,
# we reassign the second character of the string to point to another String object,
# namely `x`. This mutates the object in place so now both `s` and `t` point
# to the same String object, 'axc'.

# grade = 3

############################################################################################
# # # What does the following code return? What does it output? Why? What concept does it demonstrate?

a = 4
b = 2

loop do
  c = 3
  b = a # 4
  a = c # 3
  b = a # 3
  break
end

puts a # 3
puts b # 3
# puts c # throws an error

# Calling the Kernel#puts method to output `a` and `b` will ouput 3 when
# the method is invoked and return nil(because the `puts` method always returns nil), while
# trying to ouput `c` will produce an `unknown local variable or method error`
# because `c` is initialized within a block and blocks have their own scope.

# This code demonstrates the concept of variable scope, namely that
# variables initialized outside the block are accessible in the main scope and
# also in the block scope but not vice versa, i.e. variables initialized in the block
# are accessible in the block but not accessible in the main scope.

# grade = 1

# # Score = 21 / 24 => 87.5%  B

################################################################
# #  # Raul
# # =begin
# # # What does the following code return? What does it output? Why? What concept does it demonstrate?

def test
  p "written assessment"
end

var = test

if var
  puts "written assessment"
else
  puts "interview"
end

# On `line 5` we initialize a variable to the return value of calling the `test` method,

# On `line 2` within the body of `test` we invoke the `p` method and pass it
# `written assessment` as an argument, which would both output and return 'written assessment'
# because the `p` method we call within the `test` method will return the return
# value of calling `inspect` on `written assesment` and output it.

# On `line 7-11` we use a conditional `if`statement which will output
# 'written assessment' if `var` is `truthy`, and 'interview' if it isn't.
# It outputs `written assessment` because the value of `var` is `truthy`,
# in Ruby all values except `false` or `nil` are `truthy` values.

# The concept this snippet demonstrates is Truthiness.

# Grade = 3
###############################################################################################
# What does the following code return? Why? What concept does it demonstrate?

{ a: "ant", b: "bear", c: "cat" }.any? do |key, value|
  value.size > 4
end

# On `line 1` call the `any?` method on a `hash` Object containing three `key:value`
# pairs and pass it a block as an argument denoted by the keywords `do..end`.
# We pass it `key` and `value` as block variables.
# On `line 2` we have an expression that returns a boolean value which will either be
# `true` if the condition is true or `false` if it isn't.
# Within the statement we call the `size` method on value and ask if there is `any?` value
# in which the return value of calling `size` on each value is more than `4`.
# There would be no output and the return value for the `any?` method would be `false`.

# This code snippet demonstrates the concept of truthiness.

# Grade = 3
#############################################################################################
# # What does the following code return? Why? What concept does it demonstrate?

[1, 2, 3].all? do |num|
  num > 2
end

# On `line 1` we call the `all?` method on an array containing three integer elements
# and pass it a block denoted by the keywords `do..end`
# with `num` as a block variable. Within the block passed to the method we have
# an expression that will return a boolean value which returns `true` if `num` is greater than `2`.
# If every iteration returned `true` then the `all?` method will return true, otherwise it returns `false`.
# In this case the `all?` method returns `false` since not every value in the array is larger than `2`.
# Nothing will be output.

# This snippet demonstrates the concepts of iteration and truthiness.

# Grade = 3
# # ############################################################################################
# # # What does the following code return? What does it output? Why? What concept does it demonstrate?

words = %w(jump trip laugh run talk)

new_array = words.map do |word|
  word.start_with?("t")
end

p new_array

# On `line 1` we initialize a variable `words` to an array containing five string elements.
# On `line 3-5` we initialize a variable `new_array` to the return value of calling
# the map method on the array `words` is pointing to
# and passing it a block denoted by `do..end` keywords,with `word` as a block scoped variable.
# Within the block we call the `start_with?` method with `"t"` as an argument on `word`
# at every iteration, which will return `true` for `trip` and `talk` and `false`
# for the rest of the elements in the array.
# On `line 7` we invoke the `p` method with `new_array` as an argument which will return and output [false, true, false, false, true].

# This snippet demonstrates the concepts of iteration, more specifically transformation.

# Grade = 3
# # ############################################################################################
# # # What does the following code return? What does it output? Why? What concept does it demonstrate?

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.select do |n|
  n + 1
end
p new_array

# On `line 1` we initialize a variable to an array containing ten Integer objects.
# On `line 3-5` we initialize a variable to the return value of calling the `select`
# method on `arr` and passing it a block denothed by `do..end`
# and `n` as a block scoped variable. Within the block we call the `+` method
# on `n` and pass it `1` as an argument. The `select` method will then select
# every element for which the value of `n + 1` is truthy,
# so it will select every single value and return the new array.
# On `line 6` we call the `p` method and pass it `new_array` as an argument,
# which will both output and return [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# This code snippet demonstrates the concepts of truthiness and selection.
# Grade = 3
############################################################################################
# What does the following code return? What does it output? Why? What concept does it demonstrate?

a = %w(a b c)
a[1] = '-'
p a

# # On `line 1` we initialize a variable `a` to an array containing three string objects.
# # On `line 2` we use indexed reassingment to assign the value `"-"`
# to the location at `index 1` within the array, which will mutate the array
# (but not the value at `index 1`). The value at index 1 is reassigned to point to a different object.
# On `line 3` we call the `p` method and pass it the array pointed to by `a`
# which will both output and return ["a", "-", "c"]

# This code snippet demonstrates the concept of mutation.

# grade = 3

###########################################################################################
# What does the following code return? What does it output? Why? What concept does it demonstrate?

def fix(value)
 value[1] = 'x'
 value
end

s = 'abc'
t = fix(s)

# What values do `s` and `t` have? Why?

# On `line 6` we initialize a variable `s` to the String object `'abc'`
# # On `line 7` we initialize a variable `t` to the return value of calling the
# `fix` method and passing it the value that `s` is pointing to as an argument.

# At this point both `value` and `s` point to the same string `abc` in memory
# Within the method on line 305 we use indexed reassignment to replace the value
# at `index 1` in `abc` to `x`, which would mutate the string, effectively mutating `s`
# because `[]=` is a mutating method and both `s` and `value` are pointing to the same object in memory.
# The value of both `s` and `t` would be `axc` since we mutated `s` within the `fix` method.

# This code snippet demonstrates the concept of mutation.

# Grade = 3
############################################################################################
# What does the following code return? What does it output? Why? What concept does it demonstrate?

a = 4
b = 2

loop do
  c = 3
  b = a #b = 4
  a = c #a = 3
  b = a #a = 3
  break
end

puts a
puts b
# puts c

# # On `lines 1 and 2` we initialize the variable `a` to the integer `4` and `b` to the integer `2`
# On `lines 4-10` we call the loop method and pass it a block denoted by `do..end`
# Within the block we initialize the variable `c` to the integer `3` on `line 5`,
# On `line 6` we reassign `b` to the value `a` points at, in this case `4`.
# On `line 7` we reassign `a` to the value `c` is pointing at, in this case `3`,
# on `line 8` we reasssign `b` to the value `a` is pointing at
# which is `3` and on `line 9` we break from the loop.

# On `lines 12-14` we call the `puts` method three times, passing it `a`, `b` and `c` as an argument.
# `line 12` will output `3` and return `nil`, because  `puts` always returns `nil`
# `line 13` will also output `3` and return `nil`, because  `puts` always returns `nil`
# `Line 14` will give us an error since the variable `c` was initialize within the block passed to the loop method and is not accesible
# within the main scope.

# This code snippet demonstrates the concept of variables as pointers and variable scoping rules,
# specifically that variables defined in the inner scope (here in the loop),
# are not accessible outside of that scope, in the main scope. That is why we get
# the 'unknown local variable or method error'.

# Grade 3

# Score 24 /24 = 100% A+
# # =end

# # 180 minutes = [20, 22, 24] => [9, 8.18, 7.5]


p [1, 2, 3].all? { |num|  'Bob' }

# Grade  Meaning                      Impact to CP        Score Range for Exams
# A+   aced, perfect score              On track               score >= 98
# A    good, minor errors               On track              93 <= score < 98
# A-   some errors, but ok              Maybe on track        90 <= score < 93
# B+   some errors, needs improvement   Maybe on track        88 <= score < 90
# B   many errors, needs improvement    Not on track          83 <= score < 88
# B-  poor effort, needs improvement    Not on track          80 <= score < 83
# C   very poor effort                  Not on trac               score < 80


# Given a string that consists of some words (all lowercased) and an assortment
# of non-alphabetic characters,
# write a method that returns that string with all of the non-alphabetic characters replaced by spaces.
# If one or more non-alphabetic characters occur in a row,
# you should only have one space in the result (the result should never have consecutive spaces).

=begin
Problem
Write a method that given a string with non-alphabetic characters and some words will return the letters normally but
non-alphabetic characters as a space. consecutive non-alphabetic characters will only output one space.

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

def remove_consecutive_spaces(str)
  new_string =  if str.start_with?(' ') && str.end_with?(' ')
                  str.split.uniq.prepend(' ').append(' ').join(' ').delete_prefix(' ').delete_suffix(' ')
                elsif str.start_with?(' ')
                  str.split.prepend(' ').join(' ').delete_prefix(' ')
                elsif str.end_with?(' ')
                  str.split.append(' ').join(' ').delete_suffix(' ')
                else
                  str.split.join(' ')
                end
  new_string
end

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
  remove_consecutive_spaces(new_str)
end


def cleanup(string)
  letters = ('a'..'z').to_a + ('A'..'Z').to_a
  new_str = []

  string.split('').each_with_index do |char, index|
    new_str.push(' ') if (index == 0 && !letters.include?(char))
    if letters.include?(char) #if it is an alphabet letter, we add it to the string
      new_str << char
    else
       last_char = new_str.last #if it is not an alphabet lette, we add a space
       if (letters.include?(last_char)) #if alphabet does not have this last character, like in the case of space
        new_str.push(' ') #we push a space
      else      #else, we skip to the next letter
        next
       end
    end
  end
   new_str.join('')
end

# # [-,-,-, w, h, a, t, ', s, ,m, y, , +, *, &, ,l,i,n,e,?]
# # [' ', w, h, a, t,  , s, , m, y, , l, i, n, e, ,]

p cleanup("---what's my +*& line?") == ' what s my line '
p cleanup("*** Hello#!%World(*&") == ' Hello World '
p cleanup("This##is!@%#$%!#an&!!!!!*^&example") == 'This is an example'
p cleanup("Consecuutiive!!letteeers@!#aree&%^okay") == "Consecuutiive letteeers aree okay"


#####################################################################################################

# A pangram is a sentence that contains every single letter of the alphabet at least once.
# For example, the sentence "The quick brown fox jumps over the lazy dog"
# is a pangram, because it uses the letters A-Z at least once (case is irrelevant).

# Given a string, detect whether or not it is a pangram. Return True if it is,
# False if not. Ignore numbers and punctuation.

#Ewa
# PEDAC
#
# Problem
# -I have a string and need to detect if it is a pangram.
# -A pangram is a sentence that contains every letter of the alphabet, e.g.
# "The quick brown fox jumps over the lazy dog"
# -the method should return true or false
# -numbers and punctuation are ignored
#
# Assumptions/Implicit requirements
# -the alphabet is the English alphabet
#
# Examples
# pangram?("The quick brown fox jumps over the lazy dog") == true
# pangram?("The quick brown fox jumps over the lazy dog 123!") == true
# pangram?("Hello there") == false
# pangram?("Hello there555") == false
#
# Data structures
# input: String
# output: Boolean
#
# Algorithm
# -define letters of the alphabet
# -downcase the input string
# -split the sentence to characters
# -verify if all the letters of the aphabet exist in the array
# -if yes, the method returns true, else it returns false
# Code

def pangram?(sentence)
  alphabet = 'abcdefghijklmnopqrstuvwxyz'.chars
  sentence = sentence.downcase.chars
  counter = 0

  loop do
    char = sentence[counter]
    if alphabet.include?(char)
      alphabet.delete(char)
    end
    counter += 1
    break if counter >= sentence.size
  end

  alphabet.empty?
end

p pangram?("The quick brown fox jumps over the lazy dog.") == true
p pangram?("The quick brown fox jumps over the lazy dog 123!") == true
p pangram?("THE quick brown fox jumps over lazy dog 123!") == true
p pangram?("Hello there") == false
p pangram?("Hello there555") == false
p pangram?("") == false
p pangram?(" ") == false
p pangram?("*()&*") == false

def pangram?(sentence)
  alphabet = 'abcdefghijklmnopqrstuvwxyz'.chars
  sentence = sentence.downcase.chars
  alphabet.all? do |char|
    sentence.include?(char)
  end
end

p pangram?("The quick brown fox jumps over the lazy dog.") == true
p pangram?("The quick brown fox jumps over the lazy dog 123!") == true
p pangram?("THE quick brown fox jumps over lazy dog 123!") == true
p pangram?("Hello there") == false
p pangram?("Hello there555") == false
p pangram?("") == false
p pangram?(" ") == false
p pangram?("*()&*") == false
##############################################################################################

=begin
A pangram is a sentence that contains every single letter of the alphabet at least once. For example, the sentence
"The quick brown fox jumps over the lazy dog" is a pangram, because it uses the letters A-Z at least once (case is irrelevant).

Given a string, detect whether or not it is a pangram. Return True if it is, False if not. Ignore numbers and punctuation.


Problem
Detect wether a given string contains every letter of the alphabet at least once. return true if it does, false if it doesn't

Examples/Test Cases
"The quick brown fox jumps over the lazy dog"  => true
"Nymphs blitz quick vex dwarf jog"             => true
"Hello World"                                  => false

Data Structures
Input: string
Output: boolean value

Algorithm
-define a method `pangram` that takes a string as a parameter.
-initialize an array containing every letter of the alphabet lowercased
-lowercase the input string to only work with lowercased letters
-check if all letters of the alphabet in the array are included in the string.
Code
=end


def pangram?(str)
  alphabet = ('a'..'z').to_a

  letters = str.downcase.chars
  letters.delete_if {|x| !alphabet.include?(x)}

  letters.uniq.sort == alphabet
end

p pangram?("The quick brown fox jumps over the lazy dog.") == true
p pangram?("The quick brown fox jumps over the lazy dog 123!") == true
p pangram?("THE quick brown fox jumps over lazy dog 123!") == true
p pangram?("Hello there") == false
p pangram?("Hello there555") == false
p pangram?("") == false
p pangram?(" ") == false
p pangram?("*()&*") == false
