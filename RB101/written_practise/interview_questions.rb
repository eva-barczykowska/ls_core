# 1. Explain the concept of Variables and pointers and give a code example
# In Ruby variables themselves do not contain values but rather point to objects in memory.

carrot_price = 35
kale_price = carrot_price

carrot_price = 20

p kale_price
p carrot_price

# 2. Explain the concept of Variable shadowing and give a code example

school = "UCLA"

1.times do |school|
  school = "Launch School"
end

# 3. Explain the concept of Variable scope in relation to methods and give a code example
arg1 = "first"
arg2 = "second"

def my_method(arg1)
  arg1 + arg2
end
# my_method(5, 10)

# 3. Why doesn't this work? What concept is illustrated here?
CONVERSION = 1.6
kilometres = 100

def convert_to_miles(kilometres)
  miles = kilometres * CONVERSION
end

p convert_to_miles(kilometres)
# p miles

# 4. Explain the concept of Variable scope in relation to blocks and give a code example

product = "toothpaste"
1.times do
  product = "dental floss"
  fruit = "papaya"
  p fruit
end

p product
# p fruit

# 5. What control flow techniques do you know in Ruby? Give examples
# -comparison, which returns true or false
# -conditionals if-elsif-else, unless
# -ternary operator
# -case statement

# 7.Explain the difference between loop and for loop

# 8.When do we use ternary expression? Give an example of ternary expression
adult = true

adult ? "Can buy alcohol" : "NOT ALLOWED to buy alcohol"

# another example
rules = nil
adult = 15

adult ? "Can buy booze" : rules = "NOT ALLOWED to buy booze"

# Ternary expression should be used to select between 2 values and NOT 2 actions
# (we shouldn't be printing a value or setting a variable to a new value)

# Ternary operator's result should be assigned to a variable or returned by a method

# 9.When do we use case statement? Give an example(s) of case statements
# CASE STATEMENT a flow control statement that allows us to select one of many possible execution paths,
# based on the value of an expression or variable.

# an alternative to if

language = "bon jour"
case language # example when case takes an argument
when "hola"
  p "Spanish"
when "ciao"
  p "Italian"
when "ahoj"
  p "Czech"
when "namaste"
  p "Hindi"
else
  p "I don't know this language"
end

puts

a = 5
case # doesn't have to take an argument!
when a == 5
  puts "a is 5"
when a == 6
  puts "a is 6"
else
  puts "a is neither 5 or 6"
end

puts

# return value of the case statement can be assigned to a variable
# nice example with range
wrinkle_cream = 99
answer = case wrinkle_cream # evaluates the value of the case
when 99..499
  "does this contain caviar?"
when 50..98
  "still unreasonable price"
when 20..49
  "maybe will consider"
else
  "that's a good price, I'll take 2"
end


# 10.Explain the difference between truthy and true? Give code examples
# In Ruby everything evaluates as true in flow control, except false and nil.
# true is the only instance of the TrueClass and represents a value that is logically true
# false is the only instance of the FalseClass and represents a value that is logically false
# nil is the only instance of the nilClass and represents the absence of value

passport = "has"
if passport
  p "Can definitely go abroad"
end

valid_passport = nil
if valid_passport
  p "Can definitely go abroad"
else
  p "Will NOT go through customs"
end

p true == passport
p nil == false

# 11. What loops and iterators do you know in ruby?
# -the Kernel#loop method
# -the while loop (not implemented as a method)
# -until loop (not implemented as a method)
# -the for loop (not implemented as a method)
#
# iterators: each, map, select, reject

# 11. How do we control a loop? Give code examples
# -use break
# -use the keyword next
# -use for loop that will loop over a limited number of elements by design
# -we can also have an if statement inside the loop
# -we can have a loop inside the loop as well
# do/while loops, not recommended by the creator or Ruby
#
# 12. What is the difference between true and truthy?
# `true` is the only instance of the TrueClass in Ruby and represents a value that is logically true
# in boolean expressions
# every expression in Ruby evaluates as true when used in flow control, except nil and false.
# However, evaluating as truthy, does not mean that an expression is true, these are 2 different things.
# true is also the result of comparison

p 33 < 100
family = "Roseacea"

if family
  p "it's from the rose family!"
end

p family == true

# Given this code, what would be the final values of a and b? Try to work this out without running the code.
# 13.
# a = 2
# b = [5, 8]
# arr = [a, b] # [2, [5,8]]
# p arr


# arr[0] += 2 #reasignment [4, [5,8]]
#
# p arr
# arr[1][0] -= a # [4, [3,8]] #element reference


# p arr
#
# puts a #2
# puts b #[3,8]

# []retrieve an element, non mutating
# []= mutating

# 14.
# Provide 4 examples using 4 different methods to combine the following words "Merry" and "Christmas" with a space separating them. Explain whether the methods are mutating or non mutating. Make sure the code works.

# def mutating(one, two)
#   one << " " << two
# end

# one = "Merry"
# two = " Christmas"
# p mutating(one, two)

# def non_mutating(one, two)
#   one + " " + two
# end

# p non_mutating(one, two)

# def also_non_mutating(one, two)
#   one += two
# end

# p also_non_mutating(one, two)

# def last_mutating(one, two)
#   two = two.chars
#   one.chars.push(two)
# end

# p last_mutating(one, two).join("")
# p "Merry".concat(' ', 'Christmas')
# p "christmas".prepend('Merry', ' ')
# interpolation!

puts
# 15.
# Given an array: arr = [6, 7, 8, 9] provide two non mutating methods that remove the 6 from the array
# and provide two mutating methods that remove the 9 from  the array

# first
arr = [6, 7, 8, 9]

def remove_first_but_do_not_mutate(array)
  array[1..-1]
end

p remove_first_but_do_not_mutate(arr)
p arr

# second
arr = [6, 7, 8, 9]

def second_non_mutating(array)
  array.last(3)
end

p second_non_mutating(arr)
p arr

#third
def third_non_mutating(array)
  array.drop(1)
end

p third_non_mutating(arr)
p arr

puts
# 16. Given an array: arr = [6, 7, 8, 9] provide two mutating methods that remove the 9 from  the array
# first
arr = [6, 7, 8, 9]
def remove_last_and_mutate(array)
  array.pop
  array
end

p remove_last_and_mutate(arr)
p arr

# second
arr = [6, 7, 8, 9]
def remove_last_and_mutate_too(array)
  array.clear << 6 << 7 << 8
end

p remove_last_and_mutate_too(arr)
p arr

puts

# 17.
def say_hi
  puts 'Hello!'
end

greeting = say_hi # return nil, output "Hello!"

if greeting # evaluates as false (because it's pointing to `nil`)
  word = 'Something'
elsif greeting == false
  word = 'Something else'
else
  word = greeting
end

p "Wow" if word

puts

# 19. We are expecting this code to print "still unreasonable inho". Why doesn't it?

any_car = 98
landrover = any_car.next
answer = case landrover # evaluates the value of the case
         when 100..499
           "too expensive, I'm buying a Fiat"
         when 50...99
           "still unreasonable inho"
         when 20..49
           "maybe will consider"
         else
           "any discounts?"
         end

puts answer

puts

any_car = 98
landrover = any_car.next
answer = case landrover # evaluates the value of the case
         when 99..499
           "too expensive, I'm buying a Fiat"
           fiat = 44
           fiat
         when 50..98
           "still unreasonable inho"
         when 20..49
           "maybe will consider"
         else
           "any discounts?"
         end

puts answer

puts

# 18. This a definition to establish if a number is a prime number. Can you explain how it works?
num = 4
# def prime?(num)
#   (2...num).each do |n|
#     return false if num % n == 0
#   end
#   true
# end

# A prime number is a number divisible only by 1 and itself
# An exclusive version range is used. (2..num). So for example is a num is initialized to 4, we will consider
# a range that contains numbers 2 and 3. Then `#each` method is called on those numbers and a testing condition
# is passed to `if` statement. The question that the test asks is "Can the argument number be evenly divided
# by the current block number?"
# 4 % 2 == 0 ?
# 4 % 3 == 0 ?

# So these 2 questions are asked in in the course of asking these questions, if the condition will evaluate to
# true, FALSE will be immediately returned.
#
# If, after asking all the questions, covering all the numbers included in the range, so if the argument number
# is not evenly divisible by any of the numbers from 2 to itself -1, then this means that this very argument nubmer
# is a PRIME NUMBER.

# In which case, the method returns true.

puts
# 19. This method is supposed to return true for the number 3, which is a prime number, but it doesn't. What is the problem?
num = 4
def prime?(num)
  (2..num).each do |n|
    return false if num % n == 0
  end
  true
end


p prime?(3)

# 3 % 2 == 0 ?
# 3 % 3 == 0 ? # at this point it returns false but it shouldn't
#
puts

# 20. How many custom methods can you write to remove the last element of this array and mutate it?
# The method has to return the mutated array.
puts "remove the last element and mutate the calling array, return the mutated array"
arr = [22, 35, 36, 37]

arr = [22, 35, 36, 37]
def remove_and_mutate(array)
  array[0..] = array.slice!(0, 3)
  array
end

p remove_and_mutate(arr)
p arr
# def mutate_array(array)
#   array_copy = array.take(array.length)
#   # (array.clear << [array_copy[0..-2]]).flatten!
#   (array.clear << [array_copy.slice!(0, 3)]).flatten!
#   # array.flatten!
# end
#
# p mutate_array(arr)
# p arr

