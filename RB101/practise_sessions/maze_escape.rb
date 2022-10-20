############################# MAZE ESCAPE #########################################
# Maze Escape
# Given a two-dimensional array of maze and an array of directions. Your task is to follow the given directions.

# If you can reach the endpoint before all your moves have gone, return "Finish".
# If you hit any walls or go outside the maze border, return "Dead".
# If you find yourself still in the maze after using all the moves, return "Lost".
# The maze array will look like this:

# maze = [
#   [1, 1, 1, 1, 1, 1, 1, 1, 0, 1],
#   [1, 3, 1, 0, 1, 0, 0, 0, 0, 1],
#   [1, 0, 1, 0, 0, 0, 1, 1, 0, 1],
#   [1, 0, 1, 1, 1, 1, 1, 0, 0, 1],
#   [1, 0, 1, 0, 0, 0, 0, 0, 0, 1],
#   [1, 0, 1, 0, 1, 0, 1, 0, 0, 1],
#   [1, 0, 1, 0, 1, 0, 0, 0, 0, 0],
#   [1, 0, 1, 0, 1, 0, 1, 1, 0, 1],
#   [1, 0, 0, 0, 1, 0, 0, 0, 0, 1],
#   [1, 1, 1, 0, 1, 1, 1, 1, 2, 1]
# ]

# # 0 = Safe place to walk
# # 1 = Wall
# # 2 = Start Point
# # 3 = Finish Point
# # N = North, E = East, W = West and S = South
# See the below examples for a better understanding:

# Examples
# exit_maze(maze, ["N", "E", "E"]) ➞ "Dead"
# # Hitting the wall should return "Dead".

# exit_maze(maze, ["N", "N", "N", "E"]) ➞ "Lost"
# # Couldn't reach the finish point.

# exit_maze(maze, ["N", "W", "W", "W", "N", "N", "N", "N", "W", "W", "S", "S", "S", "S", "W", "W", "N", "N", "N", "N", "N", "N", "N"]) ➞ "Finish"


=begin
Input: Array of strings (directions)
Output: String (Outcome of the maze)

Questions:
Should I return finish if I reach the endpoint but haven't run out of moves? (For now I'll force a "Finish" return if it happens)


Explicit Rules:
Return "Dead" if you hid a wall in the maze or go out of the maze's borders
Return "Lost" if you run out of directions but didn't reach the finish point
Return "Finish" if you reach the finish point

Implicit Rules:
Each `direction` is a move in a certain direction
Moving in between elements in an array is horizontal movement.
Moving from an array to one that is "above" or "below" it is vertical movement

Example:
Moving one space north from the starting point is the same as mooving from maze[9][8] to maze[8][8]
Moving one space west from there would be the same as moving from maze[8][8] to maze[8][7]

Algorithm
Initialize variables for vertical and horizontal movements to 9 and 8 (Starting point indices)

Initialize an `escape` variable to maze[1][1](The finish point of the maze)
Iterate through the elements in the `directions` array and start a case statement
  - When 'N' vert_idx decreases by 1
  - When 'S' vert_idx increases by 1
  - When 'W' hori_idx decreases by 1
  - When 'E' hori_idx increases by 1
  Initialize a `current_location` variable to maze[vert_idx][hori_idx]
  If current_location is equal to 1 or `nil` return "Dead"
  If current_location is equal to 3 return "Finish"
Return "Lost" if we iterate through the entire `directions` array and never returned "Dead" or "Finish"

=end

maze = [
  [1, 1, 1, 1, 1, 1, 1, 1, 0, 1],
  [1, 3, 1, 0, 1, 0, 0, 0, 0, 1],
  [1, 0, 1, 0, 0, 0, 1, 1, 0, 1],
  [1, 0, 1, 1, 1, 1, 1, 0, 0, 1],
  [1, 0, 1, 0, 0, 0, 0, 0, 0, 1],
  [1, 0, 1, 0, 1, 0, 1, 0, 0, 1],
  [1, 0, 1, 0, 1, 0, 0, 0, 0, 0],
  [1, 0, 1, 0, 1, 0, 1, 1, 0, 1],
  [1, 0, 0, 0, 1, 0, 0, 0, 0, 1],
  [1, 1, 1, 0, 1, 1, 1, 1, 2, 1]
]

def exit_maze(maze, directions)
  vert_idx = 9
  hori_idx = 8
  escape = maze[1][1]
  directions.each do |direction|
    case direction
    when "N"
      vert_idx -= 1
    when "S"
      vert_idx += 1
    when "W"
      hori_idx -= 1
    when "E"
      hori_idx += 1
    end
    current_location = maze[vert_idx][hori_idx]
    return "Dead" if current_location == 1 || current_location == nil
    return "Finish" if current_location == 3
  end
  return "Lost"
end

p exit_maze(maze, ["N", "E", "E"]) == "Dead"
p exit_maze(maze, ["N", "N", "N", "E"]) == "Lost"
p exit_maze(maze, ["N", "W", "W", "W", "N", "N", "N", "N", "W", "W", "S", "S", "S", "S", "W", "W", "N", "N", "N", "N", "N", "N", "N"]) == "Finish"
p exit_maze(maze, ["N", "W", "W", "W", "N", "N", "N", "N", "W", "W", "S", "S", "S", "S", "W", "W", "N", "N", "N", "N", "N", "N", "N", "W", "N", "E", "S"]) == "Finish"
