# This is manually incrementing all the integers in an array by 1.

# arr = [1, 2, 3, 4, 5]
# arr[0] += 1
# arr[1] += 1
# arr[2] += 1
# arr[3] += 1
# arr[4] += 1
# arr # => [2, 3, 4, 5, 6]

# Lines 4-8 are almost same. We can avoid writing repetitive code by using LOOPS.

# arr = [1, 2, 3, 4, 5]
# p arr
# counter = 0
#
# loop do
#   arr[counter] += 2
#   # p arr #first it increases arry[0] element... then array[1]...itd.
#   counter += 1
#   break if counter == arr.size
# end
# p arr

# Controlling a loop

# loop do
#   puts "Hello!" #here no control of the loop, it will run infinitely
# end

# loop do
#   puts "Hello"
#   puts "Hello for the second time"
#   break
# end

# loop do
#   number = rand(10)
#   puts "Hello there"
#   if number == 5
#     puts "Exciting..."
#     break
#   end
# end
#
# Although we have an if condtion for break, we still don't know how many times
# the loop will execute because number represents a random number.
#
# We can tell the loop to iterate a specific number of times by using
# a variable that tracks the number of iterations performed.
# Before loop is implemented, let's assign a variable counter that represents the
# the current iteration number

# counter = 0
#
# loop do
#   puts counter
#   puts "Hello"
#   counter += 1
#   break if counter == 5
# end

# Notice that counter is initialized outside the loop. If it was initialized
# inside the loop, it would be each on each iteration reassigned to 0
# and the break condition would never be met.
#
# IF MODIFIER
# Here we shortened if statment by changing it to if modifier.
#
# And if modifier is implemented by appending keyword if and the condition
# to a statement. In this can the statement is break.
# It could be also next.
#
# break if number == 5
#
# This makes code more readible but if there are multiple lines of code within
# the if statment, then we can't use if modifier. (Notice that we removed the line
# puts "Exciting..")

# BREAK PLACEMENT
# The above example, when break is placed on the last line within the loop,
# mimics behaviour of do/while loop.
# With a do/while loop the code within the loop is guaranteed to execute
# at least once.
#
# If we move break to the 1st line within the loop, then it will mimic the
# behaviour of a while loop. The while keyword always precedes a condition.
# If the condition evaluates to true, the loop will execute the code within the
# block. If the condition evaluates to false, the loop will stop.
# This means the code below break may not execute at all, depending on the
# condition.
# In our example, if we move break to the fist line within the loop and change
# the condition to counter == 0, the loop will stop immediately
# and not execute any code after break.

# counter = 0
#
# loop do
#   break if counter == 0
#   puts "Hello, I'm below the counter!" #this doesn't print
#   counter += 1
# end
#
# NEXT keyword
# When next is executed, it tells loop to SKIP THE REST OF THE CURRENT ITERATION
# and begin next one. We can choose to skip current iteration when counter
# represents an odd number by adding an if modifier to next with the condition
# counter.odd?

# counter = 0
#
# loop do
#   counter += 1 #we are moving counter here so that it executes first coz any code after next will be ignored!
#   next if counter.odd?
#   puts counter #this will not be printed when counter is odd
#   break if counter > 5 # I forgot this needs to be changed coz 5 id odd he he
# end
#
# ITERATING OVER COLLECTIONS
# String

alphabet = 'abcdefghijklmnopqrstuvwxyz'
counter = 0

loop do
  break if counter == alphabet.size
  puts alphabet[counter]
  counter += 1
end

# We are using string reference in order to retrieve each letter based on its
# index. Since our counter starts at 0, we can use that.
# We can break out of the loop when the counter equals length of the alphabet
# string.
# To print a specific character in the string, we use the index value
# associated with that specific character.
# alphabet[0] is 'a'
# alphabet[0] is 'b'
# alphabet[0] is 'c', etc.
# Because counter represents the current iteration number, we use its value as
# an index value for each character. This results in every character being printed
# one at a time.

# In the above example, the ordering of counter += 1 and our break modifier
# doesn't matter too much. If we move things around, the worst that can happen
# is we get one extra piece of unneeded output, a blank line. Regardless,
# all letters of the alphabet will be output. But, the ordering could matter,
# depending on various starting conditions.
# There are some edge cases to take into account when looping through
# strings in general.
#
# If our counter somehow surpassed the alphabet.size modifier, then we could
# end up with an infinite loop.
# For instance, if we started with an empty string,
# and then incremented counter, and then checked a condition with the above
# if modifier, that would cause an infinite loop:

# alphabet = ''
# p alphabet.length #0
# counter = 0
#
# loop do
#   counter += 1
#   break if counter == alphabet.size
#   puts alphabet[counter] #alphabet[1] is nil!
# end

# Or if counter started at the size of alphabet.
# Then, we would once again get an infinite loop.

# alphabet = 'abc'
# p alphabet.length #3
# counter = alphabet.size #3
#
# loop do
#   counter += 1 #now counter is 4!
#   break if counter == alphabet.size #will never meet this condition
#   puts alphabet[counter].class #alphabet[1] is nil!
# end

# Using a more general condition in our if modifier may be in order.
# Using something like, break if counter >= alphabet.size, should do the trick.
# This would always guarantee that we break out of the loop regardless of
# whether counter is exactly equal to alphabet.size or not.
puts
# Array
# We iterate in the same way as we did through the string.

colors = ['green', 'blue', 'purple', 'orange']
counter = 0

loop do
  break if counter == colors.size
  puts "I'm the color #{colors[counter]}!"
  counter += 1
end

puts
# Another example

objects = ['hello', :key, 10, []]
counter = 0

loop do
  break if counter == objects.size
  puts objects[counter].class
  counter += 1
end
puts
# Hash
# Using loop to iterate over a hash requires more steps.
# It's because hash uses key-value pairs instead of zero-based index.
# This means that each value in a hash is associated with a specific key.
# Simple counter variable won't allow us to fetch the values we want
# because hash keys can be any type of object.
# In order to fix this, we need to create an array containing all the keys.
# We can then use the new array of keys, pets, to iterate over the hash.

number_of_pets = {
  'dogs' => 2,
  'cats' => 4,
  'fish' => 1
}
pets = number_of_pets.keys # => ['dogs', 'cats', 'fish']
counter = 0

loop do
  break if counter == number_of_pets.size
  current_pet = pets[counter]
  current_pet_number = number_of_pets[current_pet] # so number_of_pets['dogs'], etc.
  puts "I have #{current_pet_number} #{current_pet}!"
  counter += 1
end

# This is a 2-step process. First, we're iterating over the array of keys, pets,
# and saving each key(dogs, cats, fish) into the current pet variable.
# Subsequently, we use the current_pet to retrieve the corresponding value from
# the number_of_pets hash.
# The puts statement interpolates both the current hash value,
#  current_pet_number, and the current hash key, current_pet,
#  into the "I have ... !" string.

# Loop has 4 basic elements:
# loop
# counter
# way to retrieve the current value
# way to exit the loop
