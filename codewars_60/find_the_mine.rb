=begin
21. Find the Mine!
(https://www.codewars.com/kata/528d9adf0e03778b9e00067e/train/ruby)
6 kyu
You've just discovered a square (NxN) field and you notice a warning sign. The sign states that there's a single bomb
in the 2D grid-like field in front of you.

Write a method mine_location that accepts a 2D array, and returns the location of the mine. The mine is represented as
the integer 1 in the 2D array. Areas in the 2D array that are not the mine will be represented as 0s.

The location returned should be an array where the first element is the row index, and the second element is the column
index of the bomb location (both should be 0 based). All 2D arrays passed into your function will be square (NxN),
and there will only be one mine in the array.

PEDAC TEMPLATE

************** Problem **************
-we have a square field(N*N)
-in that field there is a bomb, denoted by number 1
-write a method that takes a 2D array a = [[1, 2], [3, 4]] -2 levels?
-there will be an array which will have nested array/arrays
-1 means mine, 0 means no mine
-return an array, where the first element is the ROW index and the 2nd is the COLUMN index
-only 1 mine in the array
-all 2D arrays are square
Questions:

************** Examples **************
p mineLocation( [ [1, 0, 0], [0, 0, 0], [0, 0, 0] ] ) == [0, 0]
-> [0, 0] because row is 0, column is 0
p mineLocation( [ [0, 0, 0], [0, 1, 0], [0, 0, 0] ] ) == [1, 1]
-> [1, 1] because array is 1 and element is 1
p mineLocation( [ [0, 0, 0], [0, 0, 0], [0, 1, 0] ] ) == [2, 1]
-> [2, 1] because 2nd array and 1st element
p mineLocation([ [1, 0], [0, 0] ]) == [0, 0]
-> [0, 0] because it's array 0, element 0
p mineLocation([ [1, 0, 0], [0, 0, 0], [0, 0, 0] ]) == [0, 0]
-> [0, 0] because it's array no 0 and element no 0
p mineLocation([ [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 1, 0], [0, 0, 0, 0] ]) == [2, 2]
->[2, 2] because array 2 and element 2

************** Data Structures **************
input: nested array
output: 1 array with 2 indices, 1st is the index of the array
(this current array element I'm looking at - which index is it in the big array argument)
AND 2nd is the index of the element I'm looking at in the current array (not in the big one)

************** Algorithm **************
initialize `result`. and point it to an empty array
-look at the array index - the array where we have an element 1
-look at the array element index - in the array that we found out above, at which index is the integer 1 located?

-first iterate over the array and find the array, in which not all elements are 0
-this is the first element of my result array, save it there
(i.e. save index of this array where we have 1/where not all elements are 0s)

-then focus on the array in question, the index of which you got from the previous step
-look at that array and check which of its elements is 1

-I could split this into 3 methods
1. get_row - helper method/auxiliary method
2. get column
3. main method

************** Code **************
=end

# refactor into 3 methods, 2 helper methods and 1 final method
def get_row(array)
  row = []

  array.each do |subarray|
    if subarray.any? { |integer| integer != 0 }
      row << array.index(subarray)
    end
  end
  row
end

def get_column(array)
  bomb = 1
  row = get_row(array) # getting the row/ the array index of the array where we can see 1 inside
  target_array_index = row.join.to_i
  array[target_array_index].find_index(bomb) # returns column
end

def mine_location(array)
  mine_location = []

  mine_location << get_row(array)
  mine_location << get_column(array)

  mine_location.flatten
end

p mine_location([[1, 0, 0], [0, 0, 0], [0, 0, 0]]) #== [0, 0]
p mine_location([[0, 0, 0], [0, 1, 0], [0, 0, 0]]) == [1, 1]
p mine_location([[0, 0, 0], [0, 0, 0], [0, 1, 0]]) == [2, 1]
p mine_location([[1, 0], [0, 0]]) == [0, 0]
p mine_location([[1, 0, 0], [0, 0, 0], [0, 0, 0]]) == [0, 0]
p mine_location([[0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 1, 0], [0, 0, 0, 0]]) == [2, 2]

puts

def mineLocation(nested_arr)
  return_array = []
  nested_arr.each_with_index do |subarr, idx|
    if subarr.include?(1)
      return_array << idx
    end
    subarr.each_with_index do |element, idx2|
      if element == 1
        return_array << idx2
      end
    end
  end
  return_array
end

p mine_location([[1, 0, 0], [0, 0, 0], [0, 0, 0]]) #== [0, 0]
p mine_location([[0, 0, 0], [0, 1, 0], [0, 0, 0]]) == [1, 1]
p mine_location([[0, 0, 0], [0, 0, 0], [0, 1, 0]]) == [2, 1]
p mine_location([[1, 0], [0, 0]]) == [0, 0]
p mine_location([[1, 0, 0], [0, 0, 0], [0, 0, 0]]) == [0, 0]
p mine_location([[0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 1, 0], [0, 0, 0, 0]]) == [2, 2]

puts

def mine_location(field)
  row = 0
  column = 0
  field.each_with_index do |nested, index|
    if nested.include?(1)
      row = field.index(nested) # very nice doing this in 1 go!
      column = nested.index(1)  # very nice doing this in 1 go!
    end
  end
  [row, column]
end

p mine_location([[1, 0, 0], [0, 0, 0], [0, 0, 0]]) == [0, 0]
p mine_location([[0, 0, 0], [0, 1, 0], [0, 0, 0]]) == [1, 1]
p mine_location([[0, 0, 0], [0, 0, 0], [0, 1, 0]]) == [2, 1]
p mine_location([[1, 0], [0, 0]]) == [0, 0]
p mine_location([[1, 0, 0], [0, 0, 0], [0, 0, 0]]) == [0, 0]
p mine_location([[0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 1, 0], [0, 0, 0, 0]]) == [2, 2]
