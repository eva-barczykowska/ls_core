require 'pry'
# require 'pry-gem'

puts "Please enter 1 or 2"
input = gets.chomp
binding.pry
if input == 1
  puts "Your inpunput is 1"
elsif input == 2
  puts "Your input is 2"
else
  puts "Invalid option!!!"
end

# REPL
#
# Read
# Evaluate
# Print
# Loop

#corrected

puts "Please enter 1 or 2"
input = gets.chomp
# binding.pry
if input == "1"
  puts "Your inpunput is 1"
elsif input == "2"
  puts "Your input is 2"
else
  puts "Invalid option!!!"
end
