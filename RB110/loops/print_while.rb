# Print While
# Using a while loop, print 5 random numbers between 0 and 99 (inclusive). The code below shows an example of
# how to begin solving this exercise.
#
# numbers = []
#
# while <condition>
#   # ...
# end

numbers = []

while numbers.size < 5
  numbers << (0..99).to_a.sample #it starts pushing at zero coz [].size is ZERO!
end

p numbers