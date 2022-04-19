puts "each is running"
a = [[1, 2], [3, 4]].each do |arr|
  puts arr.first
end

# Nested array.
# Calling the array method `each` on the nested array.
# `each` takes a block. A block is bounded by `do` and `end`.
# The block also takes a parameter. Bounded by bars (|).
# The parameter that `each` takes is an element in the array.
# `arr.first` is the same in Ruby as `arr[0]` in JavaScript.
# `puts` always returns `nil`
# The block implicitly returns the return value of `puts`, which is `nil`.
# The return value of the block is not used because `each` doesn't care about
# the return value.
# `1` and `3` will be printed because they are the first elements of each
# sub-array.
# Two method calls. The first is `arr.first`. The return value of `arr.first`
# is used by `puts`.
# `puts` will output the string representation of the return value of
# `arr.first`, which in both cases here are integers.
# `puts` means 'put string'.
# `each` returns its calling object.

puts "map is running"
b = [[1, 2], [3, 4]].map do |arr|
  arr.first
  puts arr.first
end

puts ""

print a

puts ""

print b

# `map` is a transformation method. It transforms an array according to the
# block's return value.
# `each` returns the calling object.
# `map` returns a new array (a transformed array). The transformation depends
# on the return value of the block.
# `map` also takes a block. (not every method does)
# A block is denoted by the words `do` and `end`.
# Like `each`, the parameter takes each element of the array (and `map` is
# called on each subarray).
# The return value of `arr.first` will be `1` and `3`. `puts` will output their
# string representations.
# `map` returns a new array based on the return value of the block.
# The return value of the block is `nil`. So, this method will return an array
# with two elements; each of them is `nil`.
# The return value of block is the last line if nothing is explicitly returned.

# A case statement is like conditional flow.

puts ""
puts "The operation_to_message:"
puts ""

def operation_to_message(operation)
  word = case operation
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
  puts "Hello from calculator"
  word
end

print operation_to_message('1')
# we need to be careful when the case is the last expression in the method
# if we want to add some code, then the return value will not be the return
# value of the case statement anymore.
# The way to fix that is to add 'word' as the last expression in the method.

puts " "

# ternary operator

num = 98

is_odd = num.odd? ? "Yes, it's odd" : "No, it's not odd!"
p is_odd
