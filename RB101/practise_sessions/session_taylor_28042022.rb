animal = "dog"
loop do |animal|
    animal = "cat"
    break
  end
puts animal

On `line 1` we initialize a variable `animal` and we point it to reference a string "dog".
On `line 2` we start a loop and the loop takes a block. We define a block variable `animal`
and on the next line, `line 3`, we reassign the animal variable to point to another string object, `cat`. Then, on `line 4` we break out of the loop.
The question that this code is asking us to answer is what will variable `animal` output on
`line 7`. `line 7` will output the string `dog`. The concept that this code demonstrates
is `variable shadowing` and what happens is block variable `animal` on line 2 is shadowing the `animal` variable defined on line 1 and Ruby, when it starts looking for this variable on `line 3`, and finds it on `line 2` (in the form of the block variable), it stops looking and therefore does not reach and change the string that variable `animal` is pointing to on `line 1`.

#On line 1, the local variable animal is initialized with a reference to the String object 'dog'. On line 2 the loop method is invoked, which takes a block argument as defined by the do..end keywords. It has a block parameter, animal, which will act as a local variable method within the block. As a result of the block parameter having the same name as the variable initialized on line 1, that outer scope variable will be inaccessible within the block, and attempts to access it will instead access the block parameter. This is an example of variable shadowing.

#O n line 3, the method parameter is assigned a reference to a String object, 'cat'. On line 4, an unconditional break keyword is encountered, causing the loop method to exit after a single iteration.

# On line 6, the puts method is invoked and the reference assigned to local variable animal is passed as an argument. As animal points to the String object, 'dog', the puts method will output 'dog' and return nil.

animal = "dog"
loop do |_|
  animal = "cat"
  var = "mouse"
  break
end

puts animal
puts var

# On line 21 local variable `animal` is assingned a reference to string object `"dog"`.
# On line 22 the `loop` method is invoked taking a block as an argument, which is defined by the keywords `do..end`. The method also takes a method parameter, `_` which is convention for a block parameter which is unused. The parameter `_` will act as a local variable within the block.
# On line 23 `animal` is reassigned a reference to a string oject `'cat'`. On line 24 local variable `var` is initialized within the block, and assigned a reference to a string object `"mouse"`
# On line 25 an unconditional `break` keyword occurs which causes the `loop` method to terminate after a single iteration.
# On line 28, the `puts` method is invoked with a reference to the string object pointed to by `animal` passed as an argument outputting '`cat`'. On line 29 the `puts` method is invoked and passed a reference to the object point to by `var` as an argument. `var` was initialized in an inner scope and not the outer scope so the reference to `var` will be unavalaible. This will raise an `undefined local variable or method error`

# this is a concept of variable scope

# The question here is what will be the output of `line 37` and `line 38`
# `line 37` will output 'cat' because this variable is defined but `line 38`
# will produce `undefined variable or method` error because the variable `var`
# is defined in in inner scope (defined by the block), and therefore
# not accessible outside the block.
# This code illustrates the concept that variables initialized in the outer
# scope can be accessed in the inner scope (defined by the block)
# but not vice versa.
