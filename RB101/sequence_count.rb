=begin
Sequence Count
Create a method that takes two integers as arguments.

The first argument is a count, and the second is the first number of a sequence
that your method will create. The method should return an Array that contains
the same number of elements as the count argument, while the values of each
element will be multiples of the starting number.

You may assume that the count argument will always have a value of 0 or greater,
while the starting number can be any integer value.
If the count is 0, an empty list should be returned.


PEDAC
Problem
-write a method
-the method takes 2 integers as arguments
-the first integer/argument tells me how many elements the array that I'm going to return will have
-the second integer/argument is what will be multiplied by itself and inserted as an element of the array, starting with itself
so if the second argument is -7, -7 will be the first elelement of the array, 1st out of 4 if 4 was the first argument
so our returned array will be [-7, -14, -21, -28]

Examples
sequence(5, 1) == [1, 2, 3, 4, 5]
sequence(4, -7) == [-7, -14, -21, -28]
sequence(3, 0) == [0, 0, 0]
sequence(0, 1000000) == []

Data structures
-input: 2 integers
-output:an array

Algorithm
define a  method with 2 arguments
then add to the array second number and its mutliplications so like a * 1, a * 2, a * 3
keep adding until the pre-defined size of the array is reached
so I need a counter to multiply these numbers
initialize counter variable
make the first argument as size of the array
iterate though numbers up to the size of the array so if the size is 4, then 0.upto(3)
place multiplied 2nd argument in the array
return that array

Code
=end

def sequence(first, second)
  res = []
  counter = 1

  while res.size <= first - 1
    res << second * counter
    counter += 1
  end
  res
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []
