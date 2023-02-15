x = "blue"

4.times do
  x = "yellow"
  y = "purple"
end

puts x
# puts y

# On `line 91` we are initializing a local variable `x` and make it reference
# the string `"blue"`. Then on `line 93` we call the `#times` method on the integer `4`
# and pass it a block denoted by the words `do..end`. Within the body of the block, we reassign `x`
# to point to another string, `"yellow"` and this is possible because inner scope/the scope of the block
# has access to variables initialized in the main scope.
# Within the body of the block we also initialize the variable `y`, which we point to the string `"purple"`.
# After we exit the block we call the `puts` method and pass it `x` and `y` subsequently.
# `Line 98` will output the string `"yellow"` because it has been reassigned within the body of the block, but `line 99`
# will cause `undefine local variable or method error` because `y` has been initialized
# in the inner scope/the scope of the block and is not accessible in the main scope/outer scope.