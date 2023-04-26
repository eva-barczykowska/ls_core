# Task:
# Write a while loop that takes input from the user, performs an action, and only stops when the user types "STOP".
# Each loop can get info from the user.
# Why is there an error here and how to fix it?

# until answer == "STOP"
#   puts "Give me a number, I'll give you double"
#   answer = gets.chomp
#   puts answer.to_i * 2
# end

puts

# There is a problem in this code, can you run it, decide what it is and fix it? It has to do with the information
# that user gets when he decides to stop the loop.

# answer = nil
# until answer == "STOP"
#   puts "Give me a number, I'll give you double"
#   answer = gets.chomp.to_i
#   puts answer.to_i * 2
# end

puts

# answer = nil
# loop do
#   puts "Give me a number, I'll give you double"
#   answer = gets.chomp
#   break if answer == "STOP"
#   puts answer.to_i * 2
# end

# puts

# LS solution

# x = ""
# while x != "STOP" do
#   puts "Hi, How are you feeling?"
#   ans = gets.chomp
#   puts "Want me to ask you again?"
#   x = gets.chomp
# end