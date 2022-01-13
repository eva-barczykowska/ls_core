# Print all odd numbers from 1 to 99, inclusive, to the console, with each number
# on a separate line.

# algorithm:
# - use a range
# - print odd numbers from the range

range = (1..100)
range = range.to_a.each { |element| puts element if element.odd? }
#
# ls solution
#
# value = 1
# while value <= 99
#   puts value
#   value += 2
# end

# Further Exploration
# Repeat this exercise with a technique different from the one you just used,
# and different from the solution shown above. You may want to explore the use
# Integer#upto or Array#select methods, or maybe use Integer#odd?

# array = (1..99).to_a
# odds = array.select { |e| e.odd? }
# puts odds


# counter = 1
# while counter <= 99
#   puts counter if counter.odd?
#   counter += 1
# end
