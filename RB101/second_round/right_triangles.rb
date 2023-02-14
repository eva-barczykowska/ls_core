# # Right Triangles
# # Write a method that takes a positive integer, n, as an argument,
# and displays a right triangle whose sides each have n stars.
# The hypotenuse of the triangle (the diagonal side in the images below)
# should have one end at the lower-left of the triangle,
# and the other end at the upper-right.

# PEDAC
# Problem
# -write a method that takes an int as an argument
# -that int symbolizes the bottom of a triangle
# -it is a right triangle, flat flat border is on the right, the diagonal border
# is on the left
# -the method prints this triangle, starting from just one star and gradually
# increasing until the argument int is reached

# Examples

# triangle(5)

#     *
#    **
#   ***
#  ****
# *****

# triangle(9)

#         *
#        **
#       ***
#      ****
#     *****
#    ******
#   *******
#  ********
# *********

# Data structures
# input: integer
# output: a string

# Algorithm
# -take an integer, print int - 1 spaces, print *
# -gradually, decrease the amount of spaces on the left
# -and at the same time, print 1 more start on the left to the first star
# -do this until the index 0 from the printed string is a *
# -do this until you've reached the int argument

# Code

def triangle(int)
  spaces = int - 1
  stars = 1

  loop do
    break if stars > int
    puts ' ' * spaces + '*' * stars
    spaces -= 1
    stars += 1
  end
end

triangle(5)

puts
=begin
Right Triangles
Write a method that takes a positive integer, n, as an argument, and displays a right triangle whose sides each have n stars. The hypotenuse of the triangle (the diagonal side in the images below) should have one end at the lower-left of the triangle, and the other end at the upper-right.
PEDAC TEMPLATE

************** Problem **************
-write a method that takes a number as an argument
-the method displays a triangle
-the diagonal side of the triangle has one end at the lower left of the
 triangle
-and the other one at the upper right
-the argument is the number of stars which is the base of the triangle

Questions:

************** Examples **************

triangle(5)

    *
   **
  ***
 ****
*****

************** Data Structures **************
input: integer
output: string
************** Algorithm **************
-I will draw this triangle in rows
-the first row will have only 1 star preceded by spaces
-then row by row, there will be less spaces and more stars
-this will continue until the number of the stars reaches the
 argument number

************** Code **************
=end

def display_triangle(num)
  space = " "
  star = "*"
  number_of_spaces = num - 1
  number_of_stars = 1

  loop do
    print space * number_of_spaces
    print star * number_of_stars
    puts
    number_of_spaces -= 1
    number_of_stars += 1
    break if number_of_stars > num
  end
end

display_triangle(5)
display_triangle(9)



