# animal = "dog"
#
# loop do |animal|
#  animal = "cat"
#  break
# end
#
# puts animal

# On line `1` we're initializing a local variable animal to the String
# object `dog`.
# On line 3 we're invoking a loop method which takes a block and the block is
# defined with `do` and `end` keywords.
# The block has a block parameter `animal`.
# Within the block we're reassigning animal to another string, `cat`.
# Subsequently, on line 5 we're breaking from the loop.
# The question is what line 8 will output or what object is `animal` pointing to now.
# `animal` will stay unchanged so it is still pointing to `dog`

#This code is an example of variable shadowing. Shadowing means that if the
# block parameter name is same as the name of the variable initialized in the outer scope,
# the block parameter/variable, local to the block, hides the `animal` variable
# on line 1 and this variable is not visible within the block.

# write templates while studying for the exam
# On line `xxxxx` we're initializing a local variable `xxx` to the xxxx object `xxxx`.

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
# p arr.each { |n| puts n.odd? }
# p arr.select { |n| puts n.odd? }
p arr.map { |n| puts n.odd? }

# On line `1` we're initialing a local variable `arr` to an array object `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`.
# On line `4` we're calling `select` method on the previously initialized array object referenced by `arr`.
# `Select` method takes a block. The block is defined by the curly braces `{..}`.
# The block has a local block parameter `n`, we're calling `odd?` method
# on each element of the array, represented by n. The `odd?` method returns true or false. So the return value of this
# line will be all the odd elements selected from the array.
# But the arr, if we output it, will stay the same because select method does not mutate the receiver.

# iteration - each
# each always returns the calling object, it's not concerned with the return value of the block
#
# selection - select
#  `#select` will look for the truthiness of the return value of the block.
# If the value is truthy the current element is selected and returned in a new array.
#
# transformation - map
# returns a NEW array with the same no of elements as the original array with each element transformed based on the
# return value of the block
