# // ###################################################
# // What does the following code return? What does it output? Why? What concept does it demonstrate?
# // def change_name(name)
# //   name = 'bob'
# // end

# // name = 'jim'
# // change_name(name)
# // puts name


# // ######################################################
# // What does the following code return? What does it output? Why? What concept does it demonstrate?
# // a = %w(a b c)
# // a[1] = '-'
# // p a



# // ########################################################
# // What does the following code return? What does it output? Why? What concept does it   demonstrate?
# // def add_name(arr, name)
# //   arr = arr + [name]
# // end

# // names = ['bob', 'kim']
# // add_name(names, 'jim')
# // puts names



# // ###########################################################
# // What does the following code return? What does it output? Why? What concept does it   demonstrate?
# // array = [1, 2, 3, 4, 5]

# // array.select do |num|
# //    puts num if num.odd?
# // end

# // ###########################################################
# // What does the following code return? What does it output? Why? What concept does it demonstrate?
# // arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# // new_array = arr.select do |n|
# //   n + 1
# //   puts n
# // end
# // p new_array

# // #############################################################

# // What does the following code return? What does it output? Why? What concept does it demonstrate?
# // a = "hello"

# // [1, 2, 3].map { |num| a }

# // ###############################################################
# // What does the following code return? What does it output? Why? What concept does it demonstrate?
# // def test
# //   puts "written assessment"
# // end

# // var = test

# // if var
# //   puts "written assessment"
# // else
# //   puts "interview"
# // end

# // #####################################################
# // What does the following code return? What does it output? Why? What concept does it demonstrate?
# // def fix(value)
# //  value[1] = 'x'
# //  value
# // end

# // s = 'abc'
# // t = fix(s)

# // What values do `s` and `t` have? Why?

############################## Raul #############################################

=begin
###################################################
#What does the following code return? What does it output? Why? What concept does it demonstrate?

def change_name(name)
  name = 'bob'
end

name = 'jim'
change_name(name)
puts name


in line 3 we define a method called 'change_name' which takes a parameter called name, within the body of that method we initialize a local
variable called `name` to the string object 'bob'.

in line 7 we initialize a variable called 'name' to the string object 'jim'. On line 8 we call the change_name method on 'name'.
on line 9 we pass 'name' as an argument to the puts method which returns 'nil' and outputs 'jim'. it outputs 'jim' and not 'bob'
because of variable shadowing, name is still pointing to 'jim' #(?)
 this demonstrates variables as pointers and variable shadowing

1 # # you were incorrect about the concept demonstarted in this example

######################################################
What does the following code return? What does it output? Why? What concept does it demonstrate?

a = %w(a b c)
a[1] = '-'
p a

in line 1 we initialize the local variable 'a' to an array object containing 3 string elements 'a', 'b' and 'c'
in line 2 we use indexed assignment to change the value of the objects at index 1 to '-'
in line 3 we pass 'a' as an argument to the `p` method which returns ["a", "-", "c"] which is the equivalent of
calling the inspect method on 'a' and outputs ["a", "-", "c"]
  this snippet demonstrates indexed assignment and object mutation and mutating methods. in Particular how index assignment mutates the array it is called on

2


########################################################
What does the following code return? What does it output? Why? What concept does it   demonstrate?

def add_name(arr, name)
  arr = arr + [name]
end

names = ['bob', 'kim']
add_name(names, 'jim')
puts names

in line 1 we define the method `add_name` which takes two parameters, arr and name. within the body of the method we assign arr to the
value of adding name to arr.
in line 5 we initialize the variable names to an array object containing two strings: 'bob' and 'kim'
on line 6 we call the add_name method and pass it 'names' and 'jim' as an argument.
on line 7 we call the puts method and pass it names as an argument. it returns nil because puts always returns nil
and it outputs ['bob', 'kim'] because the method returns a new array but doesnt mutate the original array 'names' #(?)
this code snippet demonstrates mutation and variables as pointers

2 # you were incorrect about the concept demonstarted in this example

###########################################################
What does the following code return? What does it output? Why? What concept does it   demonstrate?

array = [1, 2, 3, 4, 5]

array.select do |num|
   puts num if num.odd?
end

in line 1 we initialize the variable 'array' to an array containing integers from 1 to 5

in line 3 we call the select method on 'array' and pass it a block denoted by the keywords do..end, we give it a block parameter 'num'
in line 4, within the block, we call the puts method on num but only if num is an odd number with a conditional if statement.
  this code would output 1, 3 and 5 but would return an empty array since puts is always nil and no number would be selected.


this snippet demonstrates selection. In partcular, how the `select` method uses the truthiness of the block's return value to select elements from the caller array that would be passed to the new array returned by select.

2 # because you need to be explicit about how a method works and whether or not it has any side effect.

###########################################################
What does the following code return? What does it output? Why? What concept does it demonstrate?
=end
# arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# new_array = arr.select do |n|
#   n + 1
#   puts n
# end
# p new_array

=begin
in line 1 we initialize a variable 'arr' to an array object containing integers frop 1 to 10
in line 3 we initialize a variable 'new_array' to the return value of calling the select method on arr and passing it a block denoted
by the keywords do..end, with a block paramenter 'n'. within the block of the select method we call the '+' method on 'n' and pass it 1
  as an argument and then call the puts method and pass it 'n' as an argument.
/
What the method(select) does with the return value
/

on line 7 we call the 'p' method on new_array.
the block of the select method would output every number of the original array + 1 # incorrect. but would return nil every time so no number would
be selected. As consequence line 7 would output an empty array '[]' and also return an empty array '[]'
this snippet demonstrates selection.

1 # you didn't run the code to know what it outputs, the assumption you made was incorrect and the summary section didn't explicitly explain how select works.
#############################################################

What does the following code return? What does it output? Why? What concept does it demonstrate?
a = "hello"

[1, 2, 3].map { |num| a }

in line 1 we initialize the variable 'a' to the string object 'hello'
in line 3 call the map method on an array containing integers from 1 to 3 and pass it a block denoted by {..} with 'num' as a block parameter
and the variable 'a'. the map method return ["hello", "hello", "hello"] as it would transform the value to the value that a points to over each iteration.
the code would output nothing since its not being asked to output anything.

this code demonstrates transformation. In particular, how the `map` method returns a new array that contains elements that represent the return value of the block at each iteration.
passes the return value of the block at each iteration to the new array returned by map

2
###############################################################
What does the following code return? What does it output? Why? What concept does it demonstrate?
=end
def test
  puts "written assessment"
end

var = test  # nil

if var #=> nil
  puts "written assessment"
else
  puts "interview"
end
=begin

in line 1 we define a method 'test' and within the body of the method we call puts and pass it a string as an argument
in line 5 we initialize the variable 'var' to the value of calling the 'test' method, which return `nil`.
in line 7 we start an if/else conditional statement which will output 'written assessment' if var is truthy and 'interview' if its not.
the code would output "written assessment" since var is truthy and return 'nil' since calling the puts method always returns 'nil'

var points to `nil` as a result of invoking test and we know that `nil` is a falsy value as a result, execution will move to the next conditional branch `else` and `interview` will be output and `nil` returned.

0.
####################################################
What does the following code return? What does it output? Why? What concept does it demonstrate?


def fix(value)
 value[1] = 'x' # mutates the value/object that `value` points to
 value
end

s = 'abc'
t = fix(s)

What values do `s` and `t` have? Why?

on `lines 1-4` we define a method 'fix' with a parameter 'value'
within the method's body we use indexed assignment to assign 'x' to the value at index one of the input value.

then it returns that value
in line 6 we initialize the variable 's' to the string object 'abc'.
in line 7 we initialize the variable 't' to the return value of calling the fix method and passing it the value that 's' points to as an argument.
both 's' and 't' have 'axc' as a value, since we used index assignment to replace an element within the string causing to be mutated and as a result both s and t
were pointing to the same string the change affected both.

this code snippet demonstrates variables as pointers and mutation.
2


=begin


Ewa
###################################################
# What does the following code return? What does it output? Why? What concept does it demonstrate?

