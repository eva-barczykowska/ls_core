# https://www.thoughtco.com/making-deep-copies-in-ruby-2907749
a = 1
b = a
a += 1
puts b

puts
a = [1,2]
b = a
a << 3
puts b.inspect

puts
#This is not the same as the previous example, changes made to a are reflected in b, but why? This is because the
# Array object is not a POD type. The assignment operator doesn't make a copy of the value, it simply
# copies the reference to the Array object. The a and b variables are now references to the same Array object,
# any changes in either variable will be seen in the other.
#
# And now you can see why copying non-trivial objects with references to other objects can be tricky.
# If you simply make a copy of the object, you're just copying the references to the deeper objects,
# so your copy is referred to as a "shallow copy."

a = [1,2]
b = a.dup
a << 3
puts b.inspect

a = [ [1,2] ]
b = a.dup
a[0] << 3  # see this line and line 44
puts b.inspect

#The Array#initialize_copy method will indeed make a copy of an Array, but that copy is itself a shallow copy.
# If you have any other non-POD types in your array, using dup will only be a partially deep copy.
# It will only be as deep as the first array, any deeper arrays, hashes or other objects will only be shallow copied.
#
# There is another method worth mentioning, clone. The clone method does the same thing as dup with one important
# distinction: it's expected that objects will override this method with one that can do deep copies.
#
# So in practice what does this mean? It means each of your classes can define a clone method that will make a deep copy
# of that object. It also means you have to write a clone method for each and every class you make.

# marshalling
# "Marshalling" an object is another way of saying "serializing" an object. In other words, turn that object into
# a character stream that can be written to a file that you can "unmarshal" or "unserialize" later to get the same object.
# This can be exploited to get a deep copy of any object.

a = [ [1,2] ]
b = Marshal.load( Marshal.dump(a) )
a[0] << 3
puts b.inspect

#What has happened here? Marshal.dump creates a "dump" of the nested array stored in a. This dump is a binary character
# string intended to be stored in a file. It houses the full contents of the array, a complete deep copy. Next,
# Marshal.load does the opposite. It parses this binary character array and creates a completely new Array,
# with completely new Array elements.
#
# But this is a trick. It's inefficient, it won't work on all objects (what happens if you try to clone a network
# connection in this way?) and it's probably not terribly fast. However, it is the easiest way to make deep copies
# short of custom initialize_copy or clone methods. Also, the same thing can be done with methods like to_yaml or to_xml
# if you have libraries loaded to support them.