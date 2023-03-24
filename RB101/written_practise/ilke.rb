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

puts "object_id of the array before changes"
p merged.object_id
puts "object id of the first character of the first array element after merge is called, now it's pointing to 'h'"
p merged[0][0].object_id #60

puts "array element object_id before"
p merged[0].object_id

merged[0][0] = "J" # merged[0] returns the first element of the 'merged' array, on which then String#[]= is used to mutate the string
puts "object id of the first character of the first array element after merge is called, now it's pointing to 'J'"
p merged[0][0].object_id #60 -- the first element of the array gets mutated coz we've called the destructive []= element on it merged[0] and then on the return value of this we are using []=

# puts "object id of the first character of the first element after merge is called, now it's pointing to 'j'" - these object_ids are different, does it mean we reassigned the string to point somewhere else? But the []= method is mutating
# p merged[0][0].object_id
puts "array element object_id after"
p merged[0].object_id
puts "object_id of the array after changes"
p merged.object_id #60 and same as before changes, also 60, from which I conclude that this array has been mutated

# We mutated the `merged` array by mutating the first element.
# The first element of the `merged` array is a String object with the value `"hello"`, returned by merged[0]
# On this first element, i.e. on the String object with the value `"hello"`
# we're calling the destructive method []=, which is mutating the string, from `hello` it becomes `Jello.`

p p merged
p arr1
p arr2
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

