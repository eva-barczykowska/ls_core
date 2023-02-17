a = 'string'

[1, 2, 3, 4, 5].each do |a|
  puts a
end

puts a

# On `line 1`, a local variable `a` is initialized to reference the string object `"string"`.
# Subsequently, on `line 3` `Array#each` method is called on an array of 5 elements, all of them integers.
# `#Each` method takes a block, denoted by the words `do..end` and the block parameter `a`, enclosed in `||`.
# Within the body of the block `String#puts` method is called and `a` is passed to it as an argument.
# What will get printed from the block are all the elements of the caller array, so `1, 2, 3, 4, 5` on separate lines.
#
# Then on `line 23` we call the `puts` method and pass it variable `a` as an argument.
# This line outputs `"string"` and returns nil.
#
# The concept demonstrated by this code is variable shadowing.
# When we name the block variable on `line 3` `a`, this name is the same as the variable `a` in the outer scope.
# So when ruby looks for variable `a` and finds it in the form of the block variable, it will look no further.
# It will not look in the main scope, because it has already found it in the inner/block scope.
# That's why the call to `puts` on `line 4` outputs all the numbers of the array
# and not the string that the main-scoped variable `a` is pointing to, as initialized on `line 1'.
#
# Naming both variables same is preventing the inner scope from accessing the variable in the other scope.
# We should be careful naming our variables because variable shadowing is almost always unintended.