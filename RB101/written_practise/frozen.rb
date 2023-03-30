string = 'hello'
string.freeze
# string << 'world' # results in FrozenError because string is frozen
#
p string.frozen?

p 1.frozen? # returns `true` because `1` is an integer and therefore immutable object

array = ["apple", "book", "car", "dog"]
array.freeze # array as a whole is frozen but not its elements
array[0] << 'sss'
# array[0].upcase!
p array

# Outputs ["applessss", "book", "car", "dog"]
# because the individual elements of the array are not frozen and can therefore be mutated.
#
# HOWEVER CALLS SUCH AS
# array << "ear" # So when an element is already there, we can mutate it but we cannot add a new element because array as a whole is frozen
# array[0] = 'ant'
# array.push("Ewa")
# array.unshift("Chris Rock")
# array.shift(2)

# will result in FrozenError






