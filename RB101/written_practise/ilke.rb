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

# 2. What does this code print or return? What concepts are represented here?
def my_method(param)
 param += " planet"
 param + " universe"
 param << " word"
end

str = "hola"
my_method(str)

p str

# 3.
# What do the last 3 lines print and why?
def merge(array_1, array_2)
  array_1 | array_2
end

arr1, arr2 = ['hello'], ['hello', 'world']
merged = merge(arr1, arr2)
merged[0][0] = "J"
p merged
p arr1
p arr2

# --- fourth ---
# 2. Examine the following code.  Using the lines 3, 7, 11, 16, and 17 to explain what concept is demonstrated.

# a = ‘hello world’
# puts a # ‘hello world’
# a.object_id # => 260 #?
#
# a.upcase!
# puts a # ‘HELLO WORLD’
# a.object_id # => 260 #?
#
# a.upcase
# puts a # ‘HELLO WORLD’
# a.object_id # => 260 #?
#
# b = a.upcase #
# puts a # ‘HELLO WORLD’
# puts b # ‘HELLO WORLD’
# a.object_id # => 260
# b.object_id # => 280 #?

