# Greeting
# Given the code below, use a while loop to print "Hello!" twice.

# def greeting
#   puts 'Hello!'
# end
#
# number_of_greetings = 2

def greeting
  puts 'Hello!'
end

number_of_greetings = 2

loop do
  number_of_greetings.times do
    greeting
  end

  break
end