# def mutate_array(array)
#   array.delete_at(-1)
#   array
# end
#
# p mutate_array(arr)
# p arr

# def remove_and_mutate(array)
#   arr.pop
#   arr
# end
#
# p remove_last_and_mutate(arr)
# p arr

# def remove_and_mutate(array)
#   array_copy = array.take(array.size - 1)
#   array.clear.push(array_copy)
# end
#
# p remove_last_and_mutate(arr)
# p arr

# def remove_and_mutate(array)
#   array.delete(array.last)
#   array
# end
#
# p remove_and_mutate(arr)
# p arr

# def remove_and_mutate(array)
#   array[] = array[0..-2]
#   array
# end
#
# p remove_last_and_mutate(arr)
# p arr

# def remove_and_mutate(array)
#   array.slice!(0..2)
# end
#
# p remove_last_and_mutate(arr)
# p arr                           !!!! last element is left !!!!

puts

# 21. How many custom methods can you write to remove the last element of this array but not mutate the array?
# arr = [6, 7, 8, 9]

# 22. How many custom methods can you write to remove the first element of this array and mutate the array?
# arr = [6, 7, 8, 9]

# 23. How many custom methods can you write to remove the first element of this array but not mutate the array?
# arr = [6, 7, 8, 9]

# def first(array)
#   array[1..-1]
# end

# p first(arr)
# p arr

# def remove_first(array)
#   array - [array[0]]
# end

# p remove_first(arr)
# p arr

# def remove_first(array)
#   array - [array.first]
# end
#
# p remove_first(arr)
# p arr
#
def remove_first(array)
  array = array.take(array.length) # nice!
  array.shift
  array
end

p remove_first(arr)
p arr

arr = [6, 7, 8, 9]

def second(array)
  array.last(3)
end

p second(arr)
p arr

# take(array.size) and then array.shift and return array
# array - [array[0]]
# array[1..-1]
# array - [array.first]
# array.last(3)

# 24.
# animal = "dog"

# loop do |_|
#   animal = "cat"
#   var = "ball"
#   break
# end

# puts animal
# puts var

# Main scope doesn't have access to variables initialized inside the block scope
# but block scope can access variables initialized in the main scope.

# arr1 = ["a", "b", "c"]
# arr2 = arr1.dup #this is a copy!

# arr2.map! do |char|
#   char.upcase
# end

# puts arr1  #["a", "b", "c"]
# puts arr2  #["A", "B", "B"]
#
# What are the 2 simple ways we can add 2 strings together?
# --String concatenation and string interpolation


# 25. What does this method output and why?
def spanish_greeting(greeting, name)
  greeting + " there"
  greeting << name
end

name = "Alfonso"
greeting = "Hola, "

spanish_greeting(greeting, name)

puts greeting

# 26. What will the last line of code output and why?

1.times do |num|
  my_score = "I've scored A+ on the interview!"
end

1.times do |num|
  my_score = "I didn't get A+ but at least I didn't fail!"
end

# puts my_score

# 27. What does this method output and why?
def spanish_greeting(greeting, name)
  greeting + " there"
  greeting << name
end

name = "Alfonso"
greeting = "Hola, "

spanish_greeting(greeting, name)

# puts greeting

# 28. What do the final two lines output and why?

a = 4
b = 2

a.times do |a|
  a = 5
  b = a
end

puts a
puts b

# What does the `puts` call output and why?
# What concept does this example illustrate?

def test(str)
  str  += '!' #'Written Assessment!'
  str.downcase! #'written assessment!'
end

test_str = 'Written Assessment'
test(test_str)

puts test_str

# 29. Our countdown to launch isn't behaving as expected. Why?
# Change the code so that our program successfully counts down from 10 to 1.

def decrease(counter)
  counter -= 1
end

counter = 10

10.times do
  puts counter
  decrease(counter)
end

puts 'LAUNCH!'

puts

# Solution
def decrease(counter)
  counter -= 1
end

counter = 10

10.times do
  puts counter
  counter = decrease(counter) # capture the return value of the method!
end

puts 'LAUNCH!'
# or:
def decrease(counter)
  counter -= 1
end

counter = 10

10.times do
  puts counter
  decrease(counter)
end

while counter >= 0
  puts counter
  counter = decrease(counter)
end
puts 'LAUNCH!'

# we can also get rid of the method
# counter = 10
#
# 10.times do
#   puts counter
#   counter -= 1
#   #decrease(counter)
# end
#
# puts 'LAUNCH!'

puts

# 30
# 1. Come up with as many ways as you can of retrieving elements at index 1 and 2.
arr = [6, 7, 8, 9, 4, 6]
arr = [6, 7, 8, 9, 4, 6, 7]

p arr[1, 2]

p arr[1..2]

p arr.slice(1, 2)
p arr.slice(1..2)


