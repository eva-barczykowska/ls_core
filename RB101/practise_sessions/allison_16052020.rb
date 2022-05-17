# https://www.codewars.com/kata/54da539698b8a2ad76000228/train/ruby

# You live in the city of Cartesia where all roads are laid out in a perfect
# grid. You arrived ten minutes too early to an appointment, so you decided to
# take the opportunity to go for a short walk. The city provides its citizens
# with a Walk Generating App on their phones -- everytime you press the button it
# sends you an array of one-letter strings representing directions to walk
# (eg. ['n', 's', 'w', 'e']). You always walk only a single block for each letter
# (direction) and you know it takes you one minute to traverse one city block, so
# create a function that will return true if the walk the app gives you will take
# you exactly ten minutes (you don't want to be early or late!) and will,
# of course, return you to your starting point. Return false otherwise.
#
# # Note: you will always receive a valid array (string in COBOL) containing a
# random assortment of direction letters ('n', 's', 'e', or 'w' only).
# It will never give you an empty array
# (that's not a walk, that's standing still!).

# Problem
# -i am 10 min too early at meeting
# -I want to take a walk somewhere and come back but not early and not late
# -I press the button so that the app tells me where to go
# -I will get one-letter strings representing directions, -
# array ['n', 's', 'w', 'e']
# -it takes 1 minute to traverse 1 city block
# -I should come back to the same place in 10 moves

# input - an array of strings
# output - a boolean so true or false

# Algorithm
# -I have to come back in 10 moves, not more not less
# -if it is w -1
# -if it is e +1
# -if it is north +1
# -if it is s it's -1
# -the sum should be 0 because I started at zero
# calculate the sum and return false if it is not zero, otherwise return true

def is_valid_walk(walk)
  walk.map! do |letter|
    if letter == 'n'
      letter = 1
    elsif letter == 's'
      letter = -1
    elsif letter == 'e'
      letter = 1
    else
      letter = -1
    end
  end
  if walk.size != 10
    return false
  end
  walk = walk.sum.zero?
end

p is_valid_walk(['n', 's', 'n', 's', 'n', 's', 'n', 's', 'n', 's']) #== true
p is_valid_walk(['w', 'e', 'w', 'e', 'w', 'e', 'w', 'e', 'w', 'e', 'w', 'e'])# == false
p is_valid_walk(['n', 'w', 'e', 's']) #== false
p is_valid_walk(['w']) #== false
p is_valid_walk(['n', 'n', 'n', 's', 'n', 's', 'n', 's', 'n', 's']) #== false
