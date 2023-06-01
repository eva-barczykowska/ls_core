# Only Even
# Using next, modify the code below so that it only prints positive integers that are even.
#
# number = 0
#
# until number == 10
#   number += 1
#   puts number
# end

number = 0

until number == 10
  number += 1
  next if number.odd?
  puts number
end

# Further exploration
# Why did next have to be placed after the incrementation of number and before #puts?