# Write a program that will ask for user's name. The program will then greet the
# user. If the user writes "name!" then the computer yells back to the user.
#
# What is your name? Bob
# Hello Bob.
# What is your name? Bob!
# HELLO BOB. WHY ARE WE SCREAMING?
#
# input: string
# output: string
# algorith:
# - prompt for the user's name
# - check if the input has an exlamation mark at the end
# - check for the last character with .end_with? method
# - greet the user, interpolate his name variable
# - but greet him according to what his input was, use different String methods

puts "Hello there, what is your name, please?"
name = gets.chomp
if name.end_with?("!")
  puts "HELLO #{name.chop.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end


#ls solution
# print 'What is your name? '
# name = gets.chomp
#
# if name[-1] == '!' # simply check by index
#   name = name.chop
#   puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
# else
#   puts "Hello #{name}."
# end

# Further Exploration
# Try modifying our solution to use String#chomp! and String#chop!, respectively.
# print 'What is your name? '
# name = gets.chomp!
#
# if name[-1] == '!' # simply check by index
#   name = name.chop!
#   puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
# else
#   puts "Hello #{name}."
# end
