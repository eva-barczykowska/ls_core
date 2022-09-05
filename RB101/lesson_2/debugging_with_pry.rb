require "pry" # download the pry gem and then require it at the top of file

counter = 0

loop do
  counter += 1
    binding.pry
  break if counter == 5
end

# execution will stop after the line binding.pry
# then you can ask at the prompt for example what is the value of counter
# Ctrl + D to continue with the execution
# exit-program to exit
