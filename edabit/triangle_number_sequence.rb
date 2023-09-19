=begin

This Triangular Number Sequence is generated from a pattern of dots that form a triangle.
The first 5 numbers of the sequence, or dots, are:
  1, 3, 6, 10, 15

This means that the first triangle has just one dot, the second one has three dots, the third one has 6 dots and so on.

Write a function that returns the number of dots when given its corresponding triangle number of the sequence.
Input: a number
Output: a number

R:
- triangular number sequence is generated from a patter of dots
- the dots for a triangle

- the first 5 number of the sequence are 1, 3, 6, 10, 15
1+2 = 3
3+3 = 6
6+4 = 10
10+5 = 15
15+6=21

- start number from 1,
- the number to add is 2 and it gets increased by 1 with each iteration

A:
-in the loop do while the nubmer <= arg
-start always with number 1
-increase by number_to_increase = 2

-increase number_to_increase

=end

def triangle(num)
  number = 1
  increase_by = 2

  while increase_by <= num
    number += increase_by
    increase_by += 1
  end

  number
end
p triangle(1) == 1

p triangle(6) == 21

p triangle(215) == 23220