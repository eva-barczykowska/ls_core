animal = "dog"
loop do |animal|
    animal = "cat"
    break
  end
puts animal

# On `line 1` we initialize a local variable `animal` and point it to reference a string object `'dog'`.
# On `line 2` we invoke the loop method and pass it a block, denoted by the keywords `do` and `end`.
# The block takes a block parameter, `animal`, which is scoped to the block only.
# On `line 3`, we reassign the animal variable to point to a new string object, `'cat'`.
# On `line 4`, the break keyword is used, which causes the loop method to terminate after a single iteration.
# On `line 6`, the puts method is invoked and the local variable `animal` is passed as an argument.
# The question that this code is asking us is - what will `line 6` output and why.
# `Line 6` will output the String `'dog'` and it will return `nil` because puts always returns `nil`.
# The concept that this code demonstrates is `variable shadowing` i.e. that the block variable `animal` on `line 2`
# made the local variable `animal` initialized on `line 1` inaccessible and thus unavalaible for change.
# If we want to change the string value that the `animal` variable on `line 1` is pointing to, we should use a different
# name for the block variable on `line 2`.
#
# On `line 6`, the puts method is invoked and the local variable `animal` is passed as an argument.
# --- check this. Do we pass variables as arguments? Or do we pass references to variables?
# --- both, depends on the level of complexity we went to describe it on, more in notes from Samuel

animal = "dog"
loop do |_|
  animal = "cat"
  var = "mouse"
  break
end

puts animal
puts var

# On `line 25` local variable `animal` is assigned a reference to string object `"dog"`.
# On `line 26` the `loop` method is invoked and `loop` takes a block as an argument. The block is defined by the keywords `do..end`.
# The block also takes a block parameter, `_` which is convention for a block parameter which is unused.
# The parameter `_` will act as a local variable within the block.
# On `line 27` `animal` is reassigned a reference to a string object `'cat'`.
# On `line 28` local variable `var` is initialized within the block, and assigned a reference to a string object `"mouse"`.
# On `line 29` an unconditional `break` keyword is used and it causes the `loop` method to terminate after a single iteration.
# On `line 28`, the `puts` method is invoked, and as an argument we pass a reference to the string object which the local variable `animal` is pointing to.
#  `var` was initialized in an inner scope (defined by the block) and not in the outer scope so the reference to `var` will be unavalaible.
#   `line 33` will raise an `undefined local variable or method error`
# This code demonstrates the concept of local variable scoping, specifically that local variables defined in the outher scope are available in the inner scope,
# but not vice versa.

my_hash = {a: 1, b: {d: 3, e: 5}, c: 7}

my_hash[:b][:d]

# This code demonstrates how to access a particular value in a hash.
# Values in a hash are accessed by their keys. In this case we are dealing with
# a hash within a hash. The value of one of the outer hash keys, is a hash itself.
# The inner hash, like every, hash has a key and value. The key is b: and the value
# is a hash, {d: 3, e: 5}. Line 3 accesses first the inner hash’s key, which is :b
# and then from the hash that belongs to the key :b it selects only 1 value, the
# value that belongs to :d. That is why 3 is printed. If we wanted to print the
# whole inner hash, line 3 should read my_hash[:b]. If we wanted to print both values,
# we could access the inner hash key and invoke the values method, like so
# my_hash[:b].values.
