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
-define a  method with 2 arguments
-initialize a res variable to an empty array
-then push to the array second number and its mutliplications so like a * 1, a * 2, a * 3 and
 keep adding until the pre-defined size of the array is reached
-so I need a counter to be able to multiply a * 1, a * 2, etc.
- initialize counter variable to 1
- until the size of the array reaches the value of passed argument a, push into the result array the multiplied values of b argument
return that array

Code
=end
def sequence(a, b)
  res = []
  counter = 1
  until res.size == a
    res << counter * b
    counter += 1
  end
  res
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []

puts " "

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

puts " "

def sequence(a, b)
  res = []
  1.upto(a){ |number| res << (number * b) }
  res
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []

puts ""
# ls solution
def sequence(count, first)
  sequence = []
  number = first

  count.times do
    sequence << number
    number += first
  end

  sequence
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []

=begin
We initialize a sequence variable as an empty array and a number variable that
we set to the value of first, as it will be the first element of the sequence.

We then use the Integer#times method. It will execute the content of the block
the number of times specified by the integer. In this case, on each iteration,
we first append number to our sequence array and then increment number by the value of first.
When all iterations are completed, the sequence array contains all the elements
needed and we just have to return it.
=end

puts ""

def sequence(count, first)
  (1..count).map { |value| value * first }
end
=begin
This solution is more concise, and maybe more difficult to parse.
First we create a Range from 1 to count, as we realize that the array our method needs to return
will have that many elements in it.
Note that ranges have access to Enumerable methods, such as map.
You don't need to convert it to an array before, it will be treated as one.
Let's look at a simple example:

(1..5).map { |num| num }
#=> [1, 2, 3, 4, 5]

Within the block we then simply multiply the index (that is, each number of the range)
by the sequential multiplier which gives us our value for each position in the array.
=end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []
