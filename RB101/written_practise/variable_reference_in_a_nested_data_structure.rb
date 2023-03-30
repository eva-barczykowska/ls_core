# Variable Reference in a Nested Data Structure

a = [1, 2]
b = [3, 4]

array = [a, b]
p array # outputs [[1, 2], [3, 4]]

a[0] = 0
p a #a = [0, 2]
p array  #[[0, 2], [3, 4]]

# Changes made to the object referenced by a variable inside the the inner collection
# will be reflected in the collection as a whole.
