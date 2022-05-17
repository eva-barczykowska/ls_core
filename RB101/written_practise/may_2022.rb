What does the following code return? What does it output? Why?
What concept does it demonstrate?

def fix(value)
  value = value.upcase
  value.concat('!')
end
s = 'hello'
t = fix(s)

On line 5 we define a local variable s and point it to a String object 'hello'.
On line 6 we pass invoke the fix method and pass s in as an argument.
The question is whether or not the method will mutate the value of s.

So when we define our fix method and pass in s as a parameter on line 1,
both s and value are pointing to the same object in memory. However on line 2
we reassign method scoped variable value to the return value of the upcase method.
value now points to HELLO. So now method scoped variablevalue and locally scoped
variable s are pointing to entirely different objects and whatever will happen
to value further on, will not affect s.  And further on, on line 3 we use
destructive method concat and pass it '!' as a parameter. Destructive methods
change object in place so our HELLO becomes HELLO! and HELLO! is whatever
the fix method returns.

Whatever we did in the fix method has not affected s because on line 2 ,
within the method, we reassigned the method scoped variable value that was
pointing to locally scoped variable 'hello' to point to a different object
so s remains unchanged and still points to the string 'hello'.

As for the line 6. here we assign the return value of the fix method to the
locally scoped variable t.  If we print t, it will output 'HELLO!'.
This code demonstrates the concept of Variables as Pointers,
specifically Pass by reference.
26 min.
