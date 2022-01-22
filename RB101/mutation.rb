array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

#What will the following code print, and why?
# Don't run the code until you have tried to answer.

On line 1 we initialize a variable array1 and make it reference an array of
strings. On the line 2 we initialize another variable, array2, which is at
this point empty. On line 3 we call the .each method on array1 and append all
its elements to array2. Now, this means that array 2 contains the same elements
as array 1. How do we actually know that array1's and array2's elements are
referencing the same objects? This can be verified by by calling the
.object_id method on each of those elements, e.g. array1[0].object_id,
  array2[0].object_id, etc. Both object_ids will be same. So at this point
  we have 2 different array objects referencing the same string objects.
  If the strings that array1 and array2 contain are referencing the
  same objects, then if we mutate them through any of the arrays
  (array1 or array2), the effect should be seen in both arrays
  (coz they are same objects!). This is exactly what happens on line 4,
  where we mutate some of the elements of array1 (on condition that they
  start with 'C' or 'S'). Since we mutated the objects in array1 but we know
  that array1 and array2 point to the same objects, we can expect that the
  objects mutated in array1, will be also mutated in array2.
  ***Being unfamiliar with this concept can get us into trouble when we
  refer to same objects in different parts of our code and then we decide
  to mutate those objects in one place but forget that they will be
  actually mutated everywhere where they're referenced.
