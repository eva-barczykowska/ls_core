# Write a method that displays a 4-pointed diamond in an n x n grid, where n is
# an odd integer that is supplied as an argument to the method.
# You may assume that the argument will always be an odd integer.
#
# Test cases
# diamond(1)
#
# *
#
# diamond(3)
#
#  *
# ***
#  *
#
#
#  diamond(9)
#
#     *
#    ***
#   *****
#  *******
# *********
#  *******
#   *****
#    ***
#     *

# Algorithm
# -I will have 2 methods, one to build the top part and 1 to build the bottom part of the diamond
# -I will build the top part of the diamond by looping and printing in turn spaces and stars
# -spaces will decrease with each row while starts will increase
# - conversely, I will have a separate counter for the stars, which will increase with each row, until the number passed as an argument
# -I will split the the diamond into 2 vertically and only print spaces on the left + stars
# -spaces on the right will take care of themselves
# -then I will write the 2nd method, for the bottom part of the diamond
# in this method, I will be printing less and less stars and more spaces, until there will be no more stars to print
# finally, I will write the final method where I will call both methods, 1 to draw the top and 1 to draw the bottom part of the diamond

# def draw_top_part(size)
#   star = '*'
#   space = ' '
#   counter_of_spaces = (size / 2.0).floor
#   counter_of_stars = 1
#     loop do
#       puts (space * counter_of_spaces) + (star * counter_of_stars)
#       counter_of_spaces -= 1
#       counter_of_stars += 2
#       break if counter_of_spaces < 0
#     end
# end
#
# def draw_bottom_part(size)
#   star = '*'
#   space = ' '
#   counter_of_spaces = 1
#   counter_of_stars = size - 2
#     loop do
#       break if counter_of_stars < 1
#       puts (space * counter_of_spaces) + (star * counter_of_stars)
#       counter_of_spaces += 1
#       counter_of_stars -= 2
#     end
# end
#
#
# def diamond(size)
#   return draw_top_part(size), draw_bottom_part(size)
# end
#
# diamond(3)
#
# diamond(9)
#
# diamond(1)

#refactor
def diamond(size)
  star = '*'
  space = ' '
  counter_of_spaces = (size / 2.0).floor
  counter_of_stars = 1
    loop do
      puts (space * counter_of_spaces) + (star * counter_of_stars)
      counter_of_spaces -= 1
      counter_of_stars += 2
      break if counter_of_spaces < 0
    end

    counter_of_spaces = 1
    counter_of_stars = size - 2
    loop do
      break if counter_of_stars < 1
      puts (space * counter_of_spaces) + (star * counter_of_stars)
      counter_of_spaces += 1
      counter_of_stars -= 2
    end
end

diamond(3)

diamond(9)

diamond(1)

# ls solution
def print_row(grid_size, distance_from_center)
  number_of_stars = grid_size - 2 * distance_from_center
  stars = '*' * number_of_stars
  puts stars.center(grid_size)
end

def diamond(grid_size)
  max_distance = (grid_size - 1) / 2
  max_distance.downto(0) { |distance| print_row(grid_size, distance) }
  1.upto(max_distance)   { |distance| print_row(grid_size, distance) }
end

diamond(3)

diamond(9)

diamond(1)

#other solutions
def diamonds(num)
  star, peak = '*' , 1


  1.upto(num/2) do
    puts (star * peak).center(num)
    peak += 2
  end

  num.downto(1) do
    unless peak < 0
      puts (star * peak).center(num + 1)
      peak -= 2
    end
  end
end

diamond(3)

diamond(9)

diamond(1)