p arr.last(3).slice(0, 2)
p arr.first(3).slice(1, 2)

# get middle elements from an array of even length - next: odd length

def get_middle_elements(array)
  size = array.size / 2
  [array[size - 1], array[size]]
end

p get_middle_elements(arr)

def get_middle_elements(array)
  [array[array.size / 2]]
end

p get_middle_elements(arr)

puts
# 31.List 3 ways to add the element 9 to the following array: [6, 7, 8] and the mutate it

arr = [6, 7, 8]

# def add_and_mutate(array)
#   array << 9
# end

# p add_and_mutate(arr)
# p arr

# arr = [6, 7, 8]

def add_and_mutate_two(array)
  array_copy = array.dup
  array.clear.push(array_copy).push(9).flatten!
end

p add_and_mutate_two(arr)
p arr

arr = [6, 7, 8]

def add_and_mutate(array)
  array.push(9)
end

p add_and_mutate(arr)
p arr

# 32. Come up with as many ways as you can to combine string "Merry " and "Christmas"
a = "Merry "
b = "Christmas"

# def combine(a, b)
#   a + b
# end
#
# p combine(a, b)
# p a
# p b

# def combine(a, b)
#   a += b
# end
#
# p combine(a, b)
# p a
# p b

# def combine(a, b)
#   a.concat(b)
# end
#
# p combine(a, b)
# p a
# p b

# def combine(a, b)
#   a << b
# end
#
# p combine(a, b)
# p a
# p b

# def combine(a, b)
#   b.prepend(a)
# end
#
# p combine(a, b)
# p a
# p b
#
def check_zero_ones(str)
  arr = str.split("")
  chunked = arr.chunk_while { |a, b| a == b }.to_a
  return false if chunked.max_by { |subarray| subarray.size }.include?("0")
  true
end

p check_zero_ones("110") #== true
p check_zero_ones("0011") == false
p check_zero_ones("1") == true
p check_zero_ones("0") == false
p check_zero_ones("110100010") == false
p check_zero_ones("1101") == true
p check_zero_ones("11010111100") == true

def count_sheep
  5.times do |sheep|
    puts sheep
    if sheep >= 2
      return
    end
  end
end

p count_sheep

greetings = { a: 'hi' }
informal_greeting = greetings[:a] #"hi"
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

# What is the result of the last line in the code above and why?
#
# # How can you change the code so that it doesn’t output any error message? Why does your solution work?
#
# # 2.times do
# #   a = 'hi'
# #   puts a
# # end
#
# # loop do
# #   puts a
# #   break
# # end
#
# # puts a
#
# number = 4
#
# 2.times do |number|
#   puts number
# end
#
# a = 'hi'
#
# loop do
#   b = 'hey'
#   greetings = []
#
#   loop do
#     c = 'hello'
#
#     loop do
#       d = 'sup'
#       a = b #"hey"
#       b = c # "hello"
#       c = d #"sup"
#
#       greetings = [a, b, c, d] # error coz
#       break
#     end
#
#     break
#   end
#
#   puts greetings
#   break
# end
#
# #error coz inner block has access to variables defined in the outer block but the outer block does not have access to variables defined in the inner block.
#
# # What is inner and outer depends on the location of the block within the nested blocks.
#
# # nested block/nested block/ nested scope
#
# Come up with as many methods as you can to remove the last element of this array.
# The method returns mutated array.

arr = [ 1, 2, 3, 4 ]

# a.mutating methods

def mutate(ary)
  p ary.object_id
  copy = ary.take(ary.length)
  result = ary.clear << copy[0..2] # rethink this
  result.flatten!
  p result.object_id
end

p mutate(arr)
p arr
# b.non-mutating methods

# delete_at(-1)
# pop
# delete(ary[-1])
# delete(ary.last)
# replace(ary[0..2])
# ary.slice!(-1)
# ary
# (ary.clear << copy[0..2]).flatten!
#
# non_mutating ways
# def non_mutate(ary)
#   ary = ary.dup
#   ary.pop
#   ary
# end

# def non_mutate(ary)
#   ary = ary.map { |el| el }
#   ary.pop
#   ary
# end

# def double(num)
#   num * 2
# end
#
# int = 2
# int = double(int)

# puts int
#
# a = [1, 3]
# b = [2]
# arr = [a, b] #[[1, 3], [2]]
# arr
#
# a[1] = 5 # [[1, 5], [2]]
# p arr # [[1, 5], [2]]
#
# # Local variable scope in relation to methods
#
#
# def method(string)
#   string = "no"
#   var2 = "hi"
#   string.upcase!
# end
#
# v = "hello"
# b = "bye"
#
# p method(v)
# p v
# p var2
#
# On line 12 when method is invoked, the object that v is referencing is passed in
# as an argument and assigned to method parameter string, making string and v aliases, they now point to the same object in memory.