# Let's look at adding conditions within a loop by printing all even numbers
# from 0 up to 10. Let's create a file named conditional_loop.rb

# conditional_loop.rb

i = 0
loop do
  i += 2
  puts i
  if i == 10 #this could be also just 1 line (see below)
    break # this will cause execution to exit the loop
  end
end

puts

i = 0
loop do
  i += 2
  puts i
  break if i == 10
end
