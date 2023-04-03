=begin
A triangle is classified as follows:

right: One angle of the triangle is a right angle (90 degrees)
acute: All 3 angles of the triangle are less than 90 degrees
obtuse: One angle is greater than 90 degrees.
invalid: sum of angles doesnt equal 180 or all angles < 0
To be a valid triangle, the sum of the angles must be exactly 180 degrees, and all angles must be greater than 0:
if either of these conditions is not satisfied, the triangle is invalid.

Write a method that takes the 3 angles of a triangle as arguments, and returns a symbol :right, :acute, :obtuse, or
:invalid depending on whether the triangle is a right, acute, obtuse, or invalid triangle.

You may assume integer valued angles so you don't have to worry about floating point errors.
You may also assume that the arguments are specified in degrees
=begin pedac

*************Problem********************
Overall goal: To write a method that takes 3 angles of a triangle in degrees, analyzes what type of triangle it is,
and returns a symbol (:right, :acute, :obtuse, :invalid)
initial input: 3 integers (angles of triangle)
overall output: one of 4 symbols

explicit requirements:
return values
:invalid sum of angles != 180 OR all angles < = 0
  :right: one angle == 90
  :acute: all 3 angles are < 90
  :obtuse: one angle > 90

implicit requirements:

questions:

**********Examples/Test cases************
triangle(60, 70, 50) == :acute
**  all 3 angles are < 90
triangle(30, 90, 60) == :right
** 1 angle is 90
triangle(120, 50, 10) == :obtuse
** 1 angle > 90
triangle(0, 90, 90) == :invalid
** one angle is 0, sum != 180
triangle(50, 50, 50) == :invalid
** sum != 180

*************Data Structure**************
3 integers > array > symbol

***************Algorithm*****************
Overall approach: initialize 'angle_array' to the 3 integers > if/else conditional > if branch if `angle_array` sum is not equal to 180 or if any angle is <= 0 then return :invalid > elsif branch if one angle == 90 then return :right > elisf branch if all angles < 90 return :acute > elsif one angle > 90 return :obtuse

=end

def triangle(ang1, ang2, ang3)
  angle_array = [ang1, ang2, ang3]

  if angle_array.sum != 180 || angle_array.include?(0)
    :invalid
  elsif angle_array.include?(90)
    :right
  elsif angle_array.all? {|angle| angle < 90}
    :acute
  else
    :obtuse
  end

end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid
p triangle(60, 60, 60) == :acute

#LS solution

def triangle(angle1, angle2, angle3)
  angles = [angle1, angle2, angle3]

  case
  when angles.reduce(:+) != 180, angles.include?(0)
    :invalid
  when angles.include?(90)
    :right
  when angles.all? { |angle| angle < 90 }
    :acute
  else
    :obtuse
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid
