=begin
A triangle is classified as follows:

right - One angle of the triangle is a right angle (90 degrees)
acute -  All 3 angles of the triangle are less than 90 degrees
obtuse - One angle is greater than 90 degrees.

To be a valid triangle, the sum of the angles must be exactly 180 degrees, and all angles must be greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

Write a method that takes the 3 angles of a triangle as arguments, and returns a symbol :right, :acute, :obtuse, or :invalid depending on whether the triangle is a right, acute, obtuse, or invalid triangle.

You may assume integer valued angles so you don't have to worry about floating point errors. You may also assume that the arguments are specified in degrees.

Problem
right - One angle of the triangle is a right angle (90 degrees)
acute -  All 3 angles of the triangle are less than 90 degrees
obtuse - One angle is greater than 90 degrees.

-to be valid, the sum of the triangle angles must be 180
-all angles must be greater than 0
-if the above not satisfied, return :invalid

-method takes 3 integers, 
-method returns a symbol :acute, :right, :obtuse, :invalid

Examples:
triangle(60, 70, 50) == :acute
=>all 3 are < 90

triangle(30, 90, 60) == :right
=> 1 is 90 

triangle(120, 50, 10) == :obtuse
=> 1 is greater 

triangle(0, 90, 90) == :invalid
=>1 angle that is 0

triangle(50, 50, 50) == :invalid
=> sum is not 180

DS 
input: 3 integers
output: a symbol

Algorithm
-return :invalid if sum of all 3 triangles is not exactly 180
-return :invalid if any of the 3 triangles == 0

-if 1 triangle is greater than 90
-return :obtuse
-elsif 1 triangle is 90, return :right
-elsif all 3 angles are less than 90
- return :acute

=end
def triangle(int1, int2, int3)
  angles = [int1, int2, int3]

  return :invalid if angles.sum != 180 || angles.any? { |a| a == 0 }

  if angles.one? { |a| a > 90 }
    return :obtuse
  elsif angles.one? { |a| a == 90 }
    return :right
  elsif angles.all? { |a| a < 90 }
   return :acute
  end

end
p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid

#solve it with case statement

puts
def triangle(int1, int2, int3)
  angles = [int1, int2, int3]

  return :invalid if angles.sum != 180 || angles.any? { |a| a == 0 }
  
  case angles
  when angles.one? { |a| a > 90 }
    :obtuse
  when angles.one? { |a| a == 90 }
    :right
  when angles.all? { |a| a < 90 }
    :acute
  else
    :invalid
  end

end
p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid
