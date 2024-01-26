=begin
Create a function that returns true if the given circular areas are intersecting, otherwise return false. The circles are given as two arrays containing the values in the following order:

Radius of the circle.
Center position on the x-axis.
Center position on the y-axis.
Examples
isCircleCollision([10, 0, 0], [10, 10, 10]) ➞ true

isCircleCollision([1, 0, 0], [1, 10, 10]) ➞ false
Notes
You can expect useable input and positive radii.
The given coordinates are the centers of the circles.
We are looking for intersecting areas, not intersection outlines.
Check the Resources tab for help.
Resources:
https://www.youtube.com/watch?v=hYDRUES1DSM
https://www.geeksforgeeks.org/check-two-given-circles-touch-intersect/

# Problem
- returns true if the given circular areas are intersecting
Circle defined as
- Radius of the circle.
- Center position on the x-axis.
- Center position on the y-axis.

# Examples
isCircleCollision([10, 0, 0], [10, 10, 10]) ➞ true
10 - Radius of the circle.
0 - Center position on the x-axis.
0 - Center position on the y-axis.

10 - Radius of the circle.
10 - Center position on the x-axis.
10 - Center position on the y-axis.

Circle 1 [0,0]
Circle 2 [10,10]

100 + 100 = c **2
200 = c **2
c = 14.14
c/2 7.07
is c/2 less Radius?
- Return true if it true ( circles are intersecting)
- Return false otherwise (no overlap)


difference == 10 - 0, 10 -0
difference == 10,10
a = 10
b = 10
c

10
|
|
|
_______
10

a^2 + b^2 == c^2

isCircleCollision([1, 0, 0], [1, 10, 10]) ➞ false


# Data Structures
## Input - 2 Inputs
- 2 Arrays, both containing integers

## Output
- Boolean Value

## Intermediary
# Algorithm
 See how far the second and third elements are from eachother
 calculate c, for the hypoteneuse
 call half_hypoteneuse equal to half of hypoteneuse
 return true if half_hypoteneuse is less than radius

=end

def circle_collision? array_1_source, array_2_source
  # p array_1_source
  # p array_2_source
  a, b  = [(array_1_source[1] - array_2_source[1]).abs, (array_1_source[2] - array_2_source[2]).abs]
  # p a
  # p b
  hypoteneuse = Math.sqrt(a**2 + b**2)
  half_hypoteneuse = hypoteneuse/2
  half_hypoteneuse < array_1_source.first
end

p circle_collision?([10, 0, 0], [10, 10, 10]) == true
p circle_collision?([1, 0, 0], [1, 10, 10]) == false