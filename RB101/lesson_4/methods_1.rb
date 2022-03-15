numbers = [1, 2, 3]
counter = 0

loop do
  break if counter == numbers.size
  puts numbers[counter]
  counter += 1
end

# another way, with .each
# .each

[1, 2, 3].each do |num|
  puts num
end

# .each always returns the ORIGINAL ARRAY!

# since we are working with an array, .each knows that there's only one element
# per iteration, so .each sends the block only one argument, num.

# Hashes, however, need 2 arguments in order to represent both key and value
# per iteration.
# So when we call .each on a hash, the block will have 2 arguments.

hash = { a: 1, b: 2, c: 3 }

hash.each do |key, value|
  puts "The key is #{key} and the value is #{value}."
end

def a_method
  [1, 2, 3].each do |num|
    puts num * 2
  end
end

a_method

# de facto the last expression in the method is [1, 2, 3].each,
# except of the block, so the method returns the last expression, [1, 2, 3]

hash.each do |key, value|
  puts "The key is #{key} and the value is #{value}."
end

def a_method
  [1, 2, 3].each do |num|
    puts num * 2
  end

  puts "hi"
end

a_method

# .select

[1, 2, 3].select {|num|  num.odd?}
# .select evaluates THE RETURN VALUE OF THE BLOCK.
# The block returns a value on each iteration, which then gets evaluated by
# .select
# Similar to a real method, the return value of the block is the RETURN VALUE OF
# THE LAST EXPRESSION WITHIN THE BLOCK

# when evaluating the block's RETURN VALUE, .select cares only about its
# TRUTHINESS. Everything in Ruby is considered truthy except NIL and FALSE.
# If the return value of the block is truthy, then the element during that
# iteration will be selected. If the return value of the block is falsey,
# then the element will not be selected.

[1, 2, 3].select do |num|
  num + 1
end

# SELECT pefors selection based on the TRUTHINESS of the block's return value.
# When an element is selected, it is placed in a NEW COLLECTION.

evens = [1, 2, 3].select do |num|
  num.even?
end

# When working with select it is improtant to be aware of the RETURN VALUE of
# the block

[1, 2, 3].select do |num|
  num + 1
  puts num
end

# .select will now return an empty array because puts num is the last evaluated
# expression in the block, it is the return value of this expresssion which
# determines the return value of the block. Puts always returns nil so the
# return value will be nil, which is a falsey value. So .select will not select
# any elements because the return value will always be falsey.

#.map
# .map uses the return value of the block to perform transformation ==
# .map performs tranformation based on return value of the block
# .select perfoms selection based on the truthiness of the return value of the block
# .map RETURNS A NEW COLLECTION, same as .select
# .select uses the return value of the block to perform selection

[1, 2, 3].map do |num|
  num * 2
end

# In this example, the return value of the block is product of num and 2.
# .map then takes this value and places it in a new collection.
# what will be the return value?

[1, 2, 3].map do |num|
  num.odd?
end

[1, 2, 3].map do |num|
  num.odd?
  puts num
end

[1, 2, 3].map do |num|
  num.odd?
  "hi"
end
