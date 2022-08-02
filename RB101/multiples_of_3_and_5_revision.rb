=begin
Multiples of 3 and 5
Write a method that searches for all multiples of 3 or 5 that lie between 1
and some other number, and then computes the sum of those multiples.
For instance, if the supplied number is 20, the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

You may assume that the number passed in is an integer greater than 1.

PEDAC
Problem
-write a method that takes an integer
-the method then searches all the multiples of 3 and 5 that lie between 1
 and this number
-and then the method computes the sum of all those numbers

Example
multisum(20) = 98 #(3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20)

Data Structures
-input: integer
-output: integer

Algorithm
-initialize the `result` array
-create an array of numbers that are from 1 until the number
-look at each number and if it is divisible by 3 or 5 add it to the result array
-sum the result array and return the sum
=end

def multisum(int)
  result = []
  arr = (1..int).to_a
  arr.each do |num|
    result << num if num % 3 == 0 || num % 5 == 0
  end
  result.sum
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168


puts ""
=begin
Further Exploration:
Investigate Enumerable.inject (also known as Enumerable.reduce),
How might this method be useful in solving this problem?
(Note that Enumerable methods are available when working with Arrays.)
Try writing such a solution. Which is clearer? Which is more succinct?
=end

def multisum(int)
  result = []
  (1..int).to_a.each do |num|
    result << num if num % 3 == 0 || num % 5 == 0
  end
  result.inject(:+)
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168

puts ""

def multisum(int)
  (1..int).to_a.select{ |num| num % 3 == 0 || num % 5 == 0 }.inject(:+)
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168
