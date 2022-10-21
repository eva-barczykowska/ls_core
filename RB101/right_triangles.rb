=begin
Right Triangles
Write a method that takes a positive integer, n, as an argument, and displays
a right triangle whose sides each have n stars. The hypotenuse of the triangle
(the diagonal side in the images below) should have one end at the lower-left
of the triangle, and the other end at the upper-right.

triangle(5)

    *
   **
  ***
 ****
*****

triangle(9)

        *
       **
      ***
     ****
    *****
   ******
  *******
 ********
*********

Pedac
Problem
-draw a triagle with stars
-it's a right triangle, meaning its hypotenuse (diagonal line) has its lower end
at the bottom-left and upper end at the upper-right
-the method takes n as an argument and uses that to draw the triangle

Examples - as above

Data Structures
input: integer
output: a string in the form of triangle

Algorithm
draw n-1 spaces, draw a star
in the second line draw 1 less space and 1 more star
do this until the number of stars == n argument

Code
=end

def triangle(n)
  space = " "
  star = "*"
  space_counter = n-1
  star_counter = 1
  until star_counter > n
    puts "#{space * space_counter}#{star * star_counter}"
    space_counter -= 1
    star_counter += 1
  end
end

triangle(9)

puts ""

triangle(5)

puts ""

# ls solution

def triangle(num)
  spaces = num - 1
  stars = 1

  num.times do |n|
    puts (' ' * spaces) + ('*' * stars)
    spaces -= 1
    stars += 1
  end
end

triangle(5)

# other solutions
def triangle(int)
  int.times do |i|
    puts " " * (int - i) + "*" * i
  end
end

triangle(9)

puts ""
puts "Further exploration"
puts ""
# Further Exploration
# Try modifying your solution so it prints the triangle upside down from
# its current orientation. Try modifying your solution again so that you can
# display the triangle with the right angle at any corner of the grid.
# 1) upside down

def triangle(n)
  space = " "
  star = "*"
  space_counter = 0
  star_counter = n
  until star_counter < 0
    puts "#{space * space_counter}#{star * star_counter}"
    space_counter += 1
    star_counter -= 1
  end
end

triangle(9)

puts ""
# 2)Display the triagle with the right angle at any order of the grid

def triangle(n)
  space = " "
  star = "*"
  space_counter = 0
  star_counter = n
  until star_counter < 0
    puts "#{star * star_counter}#{space * space_counter}"
    space_counter += 1
    star_counter -= 1
  end
end

triangle(9)