def change_name(name)
  name = 'bob'
end

name = 'jim'
change_name(name)
puts name

This code demonstrates the concept of reassignment and variable scoping rules in Ruby.
On line 7 we declare a locally scoped variable referencing String object 'jim'.
On line 8 we call the change_name method, which is defined on lines 3-5.
When we invoke the method, we pass it as an argument the object that the variable 'name' is poiting to.
So on line 2 both, method scoped variable `name` and locally scoped variable `name` point to the same object in memory.
However, in the body of the method, on line 3 we change where the method scoped variable `name` is pointing to, now it is pointing to another String object,
'jim'. So this method returns 'jim'. But the method did not change the value of the locally scoped variable so `name`` stays same,
the code on line 9 will output 'jim' and return `nil`.

3


######################################################
What does the following code return? What does it output? Why? What concept does it demonstrate?
a = %w(a b c)
a[1] = '-'
p a

On the first line we initialize an array of 3 String object elements, using synctactical sugar expression %w().
On the 2. line we use the Array[]= method to take the second element of the array and point it to another String object.

On line 2, we use Array[]= method to replace the element at index position 1 with anew string value `-`. This is a mutating operation that mutates the array. it does not mutate the element at index `1`, because that element gets replaced.
second_element = 'b'

a = ['a', second_element, 'c']
a[1] = '-'
p a  # ['a', '-', 'c']
p second_element # 'b'


The []= method is mutating so the 'b' String object changes to '-',
and the last line will output ['a', '-' 'c'] and return ['a', '-' 'c'].

This code represents the concept of mutation.

2


########################################################
What does the following code return? What does it output? Why? What concept does it   demonstrate?

def add_name(arr, name)
  arr = arr + [name]
end

names = ['bob', 'kim']
add_name(names, 'jim')
puts names

On line 4 we initialize a names variable referencing an Array object with 2 elements.
On line 5 we invoke the add_name method and pass it the names array and the String object 'jim' as arguments.
Within the method body we reassign the method scoped `arr`` variable to point to result of concatening the array obj that the `arr`` originally referenced and the array object that contains the value that the name variable points to, namely 'jim'. So what the method returns is
['bob', 'kim', jim] but (whatever happened in the method)that does not change the locally scoped variable names and when we pass it to the puts method as an
argument on the last line, it prints ['bob', 'kim'].

This code demonstrates the concept of reassignment, variables as pointers and `add_name` as a non-mutating method.

2
###########################################################
What does the following code return? What does it output? Why? What concept does it   demonstrate?
array = [1, 2, 3, 4, 5]

array.select do |num|
   puts num if num.odd? # 1, 3, 5, the return value of the block is `nil`
                        # 2, 4 for which odd returns false, the return value of the block is `nil`
end

On the 1. line we initialize an array object with 5 elements.
On the 2. line we call select method on this object. The select method takes a block, delimited by the words do..end.
The block takes a block parameter, num in this case. When the select method is invoked, each element of the array will
be passed in turn to the block and the block will decide whether to output that element or not. To decide, it calls the .odd?
method on every element. If the element is odd, it will be output, if not, it will not be output.
Select returns a new array with elements selected according to the thruthiness of the return value of the block. The return value of the block
is in this case nil (because the puts method always returns nil) so this code will output in turn 1, 3, 5 and return an empty array.
This code demonstrates the concept of selection.

3

###########################################################
What does the following code return? What does it output? Why? What concept does it demonstrate?
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.select do |n|
  n + 1
  puts n
end
p new_array

On line 1 we initialize an array Object with 10 Integer elements.
On line 3 we initialize a new_array variable and point it to the return value of the select method
called on the array initiliazed on line 1. The select method takes a block delimited by the words do..end.
The block takes a parameter n and within the block body 1 is added to n and on a subsequent line n is being output.
# This code will output all the numbers from (2 to 11 => 1 to 10) in because each element of the original array will be taken, 1 will be added and the
# result will be output.
When we print the new_array variable on line 7, it will ouput an empty array, because select chooses elements based on the truthiness of the block's
return value, if the return value of the block is truthy, then element is selected. The return value of the block is
its last line and here it is a call to the puts method, where n is passed as an argument. Puts always return nil and nil is falsy or nil evaulates to false in Ruby
so none of the elemnts will be selected and the last line will produce an empty array.
This code demonstrates the concept of truthiness.

// 2

#############################################################

What does the following code return? What does it output? Why? What concept does it demonstrate?
a = "hello"

[1, 2, 3].map { |num| a }

This code demonstrates the concept of transformation. Map is called on an array of 3 elements, a block is passed to map and within the block, a block variable num
is defined. Map is a non-mutating method, it returns a new array, with its elements transformed according to the retun value of the block.
Each time block is called, it will take each time an element of the array and transform it into a.
So this code will return an array of 3 strings ['hello', 'hello', 'hello'].


1
###############################################################
What does the following code return? What does it output? Why? What concept does it demonstrate?
=end
def test
  puts "written assessment"
end

var = test

if var
  puts "written assessment"
else
  puts "interview"
end

p test.object_id
p var.object_id

=begin
This code demonstrates the concept of variables as pointers and also truthiness/falsiness.
On line 4 we point the var variable to the same place in memory as the return value of the test method invocation is pointing to.
Subsequently we are using a conditional statement and saying if the variable var is pointing to a truthy object/evaluates to true, then a string
'written assessment' will be printed, else the string 'interview' will be printed.
Since the return value of the test method is nil(because a return value of the method is its last line if there is no explicit return and the last line
of this method contains a call to puts, which always returns nil) and nil is falsy in ruby, this code will output  the string 'interview' and return nil.

2
#####################################################
What does the following code return? What does it output? Why? What concept does it demonstrate?
def fix(value)
 value[1] = 'x'
 value
#  puts 'Bob is fat' # `nil`
end

s = 'abc'
t = fix(s)

What values do `s` and `t` have? Why?
This code demonstrates the concept of mutation.
On line 6 we initialize a locally scoped variable s referencing a String object 'abc'
On line 7 we pass the object that the variable points to as an argument to the fix method.
Within the body of the method we use the String []= method in order to change the value of
the second character of the string. the []= is mutating so it will change the object in place.
So the last line of this code initialized a variable t pointing to the return value of the fix method.
The return value of this method is the last evaluated expression, which is 'axc'. However this method is mutating, so
the value of s will also be changed and now it points to 'axc'.

score: 3.
=end


# Raul  12/24 => 50% ~=> 90 %
# Ewa   18/24 => 75% ~=> 90 %


#########################################################################

Examine the code example below. The last line outputs the String 'Hi'
rather than the String 'Hello'. Explain what is happening here and identify
the underlying principle that this demonstrates.

greeting = 'Hello'

loop do
  greeting = 'Hi'
  break
end

puts greeting

*** remember to write in paragraphs

The local variable greeting is assigned to the String 'Hello' on line 1.
The do..end alongside the loop method invocation on lines 3 to 6 defines a block,
within which greeting is reassigned to the String Hi on line 4.
The puts method is called on line 8 with the variable greeting passed to it
as an argument; since greeting is now assigned to 'Hi', this is what is output.

This example demonstrates local variable scoping rules in Ruby;
specifically the fact that a local variable initialized outside of a block is
accessible inside the block.

def a_method
  puts "hello world"
end

The method invocation outputs the string hello world, and returns nil.

greeting = 'Hello'

Most of the Launch School material describes this statement as:

The greeting variable is assigned to the string 'Hello'.

or:

The string 'Hello' is assigned to the greeting variable.
Choose one of these 2 above and be consistent.

In Ruby, false and nil are FALSEY or we can say: EVALUATE AS FALSE
everything else is TRUTHY or EVALUATES AS TRUE in a boolean context

This is different to being TRUE or FALSE

a = "Hello"

if a
  puts "Hello is truthy"
else
  puts "Hello is falsey"
end

 * a evaluates as true/evaluates to true in the conditional statement and so 'Hello is truthy' is output
 -- would be a correct answer

 * a is truthy and so 'Hello is truthy' is output
 -- would also be correct a correct answer
