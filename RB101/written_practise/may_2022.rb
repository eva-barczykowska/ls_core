def fix(value)
  value = value.upcase
  value.concat('!')
end
s = 'hello'
t = fix(s)

What does the following code return? What does it output? Why?
What concept does it demonstrate?

On line 5 we define a local variable s and point it to a String object 'hello'.
On line 6 we invoke the fix method and pass s in as an argument.
The question is whether or not the fix method will mutate the value of s.

So when we define our fix method and pass in s as a parameter on line 1,
both s and value are pointing to the same object in memory.

However on line 2 we reassign the method-scoped local variable value to the return value of
calling upcase on the object initially referenced by value, namely
the string hello, this call method returns a new string object, HELLO,
which value gets reassigned to/which gets assigned to value.
So before line 2 value was ‘hello’ and after line 2 value is ‘HELLO.’
Because method scoped variable value and locally scoped
variable s are now pointing to entirely different objects, whatever will happen
to value further on, will not affect s.

Further on, on line 3 we use the destructive method concat and pass it '!'
as a parameter. Destructive methods change object in place so our HELLO becomes
HELLO! and HELLO! is what the fix method returns.

Whatever we did in the fix method did not affect s because on line 2,
within the method, we reassigned the method-scoped local variable value that was
pointing to main-scoped local variable 'hello', to point to a different object
so s remains unchanged and still points to the string 'hello'.

As for the line 6, here we assign the return value of the fix method to the
main-scoped local variable t. If we print t, it will output 'HELLO!'.

This code demonstrates the concept of Variables as Pointers,
specifically Pass by reference.
26 min.









a = "Hello"

if a
  puts "Hello is truthy"
else
  puts "Hello is falsey"
end

Line 1 initializes main-scoped local variable a to the String object 'Hello'.
Lines 3 through 7 make up a conditional statement that will output
"Hello is truthy" if the value of a is truthy and "Hello is falsey" if
the value of a is false or nil.

The code will output "Hello is truthy" because a is truthy. In Ruby everything
is truthy except false and nil. The code will return nil because the last
evaluated expression contains a call the the puts method and puts always returns
nil.

The concept demonstrated here is truthiness.
