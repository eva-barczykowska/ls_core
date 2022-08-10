=begin
Madlibs
Mad libs are a simple game where you create a story template with blanks for words.
You, or another player, then construct a list of words and place them into the story,
creating an often silly or funny story as a result.

Create a simple mad-lib program that prompts for a noun, a verb, an adverb, and
an adjective and injects those into a story that you create.

Example:
Enter a noun: dog
Enter a verb: walk
Enter an adjective: blue
Enter an adverb: quickly

Do you walk your blue dog quickly? That's hilarious!

PEDAC
Problem
-create a game when you prompt user for a noun, a verb, an adjective and an adverb
-then a sentence is created where you enter all those, creating a hilarious sentence

Example
Example:
Enter a noun: dog
Enter a verb: walk
Enter an adjective: blue
Enter an adverb: quickly

Do you walk your blue dog quickly? That's hilarious!

Data Structures
input - 4 strings in turn
output - 1 string containing the 4 strings from the input

Algorithm
-prompt the user in turn to enter a noun, a verb, an adjective and an adverb
-return the sentence "Do you  " + verb + 'your'+ adjective + noun + adverb." + "That's hilarious!"

Code
=end

puts "Enter a noun"
noun = gets.chomp
puts "Enter a verb"
verb = gets.chomp
puts "Enter an adjective"
adjective = gets.chomp
puts "Enter an adverb"
adverb = gets.chomp

def madlibs(noun, verb, adjective, adverb)
  "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!"
end

p madlibs(noun, verb, adjective, adverb)

puts ""

def prompt(type)
  puts "Please enter a #{type}"
end

types = ["noun", "verb", "adjective", "adverb"]
responses = []

types.each do |type|
  prompt(type)
  responses << gets.chomp
end

puts "Johnny #{responses[3]} stole a #{responses[0]} from his #{responses[2]} neighbor, and then ran away to #{responses[1]} with his friends"

puts ""

#ls solution
print 'Enter a noun: '
noun = gets.chomp

print 'Enter a verb: '
verb = gets.chomp

print 'Enter an adjective: '
adjective = gets.chomp

print 'Enter an adverb: '
adverb = gets.chomp

sentence_1 = "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!"
sentence_2 = "The #{adjective} #{noun} #{verb}s #{adverb} over the lazy dog."
sentence_3 = "The #{noun} #{adverb} #{verb}s up #{adjective} Joe's turtle."

puts [sentence_1, sentence_2, sentence_3].sample
