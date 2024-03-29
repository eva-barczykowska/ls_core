#1. What do you expect to happen when the `greeting` variable is referenced in the last line of the code below?

if false
  greeting = "hello world"
end

greeting

# `Nil` will be returned. This is because even though the the `if condition` evaluates as false, Ruby parser is aware
# of the `greeting` variable and, since this variable hasn't been explicitly initialized anywhere in the code before,
# and it is is not initialized to the String object "hello world" on line 2(because that line never runs),
# Ruby parser gives it the value of `nil`.
#
# =begin
# Yes! This is really good. Everything is there.
# =end

#2. What does the following code output? What is the return value of the if statement? Why?

name = "Ewa"

if name
  name = "Alex"
end

puts name

# This code outputs "Alex" because the object that `name` is pointing to has been reassigned on line 4. The code on
# line 4 ran because the `if condition` on line 3 evaluated as true. It evaluated as true because everything in Ruby
# evaluates as true when used in flow control, except `nil` and `false`. Consequently, the object that `name`
# is pointing to has been changed (reassignment tool place) from "Ewa" to "Alex".
#
# The last line of the code prints "Alex" to the screen and it returns `nil` because the `puts` method
# always returns `nil`.
#
# The return value of the if statement is the last evaluated expression. In this case it's ``"Alex"` because the
# condition passed to `if` evaluated as true.

=begin
Beautifully explained. I understood everything. One thing: I asked what the return value of the if statement was. I was looking for an answer something like this: The return value of an if statement is the value of the code that was run if the if condition evaluated as true. In this case that would be the string "Alex".
=end

#3. What does the following code output? What is the concept demonstrated?

def color_valid(color)
  color == "blue" || color == "green"
end

what_color = "green"


p color_valid(what_color)
# This code outputs `true` and the concept represented here is `short-circuit evaluation`
# For the || operator, only 1 of the operands have to be true so after Ruby evaluated the String object `"blue"`,
# it doesn't evaluate further because the expression will be true anyway. And the string literal `"blue"`
# evaluates as true because everything in Ruby evaluates evaluates as true in flow control, except `false` and `nil.`

# Another concept could be the implicit return value of methods, i.e. method return the last evaluated expression if the
# keyword `return` was not used.
#
# =begin
# Nice! Short and sweet. Another concept could be the implicit return value of methods.
# =end
#
#4. What does this code print? What does it return and why? What concept is represented here?

def repeater(string)
  result = ''
  string.each_char do |char|
    result << char << char
  end
  result
end
# p "Awesome!".object_id
puts repeater("Awesome!")
# p "Awesome!".object_id
#
# This code prints the String `"AAwweessoommee!!"` and the concept represented here is `pass by value`.
# The `repeater` method doesn't mutate the original string and this can be established by calling the `object_id`
# method on the string literal before and after it has been passed to this method. The numbers returned by calling this
# method are different, which means that the string passed to the `repeater` method and returned by it are actually
# different objects, albeit with the same value.

=begin
The way you've answered this has me thinking a lot! At first I thought that you did not quite get this one,
but I think there are merits to your answer. You are right that the concept here could be pass-by-value
because the original string is not mutated. However, your reasoning for it is flawed,
and I must admit I am having trouble articulating why that is (but I'll try my best and hopefully it makes sense).

The string "Awesome!" has not been assigned to a variable, so its space in memory is not fixed...each time it is
"brought to life" in the program it is a new string. That is why, when you do the object_id test on lines 9 and 11 you
get different object ids. I don't think that this is an example of object passing in the way that we know it,
because we are not passing in a variable (that points to an object) to the method,
so there's no aliasing between an outer scoped variable and a method parameter.

Within the method, the object referenced by string is not acted upon in any destructive way
- it is just used to iterate through each character.
So is the question about pass-by-value even relevant here (I'm asking myself this question, too)?

The concept I was looking for was that of the last evaluated expression being the return value of a method.
=end

# my comments after the exam: this is not pass-by-value example. Ruby acts as pass-by-value with immutable objects,
# like strings or symbols.
# This is an example of implicit return from the method.

#5. What does the following code output? Why is `person` not mutated?

def question(name, eating)
  name += ", what are you eating?"
  eating << "sausage"
end

person = "Ben"
eat = ["pumpkins"]
question(person, eat)

puts person
puts eat

# This code outputs strings `"Ben"`, `"pumpkins"` and `"sausage"`
# `person` is not mutated because the object that `person` is pointing to has been reassigned within the body of the
# `question` method. It has been reassigned from "Ben" to point to the return value of itself concatenated with another
# string, `", what are you eating?"`. So now `name` within the body of the method - even through at the moment of
# calling the method was pointing to `"Ben"` because `name` and `person` were aliases pointing to the same object
# - now is pointing to `"Ben, what are you eating?"` and from this moment on, it is not possible to mutate the original
# object passed to the `question` method, referenced by the variable 'person'.

=begin
Excellent answer! I have nothing to add.
=end

# #6. What does the last line of this code output and why? What does it return? What concept is illustrated here?
#
def all_zero
  0
end

puts 'true' if all_zero

# The last line of this method outputs `true` and returns `nil`.
#
# The last line is a call to the `Kernel#puts` method. The method is passed an argument a String object `"true"`
# but it is followed by a conditional statement, `if all_zero`. If this statement evaluates as true, `"true"` will be
# printed. `all_zero` is actually a method invocation, and this method is defined on lines 1-3. We can see that this
# method, when invoked, returns `0` and so the if condition will evaluate as true because `0` evaluates as true.
# In fact every expression in Ruby evaluates as true when used in flow control, except `false` and `nil`.
# Because the `if condition` evaluated as true, the string `"true"` is printed to the screen. `Nil` is returned
# because invocation of the `puts` method always returns `nil`.
#
# The concept represented here is that of `truthiness`.

=begin
Again, great answer. You're very good at answering questions about truthiness.
=end

#7. What does the following code output? What's the concept demonstrated?

a = 'poem'

%w(to be or not to be).each do |a|
  a = 'sonnet'
end

puts a
# The String object `"poem"` is output from this code.
#
# The concept represented here is `variable shadowing.` On line 3 the `Array#each` method is called on the
# array of strings %w(to be or not to be) and a block is passed to the `each` method as an argument. The block
# is denoted by the keywords `do..end`. The block creates takes a block parameter `|a|`, which is named the same
# as the local variable initialized in the main scope. It looks like within the block we are trying to reassign
# the object to which `a` is pointing to (which is `'poem'`) to point to `'sonnet'` but this attempt is unsuccessful
# and `a` remains unchanged. This is because of a concept called variable shadowing, a situation
# like this one in which a variable with the same name exists within the block - in the inner/block scope
# and outside of the block, in the outer scope.
# Ruby parser while executing the code in the block is looking for the variable with the name `a`
# and when it finds it in the form of the block variable, it looks no further.
# Giving the block parameter the same name as the outer scope variable is considered something to be avoided
# because it can lead to unexpected results.

=begin
Perfect! I especially like this line: "Ruby parser while executing the code in the block is looking for the variable with the name a and when it finds it in the form of the block variable, it looks no further."
=end

# #8. What does the following code output? Why?

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting
puts greetings

# String object `"hi there"` and Hash object `{:a=>"hi there"}` are output from line 5 and 6 respectively.
# This is because the object which `greetings` is referencing on line 1, namely `{ a: 'hi' }` has been mutated on line 3
# by using the destructive `<<` method. This method mutates its caller and so `{ a: 'hi' }` becomes `{ a: 'hi there' }`
#
# Since we initialized `informal_greeting` to point to the `{ a: 'hi' }` object on line 3 and this object has been
# mutated, the mutation will reflect in all variables that point to this object, so also in `informal_greeting`,
# which becomes `{:a=>"hi there"}`.

=begin
Very good! This is really nice: "the mutation will reflect in all variables that point to this object"
=end

# #9. What does the following code output? Why? What concept is demonstrated?

def make_uppercase(string)
  string = string.upcase!
end

a = 'string'

puts make_uppercase(a)
puts a

# Lines 7 and 8 both output the String object `"STRING"` because the original object passed to the method at the time of
# its invocation, on line 7, `a`,  is mutated within the method by calling the destructive `upcase!` method on it.
# This method will permanently changed the caller and we can see this on the last line of this code, which outputs
# `"STRING"`.
#
# The concept represented here is `pass by reference` namely that operations in methods affect objects
# passed as arguments to those methods.
# # If an object passed to a method gets mutated, then the method acts like pass-by-reference with that argument.

=begin
Great, Ewa! Beautifully written. I have nothing to add.
=end

#10. What does the following code output? Why?

a = 'hamburger'

1.times do
  b = 'french fries'

  1.times do
    c = 'milkshake'

    puts a
    puts b
    puts c
  end

  puts a
  puts b
  puts c # error
end

puts a
puts b # error
puts c # error
#
# This code will cause `NameError`. The reason for this is `scope`. Blocks have their own inner scope, separate from
# the main (also called outer) scope.
#
# `c` is out of scope when passed to `puts` on line 16. This is because it has been initialized within the
# previous inner scope, the inner scope defined by the keywords `do..end` on lines 6-12. NESTED SCOPES do not CONFLICT
# and so `c` is not in scope on line 16 and Ruby cannot see it. As a consequence of this
# `undefined local variable or method `c' for main:Object (NameError)` is thrown and the program terminates. No
# code beyond line 16 is executed.
#
# =begin
# Ewa, you missed some of the output on this one. The output should be:
# hamburger
# french fries
# milkshake
# hamburger
# french fries
# [Untitled 32.rb:18](coderunner://Untitled%2032.rb#(174,1)!):in `block in <main>': undefined local variable or method
# `c' for main:Object (NameError)
# from Untitled 32.rb:5:in `times'
# from Untitled 32.rb:5:in `<main>'
#
# Have a look again at the various scopes. They are called "nested" scopes in the LS text.
# You are right that scopes do not "overlap" (In LS text they use the word "conflict").
# =end

