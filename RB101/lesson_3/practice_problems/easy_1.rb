# 1. What would you expect the code below to print out?

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers
p numbers
puts numbers.inspect

# numbers.uniq returned a new Array object with unique elements,
# but it did not modify the numbers object. The puts method,
# in addition to calling to_s on its argument, writes each element on a new line
# if passed an array. That is why the output appears as shown above.

# Additional note: had the last line been p numbers instead, the output would
# have been [1, 2, 2, 3] because the p method automatically calls inspect on its
# argument, which gives a different formatting on the output. Furthermore,
# we could have also done puts numbers.inspect and the output would have been
# the same as using the p method.

# 2. Describe the difference between ! and ? in Ruby.
# And explain what would happen in the following scenarios:

# what is != and where should you use it?
# put ! before something, like !user_name
# put ! after something, like words.uniq!
# put ? before something
# put ? after something
# put !! before something, like !!user_name

# Just to clarify, if you see ! or ? at the end of the method,
# it's actually part of the method name, and not Ruby syntax.
# Therefore, you really don't know what the method is doing, even if it
# ends in those characters -- it depends on the method implementation.
# The other uses are actual Ruby syntax:

# != means "not equals"
# ? : is the ternary operator for if...else
# !!<some object> is used to turn any object into their boolean equivalent.
# (Try it in irb)
# !<some object> is used to turn any object into the opposite of their
# boolean equivalent, just like the above, but opposite.

# 3. Replace the word "important" with "urgent" in this string:

advice = 'Few things in life are as important as house training your pet dinosaur.'
advice.gsub!('important', 'urgent')
p advice

# 4. The Ruby Array class has several methods for removing items from the array.
# Two of them have very similar names. Let's see how they differ:
# what is the returned value of he call?
# how does the numbers variable change?

numbers = [1, 2, 3, 4, 5]

# numbers.delete_at(1)
# p numbers
# (note that the array is operated on directly and the return value of the call is the removed item 2)

numbers.delete(1)
# (note that the array is operated on directly and the return value of the call is the removed item 1)

p numbers

# Another thing to notice is that while both of these methods operate on the
# contents of the referenced array and modify it in place
# (rather than just returning a modified version of the array) these methods
# do NOT have the usual ! at the end of the method name for "modify in place" method names.

# 5. Programmatically determine if 42 lies between 10 and 100.

# hint: Use Ruby's range object in your solution.

range = 1..100
num = 42
puts range.include?(num)
# also
puts range.cover?(num)

# or shorter
(10..100).cover?(42)

# note: when not numeric the 2 numbers may differ

puts ('a'..'d').cover?('cc')
puts ('a'..'d').include?('cc')

# 6. Starting with the string below...
# show two different ways to put the expected "Four score and " in front of it.
famous_words = 'seven years ago...'

# famous_words = "Four score and " + famous_words
# famous_words.prepend('Four score and ')

# also:
'Four score and ' << famous_words
p famous_words
# the return value is "Four score and seven years ago"
# but it is printing only the second part

# 7.  Un-nest this array
flintstones = %w[Fred Wilma]
flintstones << %w[Barney Betty]
flintstones << %w[BamBam Pebbles]

flintstones.flatten!
p flintstones

# 8. Given the hash below
# Turn this into an array containing only two elements: Barney's name and Barney's number

flintstones = { 'Fred' => 0, 'Wilma' => 1, 'Barney' => 2, 'Betty' => 3, 'BamBam' => 4, 'Pebbles' => 5 }
barney = flintstones.assoc('Barney')
p barney
