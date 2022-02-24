
#
# // How did you study PEDAC?
#
# /*
#   I ended up adapting PEDAC to what I needed it to be.
#
#   When I first started studying, I used the Small Problems exercisese to try and fill out each letter.
#   P - Problem
#   E - Exercises
#   D - Data Structures
#   A - Alorithm
#   C - Code
#
#   What I found while going through simple problems - it was overkill.
#   So for simpler problems, I stick to the PROBLEM and the ALGORITHM.
#
#
#   That feeling of 'I want to rush' and 'I want to look competent.'
#   - Have you tried to time yourself on a problem with and without PEDAC?
#   - I mainly mean between different problems - even though the times can't be directly compared, I still found value in trying this, I noticed that without PEDAC I felt like I had solved the problem faster than I did, and with PEDAC, I found that I solved the problem faster than it had felt.
#
#   With PEDAC - solved in a shorter time than what it felt like.
#   W/o  PEDAC - solved in a longer time than what it felt like.
#
#   I feel like I'm getting 'more' done when I 'hack and slash' the problem to a solution.
#   I feel like I'm getting 'less' done when I'm working through PEDAC.
# */




# Top-most env is Kernel.
# Kernel is an object.
# Some methods belong to the Kernel, but are accessable without Kernel access.
# 'puts' is an example.
# Loops belong to the Kernel, too.
# `break` keyword will end loop execution
# `next` keyword will skip the remainder of the loop. (JS `continue`)
# `loop do` will start an infinite loop that requires a `break` condition
# Putting the `break` at the start of the loop will emulate `while` behavior.
# Putting the `break` at the end of the loop will emulate `do-while` behavior.
# Ruby has a `while` loop that accepts a condition.

# Kernel.puts 'Hello there'
# puts 'Hello there'

# loop do
#   number = rand(10)
#   puts 'This is coming from the loop'
#   if number == 5
#     puts 'Exciting...'
#     break
#   end
# end

# loop do
#   number = rand(10)
#   puts 'This is coming from the loop'
#   break if number == 5
#     puts 'Exciting...'
# end

# counter = 0
# loop do
#   counter += 1 #we are moving counter here so that it executes first coz any code after next will be ignored!
#   next if counter.odd?
#   puts counter #this will not be printed when counter is odd
#   break if counter > 5 # I forgot this needs to be changed coz 5 id odd he he
# end

# counter = 0
# while counter < 10
#   puts "Hello, I'm number #{counter}"
#   counter += 1
# end

# counter = 0

# loop do
#   puts counter
#   puts "Hello"
#   counter += 1
#   break if counter == 5
# end
# this mimics do while loop


# counter = 0

# loop do
#   break if counter == 0
#   puts "Hello, I'm below the counter!" #this doesn't print
#   counter += 1
# end
# # this mimics while loop

# alphabet = 'abc'
# counter = 1

# loop do
#   break if counter == alphabet.size
#   puts alphabet[counter]
#   counter += 1
# end

# alphabet = 'abc' # The size is odd == 3
# counter = 0

# loop do
#   break if counter <= alphabet.size # 0, 2, 4
#   puts alphabet[counter]
#   counter += 2
# end

# colors = [33, nil, 'purple', :flag]
# counter = 0

# loop do
#   break if counter == colors.size
#   puts "#{colors[counter].class}"
#   counter += 1
# end

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
puts
#*****************************************************************************
# What I didn't cover is:
# - while loops
# - do while loops and my misunderstanding of the explanation in the course materials
# - until loops (opposite of while)
# - for loops
# - scope in loop do/end and all the other loops(while, until, for)
# - while/until/loop return nil
# - for loop returns a colllection of elements

counter = 10
loop do
  p "We are taking off in #{counter} seconds"
  counter -= 1
  m = 2
  break if counter == 0
end

# p m

v = 0
while v < 10
  "Hello, I am currently printing number #{v}"
  v += 1
  m = 2
end

# p m

for x in 0..4
  p x
  m = 22
end
p m
