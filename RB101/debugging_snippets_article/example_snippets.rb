# What is being output and why? What’s being returned? What concept does it represent?
a = "tomorrow’s Friday"
b = a
a = "tomorrow’s Sunday"

puts a
puts b

puts

=begin
 Misha and Masha are at the French Riviera. They bask in the sun and lazily gaze at the waves glittering.
Suddenly they see an unidentified object slowly floating in their direction. Based on this code, what will be their
reaction? What concept does this snippet represent?
=end

message = "Is there anybody out there?"
bottle_colour = "green"

def message_in_the_bottle(msg, bottle_specs)
  "Does it matter what color the bottle is?"
  puts "The message in the #{bottle_specs} bottle is: #{msg}"
end


if message_in_the_bottle(message, bottle_colour)
  puts message
else
  puts "huh?"
end

puts

# counter = 0

# loop do
#   next if counter.odd?
#   counter += 1
#   puts counter
#   break if counter > 5
# end
#
# counter = 0
#
# loop do
#   counter += 1
#   next if counter.odd?
#   puts counter
#   break if counter == 5
# end

alphabet = 'abcdefghijklmnopqrstuvwxyz'
# counter = 1

# loop do
#   break if counter == alphabet.size - 1
#   puts alphabet[counter]
#   counter += 1
# end

# alphabet = 'abcdefghijklmnopqrstuvwxyz'
# counter = 0
#
# VOWELS = "aeoui"
# loop do
#   counter += 1
#   next if VOWELS.include?(alphabet[counter])
#   puts alphabet[counter]
#   break if counter == alphabet.size
# end

# print only vowels
# alphabet = 'abcdefghijklmnopqrstuvwxyz'
# counter = 0
#
# VOWELS = "aeoui"
# loop do
#   break if counter == alphabet.size - 1
#   counter += 1
#   next if !VOWELS.include?(alphabet[counter])
#   puts alphabet[counter]
# end

# what's the problem here? And what would be the solution?
# alphabet = ""
# counter = 0
#
# loop do
#   counter += 1
#   break if counter == alphabet.size
#   puts "The element at the counter #{counter} is #{alphabet[counter]}"
# end
#
# solution
alphabet = ""
counter = 0

loop do
  counter += 1
  break if counter >= alphabet.size
  puts "The element at the counter #{counter} is #{alphabet[counter]}"
end

puts

# What's the problem here?
# colors = ['green', 'blue', 'purple', 'orange']
# counter = 0
#
# loop do
#   break if counter == colors.size
#   next if colors[counter].start_with?("p")
#   puts "I'm the color #{colors[counter]}!"
#   counter += 1
# end

# fix
colors = ['green', 'blue', 'purple', 'orange']
counter = -1

loop do
  counter += 1
  next if colors[counter].start_with?("p")
  puts "I'm the color #{colors[counter]}!"
  break if counter >= colors.size - 1
end

puts

objects = ['hello', :key, 10, []]
counter = 0

loop do
  break if counter == objects.size
  puts objects[counter].class unless objects[counter] == Hash
  counter += 1
end

#question we had with Ilke - print object_id to see if it's the same key
hash_x = { "fruit" => "banana", "soup" => "tom yum"}
hash_x.each do |key, _|
  puts "The key object id is #{key.object_id}"
end

hash_x["fruit"] = "plum"
p hash_x
hash_x.each do |key, _|
  puts "The key object id is #{key.object_id}"
end