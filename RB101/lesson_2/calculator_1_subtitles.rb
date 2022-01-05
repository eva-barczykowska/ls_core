text = "

hi there in this video we're going to


create a very simple


calculator application so the first


thing we'll do


is we'll create a file let's call a


calculator




and when we switch back to the editor we


will open up the


file which is created and write our code


here before we start writing the code


we should get in the habit of using some


pseudo code to write the general


flow of the application this one in

particular is going to be very easy



so here we have the general steps that


we're going to take

to write this very simple program we

won't worry about

any sort of validations or fancy logic


yet and we'll be relying on our basic


ruby knowledge to write this program


there's two methods that we're going to


use the first

is a method called gets which is going


to pause the


program and wait for the user to type

something and then hit the enter key


so whenever the program execution gets

to the gets

method that will happen so if we were to

just run this application right now

execution would stop wait for the user

to input something hit the enter

key and then the program will end we can

run our


program like this and you can see when i


hit enter to run this program


it just pauses waits for me to write


type something


i can hit the enter key and i'm exited

the program

so going back to our code what we

usually want to do is


capture whatever the user typed in into

some sort of variable

so something like this and then we can

display it

we'll use another method called puts


to display whatever the user typed in

and then our program will end so i'll

run it again

you can see once again it's waiting for

me to type something in

i'll type hi there it captures my input

then prints it out

and the program finishes now just in

this two lines of ruby code

there's a lot of ruby syntactical sugar

behind the scenes here

so the first is that when we invoke a

method

in ruby visually it doesn't look any

different

than a variable that's because in ruby

parentheses are optional when invoking a

method call

so this is the same as just calling gets

and same thing with puts

answer is a parameter we're passing into

the puts method

so this code will run the same

another stylistic difference is that the

gets and puts method looks like

they're out in space but they're

actually in a module

called kernel

and just to be clear we'll be calling

the gets and puts

method like this in this program and

once again if we were to run this

program

you can see it behaves the same and back

at our code if we were to look at our

code it's very easy to see at a glance

what's a variable what's a method call

and where the methods live

okay knowing this information it's very

easy for us to construct this little

program then


so the first you want to do is just

welcome people



and then we want to prompt the user for

a number

and we'll save the input into a variable

called number one

and then let's print out this number

just so we can see it

what's the first number looks great if i

type four you'll see the four

printed out everything looks okay

however if i were to do something like

this

and i wanted to put an exclamation mark

at the end here

you can see that something's not quite

right the exclamation mark appears below

where we want it to be what's going on

here

let's take a closer look by using

the inspect method that all ruby objects



have

so this output is from the inspect call

and you can see

that the new line character is included

with the user input so in other words

that is the interval return key

the way to get rid of this is to call

chomp

on number one if we look at the

ruby documentation for chomp all string

objects in ruby have this method

and if you call it it will return a new

string without the white space

characters

so in our code whenever we want to use

number one we can basically call chomp

on it

and i'll include the parentheses just to

show that it's a method

invocation same thing with inspect

and you can see here that the new line

character is no longer there

because we called chomp on it now the

problem is that the new line character

is still

part of the number one variable in other

words

we did not modify the number one object

so we have to call chop whenever we use

the number one

variable if we know for sure that we

want to get rid of the new line

character everywhere which

is the case here we can just append it

to gets

and then let's take a look at our number

one

variable

you can see here that the neutron

character is gone and we can do this

because

gets returns a string this returns a

string

we perform chomp on that string which

returns another string

which is set to the number one variable

so now we can be sure


that the number one variable contains a

number

specifically a string without the new

line character

so we'll repeat this process to capture

the second number

and we'll call this variable number two

and just a quick

sandy to check

we'll take a look at both of those


numbers real quick


first number we'll say three second


number eight


and it's three and eight so now we're on


step number three which asks


for an operation to perform on these two


numbers


so we'll say one's add


and forwards divide and just like before


we'll capture the operation in a


variable


called operator


and now we have two numbers and operator


and we can

now perform the operation so all we have


to say is if operator


is one now all inputs are going to be


strings so we have to remember to put

0:08:32.000,0:08:35.440
a string representation of one here if


we were to say one


this will never be true even if you type

one


and we want to capture the result in a


variable so we can display it



and just for testing we'll stop right

here


so we'll run it what's the first number


three


second number five and only one works


so we'll add we'll say the result is 35


and the reason is because it performed


stream concatenation


as opposed to arithmetic another


interesting thing is you can see that

the result


variable here was initialized within the


if condition


because the if condition does not create


a block the variable is actually visible


outside the if condition


if you're unsure you could always

initialize


the result variable outside if condition

but this is unnecessary


so back to our problem of working with


integers as opposed to working with


string


we have to convert the numbers to

integers


in order for ruby to understand the plus

operator here


means adding as opposed to string


concatenation


back to our ruby documentation all

strings in ruby have

a 2i method that we can call on it which

will convert


that string to the integer


representation


and you can see that this is a very

simple method to use


but it's actually quite powerful in that


it can convert to different bases


and sometimes it can be very dangerous


too converting


strings that are obviously not integers


yet returning a valid integer


in our case however it's a perfect use


case so

we have a string here and we can call


2i on this and if we run it


the result is 11. that's exactly what we

need


now you might be wondering why we don't


call 2i immediately


just like we did chomp here when we


actually get the value from the user


we'll talk about that in a little bit


and again just because there are these

are method calls

i'll add parentheses to the end now

let's handle the subtraction


case

if it's two


it's basically the same operation here


except we're going to


subtract


and we'll go one step further and do


operator


and this is going to be multiply and we


won't do


division yet division is sort of a


special case


so we'll save this for division so we'll


run our program again

and now we can subtract so we'll say 2


and the result is 2. so subtraction


works


let's try multiplying

3 is multiply and the result is 24. so


that's great


but as we think about division we can't


simply just do


this like we did before because ruby


like


most other programming languages only


performs energy division


when working with integers in other

words it will not return the decimal


value


so for example if we were to leave the


code like this

and we say 7 and 2


and we're going to do division so we're


expecting 3.5 here


but instead what we get is 3 because

ruby considers this integer division


and omits the decimal values in order to


get what we want which is 3.5 we have to


convert these numbers to floats


so 2f will do that for us and once again


this method is also in the ruby


documentation so 2f

converts the string to the float

representation


and now because we're doing float

division it will return


3.5 first number 7 second number is 5


2 and we will divide and the result is

3.5"
text_with_no_spaces = text.squeeze(' ').gsub!("\n", " ").gsub!("   ", " ").strip
# .gsub('\n',' ')
text_with_no_spaces
p text_with_no_spaces
