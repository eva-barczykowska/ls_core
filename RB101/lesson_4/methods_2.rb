# starting with the one that I was most unfamiliar with

# .each_with_index
{ a: "ant", b: "bear", c: "cat" }.each_with_index do |pair, index|
  puts "The index of #{pair} is #{index}."
end

#-returns the original collection, just like .each

puts

# .each_with_object
# .each_with_object besides a block takes a METHOD ARGUMENT.
# The method argument is a collection object that will be returned by the method
# On top of that, the block takes 2 arguments on its own
# The first block argument represents the CURRENT ELEMENT
# The second block element represents the COLLECTION OBJECT THAT WAS PASSED
# IN AS AN ARGUMENT TO THE METHOD
# Once it's done iterating, the method RETURNS THE COLLECTION OBJECT THAT WAS
# PASSED IN

[1, 2, 3].each_with_object([]) do |num, array|
  array << num if num.odd?
end

# similar to each_with_index, the first block argument turns into an array when
# we invoke each_with_object on a hash

{ a: "ant", b: "bear", c: "cat" }.each_with_object([]) do |pair, array|
  array << pair.last
end

# it is also possible to use parenthesis to capture the key and value in the
# first block assignment

{ a: "ant", b: "bear", c: "cat" }.each_with_object({}) do |(key, value), hash|
  hash[value] = key
end

# first
[1, 2, 3].first

{ a: "ant", b: "bear", c: "cat" }.first(2)
first_two_in_a_hash = { a: "ant", b: "bear", c: "cat" }.first(2)

#include?

[1, 2,3].include?(1)

{ a: "ant", b: "bear", c: "cat" }.include?("ant")
# This will be false
{ a: "ant", b: "bear", c: "cat" }.include?("ant")
# This will be true => .include? is basically an alias for Hash#key?

{ a: "ant", b: "bear", c: "cat" }.key?(:a)
{ a: "ant", b: "bear", c: "cat" }.value?("ant")

#partition

[1, 2, 3].partition do |number|
  number.odd?
end

#cool way to do it is to assign to 2 variables at the same time

odd, even = [1, 2, 3].partition { |number| number.odd? }

# even if collection is a hash, the return value of .partition will ALWAYS BE AN ARRAY
long, short = { a: "ant", b: "bear", c: "cat" }.partition { |key, value| value.size > 3 }

puts "*************************************************************************"

[1, 2, 3].any? { |element| element > 2 }

[1, 2, 3].any? do |number|
  number > 2
end

{ a: "ant", b: "bear", c: "cat" }.any? do |key, value|
  value.length >= 3
end

[1, 2, 3].all? do |num|
  num > 2
end

{ a: "ant", b: "bear", c: "cat" }.all? do |key, value|
  value.length >= 3
end

[1, 2, 3].each_with_index do |num, index|
  p "The index of #{num} is #{index}."
end

[1, 2, 3].each_with_index do |num, index|
  p num * index
end
