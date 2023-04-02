# source: https://fine-ocean-68c.notion.site/RB101-934e6196044d425f9b2f23830ead6534?p=91bcc598a24d4ad6aadad86802e7412b&pm=s
test = 5

def passbyvalue(param)
  param = param*5
  p param
  p param.object_id
end

puts test
puts test.object_id

passbyvalue(test)
puts test

# On line 1 a local variable `test` is initialized to reference an Integer object,
# `5`.

# On lines 3-7 `passbyvalue` method is defined with parameter, `value`.
# On line 9, the object that `test` is pointing to is passed to the `puts` method
# as an argument, this results in `5` being output and `nil` being returned.
# Also, `object_id` method is called on the object that `test` is referencing.

# Subsequently `passbyvalue` method is invoked and the object that `test` is referencing, is passed as an argument.
# This method call does the following:
# -it reassigns param to the return value of calling the Integer* method, so now
# param is pointing to 25
# -it passes param to the Kernel#print method, this results in printing  and returning`25`
# -passes the result of invoking object_id on param to the `p` method, this prints and returns object_id of param.
# So the return value of this method is the `object_id` of param.

# Finally, when the object that `test` is referencing is passed to the `puts`
# method as an argument, integer `5` is printed.
# The method has not changed the original object because on the first line of the body of the method param was
# reassigned to point to another integer, `25`.
# It would not be anyway possible for this method to mutate its caller because integers are immutable.
# Printing `object_id`` of param within the method, after reassigning and printing `object_id` method of `test`
# on line 10 results in different integers being printed and this is because these are different objects since
# reassignment took place on line 4, within the method.


n = 101.times do |x|
  n = 11
end

puts n

# `n` is assigned to the return value of calling the `times` method on Integer `101`
# and because `#times` returns its caller, whatever happens in the block, `n` will
# be assigned to 101.
# The block that `#times` takes, denoted by words `do..end` takes a block parameter
# `n` and within the block body it assigns integer `11` to `n`. It does it 101 times.

# On the last line the object that `n` is referencing is passed to the `puts` method and this results in the
# integer `101` being output and `nil` being returned.

# ?# The concepts represented here are return value from the method (`times` returns its caller)
# as well as variable shadowing - block scoped variable named the same as outer scope variable makes the outer scoped
# variable inaccessible and any attempts to access the outer scoped variable will be unsuccessful.


a = 4

loop do
  a = 5
  b = 3
  break
end

puts a
puts b

# On line 1 a local variable `a` is initialized to point to an Integer object `4`.

# On line 3 the `loop` method is invoked and a block is passed to it, the block is denoted by keywords `do..end`.
# Within the block `a` is reassigned to point to `5` and `b` is initialized to point to `3`, after which
# unconditional `break` keyword is used and so the loop is executed only once.

# On the last 2 lines, the object that `a` is referencing is passed to the `puts`
# method, which outputs `5` and returns `nil`.
# On the last line the object that `b` is referencing is passed to the `puts`
# method, which results in `unknown local variable or method error`.
# This is because outer or main scope where `puts` with the argument `b` is invoked doesn't have access to the
# inner scope within the `loop` method.
# The concept represented here is variable scope, specifically the fact that a block's inner scope has access to variables initialized in outer scope  but not vice versa.
