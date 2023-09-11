=begin
A triangle is classified as follows:

equilateral: All 3 sides are of equal length
isosceles: 2 sides are of equal length, while the 3rd is different
scalene: All 3 sides are of different length
To be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of the longest side, and all sides must have lengths greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

Write a method that takes the lengths of the 3 sides of a triangle as arguments, and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending on whether the triangle is equilateral, isosceles, scalene, or invalid.

Problem:
input: three integers
return: a symbol
- determine if the shape represented by the 3 integers is a valid triangle.
- if valid, determine they type of triangle
- if not, return :invalid
- valid triangle:
  - all lengths > 0
  - sum of two shortest sides > length of longest side

Examples:

triangle(3, 3, 3) == :equilateral
triangle(3, 3, 1.5) == :isosceles
triangle(3, 4, 5) == :scalene
triangle(0, 3, 3) == :invalid
triangle(3, 1, 1) == :invalid

DS:
- an array
-

Algo:
- intialize an array in which the integer arguments are stored
- determine if we have a valid triangle
  - sort the array from smallest to biggest
  - if array includes 0 or if the sum of 2 shortest sides is not greater than longest side, return :invalid
  - else, then determine what type of triangle
    - if all 3 sides are equal
      - return :equilateral
    - else if all sides are different
      - return :scalene
    - else
      - return :isosceles
=end

def triangle(x, y, z)
  array = [x, y, z].sort

  if array.include?(0) || array[0] + array[1] < array[2]
    :invalid
  else
    if array.all?(array[0])
      :equilateral
    elsif array == array.uniq
      :scalene
    else
      :isosceles
    end
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid

puts

def triangle(x, y, z)
  array = [x, y, z].sort

  return :invalid if array.include?(0) || array[0] + array[1] < array[2]

  if array.all?(array[0])
    :equilateral
  elsif array == array.uniq
    :scalene
  else
    :isosceles
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid

