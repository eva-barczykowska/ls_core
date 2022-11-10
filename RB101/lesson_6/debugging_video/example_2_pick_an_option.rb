require 'pry'

# puts "Please pick an option: 1 or 2"
#
# user_input = gets.chomp
#
# if user_input == 1
#   puts "You've picked 1"
# elsif user_input == 2
#   puts "You've picked 2"
# else
#   puts "Invalid option!!!"
# end

# we can output the value to see what it is and if it is what we expect it to be
# puts "Please pick an option: 1 or 2"
#
# user_input = gets.chomp
# puts user_input
#
# if user_input == 1
#   puts "You've picked 1"
# elsif user_input == 2
#   puts "You've picked 2"
# else
#   puts "Invalid option!!!"
# end


# now replace the line puts user_input with binding.pry
# I will get the error:
# undefined method `pry' for #<Binding:0x00007fc2b58a5af0> (NoMethodError)
# because I have not required pry at the beginning of my file
# puts "Please pick an option: 1 or 2"
#
# user_input = gets.chomp
# binding.pry
#
# if user_input == 1
#   puts "You've picked 1"
# elsif user_input == 2
#   puts "You've picked 2"
# else
#   puts "Invalid option!!!"
# end

# solution
puts "Please pick an option: 1 or 2"

user_input = gets.chomp
user_input = user_input.to_i

if user_input == 1
  puts "You've picked 1"
elsif user_input == 2
  puts "You've picked 2"
else
  puts "Invalid option!!!"
end
