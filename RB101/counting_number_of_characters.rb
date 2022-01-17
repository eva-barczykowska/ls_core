# Write a program that will ask a user for an input of a word or multiple words
# and give back the number of characters. Spaces should not be counted
# as a character.

# input: a string, a word or multiple words
# output: an integer, number of characters, excluding spaces
# algorithm:
# - ask for input
# - split into an array
# - use squeeze method to remove spaces, or simply remove " "
# - count characters(elements of the array)
# - inform the user, characters will be == array.size

puts "==> Please write word or multiple words"
input = gets.chomp
result = input.split("").delete_if{ |element| element == " "}
puts "There are #{result.size} characters in \"#{input}\"."

# ls solution:
# I didn't know that String had a .delete method too
# print 'Please write word or multiple words: '
# input = gets.chomp
# number_of_characters = input.delete(' ').size
# puts "There are #{number_of_characters} characters in \"#{input}\"."

# solutions I liked"
# def put_char
#   puts "Gimme some words"
#   words=gets.chomp
#   puts "There are #{words.split.join.length} characters in \"#{words}.\"."
# end
#
# put_char

# using a carrot!
# print "Please write word or multiple words: "
# words = gets.chomp
#
# puts "There are #{words.count('^ ')} characters in \"#{words}\"."
