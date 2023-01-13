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
