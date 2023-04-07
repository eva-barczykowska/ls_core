### Mock exam ###
# 1. Indicate and explain the concept demonstrated here:
fruit = ['papaya', 'banana', 'pear', 'apple']

array.each do |fruit|
  fruit = fruit.upcase
end

p array

=begin

This code will not run and instead will raise a `undefined local variable or method
`array' for main:Object (NameError)` error message.

The reason for this is that on line 1 variable `fruit` is initialized and assigned to array object
`['papaya', 'banana', 'pear', 'apple']`, but on line 3, the `Array#each` method
is invoked on `array` and passed a `do..end` block as an argument - `array` has not been
initialized anywhere in the program, hence the error message.

The concept demonstrated here is that variables need to be initialized first before they
can be used in the program.
Very nicely explained: 100%
Remark: If you're pressed on time it would also be enough to say
---This code will not run and instead will raise a `undefined local variable or method
`array' for main:Object (NameError)` error message because `array` has not been initialized prior to line 3, where
we are trying to invoke the `each` method on it.---
I was expecting this kind of answer so I was pleasantly surprised by the accuracy of yours. You gave more details and it's
definitely to your benefit, however, I want to mention that for example the fact that a `do..end` block is passed to
each is not important, because calling `each` on `array` will throw the error so everything that comes after
doesn't really matter. Do you know what I mean?

Now, what to do? To give more details or less? The answer, as often is IT DEPENDS.
I think it depends on the time that we have so I think it's important to skim the questions first so that we have a brief
idea what to expect.
100%
=end


# 2. We were expecting last line of this code to output a string "SHAWN made a very good choice!".
# Why doesn't it? How to fix the code so it does output the expected result?

def congratulate_student(name)
  name = name.upcase
  name << " made a very good choice!"
end

student = "Shawn"
congratulate_student(student)

puts student

=begin
The reason this code does not output the string "SHAWN made a very good choice!",
is because within the method body on line 2, method parameter `name` is reassigned
to reference the return value of invoking `String#upcase` on `name`.

When the `congratulate_student` method is invoked on line 7 and passed the object
variable `student` is referencing as an argument, `student` and method parameter `name` reference the
same object. This connection is broken once `name` is reassigned in the method body.
--beautifully said!--

One way to fix it would be to use the MUTATING `String#upcase!` method on line 2
instead. `#upcase!` returns a reference to its calling object, which
effectively rebinds `name` to the object it was previously bound to when it is reassigned.
--beautifully said as well! I am copying how you said it because it's perfect--
100%

=end

# 2. This code produces an error, why?
# -2 > "22"

=begin
This code produces an error because we are trying to compare two objects of different
kinds - an integer with a string.
---suggestion, I would paste the error as well:`>': comparison of Integer with String failed (ArgumentError)---
---I would say "of different type/class to be more precise"
---Also, when you see the Argument error, you realize that the object passed as an argument to `>` is not accepted
by Ruby, this is because it needs an argument of the same type as the caller type (which is an Integer)
100%
=end

# 3.Can this operation be successful? Why?
# 15 + "15"

=begin
No, this operation cannot be succesful because the `Integer#+` method called on
integer `15` can only accept an integer object as an argument, and `"15"` is a string object.
Running this code will raise a `String can't be coerced into Integer (TypeError)` error message.
100%
=end

# 4. Can you describe how Ruby evaluates this?
!(15 == 15)

=begin
In order to evaluate this expression Ruby uses the "order of precedence" rules.
Ruby will first evaluate the code within the parentheses: `15 == 15` returns `true`
Then ruby will evaluate the `!` operator outside the parentheses: this means "not",
so the whole expression is "not `true`, in other words, it will return `false`.
100%
=end

# 5. What is the first stack frame of this code? (the frame Ruby starts with?)
def first
  puts "first method"
end

def second
  first
  puts "second method"
end

second

=begin
The first stack frame, in Ruby, is called the "initial stack frame" (sometimes
referred to as "main"). When Ruby reaches the method invocation on line 10,
it creates a new stack frame and places the `second` method on the top of the
call stack. So after the initial stack frame, method `second` is the next one.
---Hey, the question was only about the first stack frame. I was expecting one word: main. :-)
---also, if you want to be more precise, you could say "on top of the main frame (but call stack is of course correct)"
100%
=end

# 6. What's the return value of each line? What is this concept called?
# a.
nil && 55

# b.
"hey" || 55

=begin
In both these examples non-boolean, or "truthy" and "falsey", values are being compared to each other using
the logical operators `&&` and `||`. In this case, `&&` and `||` will return the value
that was last evaluated by the operator.

Because of short circuit evaluation, in the case of `nil && 55`, `nil` is returned.
This is because Ruby evaluates the operand to the left of the `&&` operator first
and sees that it returns a "falsey" value. It knows it doesn't need to evaluate the operand to the
right because both operands would need to be "truthy" in order for it to return a "truthy" value.

In the second example, again because of short circuit evaluation, the
expression `"hey" || 55` returns `"hey`. This is because `||` only needs to evaluate
one of its operands in order to return a value. Since "hey" is to the left of the
operator it is evaluated first.
---I meant the concept demonstrated here as short-circuit evaluation but you mentioned it here anyway so full points.
100%

=end
# 7. What is the value of adult here?
adult = "smokes" || 18

=begin
The value of `adult` is `"smokes"` because it is assigned to the return value
of the expression `"smokes" || 18`.
100%
=end

# 8. What does this line of code return?
a = 5
!!a
=begin
This code returns the boolean object `true`.
100%
=end

# 9. Write a code example for how Ruby acts like pass by value.
def pass_value(string)
  string = string.upcase
  puts string
end

name_it_x = "ex"

pass_value(name_it_x)
puts name_it_x
# 100%

# 10. Write a code example for how Ruby acts like pass by reference.

def pass_reference(string)
  string.upcase! << "!"
  puts "See: I am ACTING like pass-by-reference:#{string}"
end

name_it_x = "ex"

pass_reference(name_it_x)
puts name_it_x
# 100%
#
#
# Results:
# Checklist:
# 1. Are ALL questions answered? --- 100%
# 2. Is every answer given with precision? Is it correct? Is it accurate? Is it understandable? --- 100%
# 3. Are backticks used for variable or method names to make it easier to read? --- 100%
# 4. Are paragraphs used? --- 100%
# 5. Is spelling/grammar/syntax correct? --- 100% (spelling mistakes: 1 (typo in word: successful)

# Well done, Ilke! I think we're ready for the exam, what do you think?