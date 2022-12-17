a = 4

loop do
  a = 5
  b = 3


  break
end

puts a
puts b

=begin
On `line 1` a local variable `a` is declared and initialized to an Integer `4`.
Then a loop is started and within the loop we reassign `a`` to point to
an Integer `5`. Within the loop we also initialize another variable,
`b` to reference the Integer `3`.
The loop runs only once.
We break out of the loop with the keyword `break` and subsequently we use
the puts method and pass it `a` and then `b`. `line `11` will print 5,
because within the loop we reassigned `a` to point to `5`.
The last line will produce an error, `undefined local variable or method`
because `b` has been initialized in the inner scope (the scope of the loop)
and is not accessible in the outer, i.e. main scope.
This snipped represents the concept of variables as pointers, reassignment
and outer vs inner scope.
=end

a = "Hello"

if a
  puts "Hello is truthy"
else
  puts "Hello is falsey"
end
=begin
On `line 1` a local variable `a` is initialized and declared to
a String object `Hello`.
On `line 3` an `if condition` is evaluated and if `a` evaluates to true,
then the string `Hello is truthy` will be printed.
Otherwise, if the `if condition` evaluates to `false`,
the string `Hello if falsey` will be printed.
In Ruby, everything except `false` and `nil` is truthy and therefore
`a` is truthy and what we will see printed out is the string "Hello is truthy".
This code returns `nil` because `puts` always returns nil.

The concept represented here is the concept of truthiness and falsyness in Ruby.
=end