arr = ["9", "8", "7", "10", "11"]
p arr.sort do |x, y|
  y.to_i <=> x.to_i
end

# Precedence problem, remove the p to get correct output
# Expected output: ["11", "10", "9", "8", "7"]
# Actual output: ["10", "11", "7", "8", "9"]
#
# this is because if we have the code like that,
# Ruby sees it like this
# i.e. the block is not visible, only .sort is visible to p
# (.sort gets bound to p)
#
arr = ["9", "8", "7", "10", "11"]
p (arr.sort) do |x, y|
  y.to_i <=> x.to_i
end

# "10" => 49 (.ord)
# "11" => 49
# "7" => 55
# "8" => 56
# "9" => 57
#
# we can also wrap the whole expression that has to be passed to p
# in brackets

arr = ["9", "8", "7", "10", "11"]
p (arr.sort do |x, y|
  y.to_i <=> x.to_i
end)

# also we can fix it using the {}, which has higher precedence

arr = ["9", "8", "7", "10", "11"]
p arr.sort { |x, y| y.to_i <=> x.to_i}

# also another example from the course
arr = [11, 22, 33]
p arr.map { |num| num + 1} # nothing odd here
# The return value of map gets passed into p as an argument, which outputs [12, 13, 14].
puts

arr = [100, 200, 300] # but when we want to use do/end and print...
p arr.map do |num|
  num + 1
end
#<Enumerator: [100, 200, 300]:map>

#  It’s the same map call but now with a do...end block.
# As it turns out, blocks have the lowest precedence of all operators.
# But between the two, { } has slightly higher precedence than do...end.
# This has an effect on which method call the block gets passed to.
# That's why we get the unexpected result.
#
# With do...end being the “weakest” of all the operators,
# array.map gets bound to p, which first invokes array.map,
# returning an Enumerator object. The Enumerator is then passed to p,
# along with the block. p prints the Enumerator, but doesn't do anything with the block.

arr = [110, 220, 330]
p(arr.map) do |num| # this is how Ruby sees it
  num + 1
end
# <Enumerator: [110, 220, 330]:map>

# the binding between a method name and a method's argument
# (p and the return value of array.map)
# is slightly tighter than the binding between
# a method call and a do...end block.
# Thus, array.map gets executed first,
# then the return value and the block get passed to p as separate arguments.
# a solution is to add parenthesis wrapping the whole map with its block
# - what's in the parenthesis, will get executed first
#
arr = [55, 66, 77]
p(arr.map { |num| num + 1 })

puts

# other examples
# true ? puts "Hello" : puts "Goodbye" # raises a SyntaxError
# false ? puts "Hello" : puts "Goodbye" # raises a SyntaxError coz Ruby doesn't now that puts and "Goodbye" go together

# use parenthesis:
puts(true ? "Hello" : "Goodbye")   # => Hello
puts(false ? "Hello" : "Goodbye")  # => Goodbye

# tap method for debugging
array = [5, 15, 25]
mapped_array = array.map { |num| num + 1 }
mapped_array.tap { |value| p value }              # => [2, 3, 4]