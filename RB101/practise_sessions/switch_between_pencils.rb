##################Switching Between Pencils###########################################
# When coloring a striped pattern, you may start by coloring each square sequentially, meaning you spend time needing to switch coloring pencils.

# Create a function where given an array of colors cols, return how long it takes to color the whole pattern. Note the following times:

# It takes 1 second to switch between pencils.
# It takes 2 seconds to color a square.
# See the example below for clarification.

# color_pattern_times(["Red", "Blue", "Red", "Blue", "Red"]) ➞ 14

# // There are 5 colors so it takes 2 seconds to color each one (2 x 5 = 10).
# // You need to switch the pencils 4 times and it takes 1 second to switch (1 x 4 = 4).
# // 10 + 4 = 14
# Examples
# colorPatternTimes(["Blue"]) ➞ 2

# colorPatternTimes(["Red", "Yellow", "Green", "Blue"]) ➞ 11

# colorPatternTimes(["Blue", "Blue", "Blue", "Red", "Red", "Red"]) ➞ 13
# Notes
# Only change coloring pencils if the next color is different to the color before it.
# Return a number in seconds.

################################################################################

# When coloring a striped pattern, you may start by coloring each square sequentially, meaning you spend time needing to switch coloring pencils.

# Create a function where given an array of colors cols, return how long it takes to color the whole pattern. Note the following times:

# It takes 1 second to switch between pencils.
# It takes 2 seconds to color a square.
# See the example below for clarification.

# color_pattern_times(["Red", "Blue", "Red", "Blue", "Red"]) ➞ 14

# // There are 5 colors so it takes 2 seconds to color each one (2 x 5 = 10).
# // You need to switch the pencils 4 times and it takes 1 second to switch (1 x 4 = 4).
# // 10 + 4 = 14
# Examples
# colorPatternTimes(["Blue"]) ➞ 2

# colorPatternTimes(["Red", "Yellow", "Green", "Blue"]) ➞ 11

# colorPatternTimes(["Blue", "Blue", "Blue", "Red", "Red", "Red"]) ➞ 13
# Notes
# Only change coloring pencils if the next color is different to the color before it.
# Return a number in seconds.
=begin
Input: Array of strings
Output: Integer (seconds)
Explicit Rules:
It takes 2 seconds to color a square
It takes 1 second to switch colors

Implicit Rules:
Every element in the array adds 2 seconds to the overall time
The amount of elements in the input array minus one is the amount of extra seconds added by switching colors.

Algorithm
Initialize a seconds variable to the length of the array times two
Iterate through the indices in the array starting from index 1, if the color in the current index is different from the color at the
  previous index, increase seconds by one.
Return seconds
=end

def colorPatternTimes(arr)
  seconds = ( arr.length * 2 )
  1.upto(arr.length-1) do |idx|
    seconds += 1 if arr[idx] != arr[idx-1]
  end
  seconds
end

p colorPatternTimes(["Blue"]) == 2
p colorPatternTimes(["Red", "Yellow", "Green", "Blue"]) == 11
p colorPatternTimes(["Blue", "Blue", "Blue", "Red", "Red", "Red"]) == 13
p colorPatternTimes(["Red", "Blue", "Red", "Blue", "Red"]) == 14
