=begin
Transpose 3x3
A 3 x 3 matrix can be represented by an Array of Arrays in which the main Array and all of the sub-Arrays has 3 elements. For example:

Copy Code
1  5  8
4  7  2
3  9  6
can be described by the Array of Arrays:

Copy Code
matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]


An Array of Arrays is sometimes called nested arrays because each of the inner Arrays is nested inside an outer Array.

To access an element in matrix, you use Array#[] with both the row index and column index. So, in this case, matrix[0][2] is 8, and matrix[2][1] is 9. An entire row in the matrix can be referenced by just using one index: matrix[1] is the row (an Array) [4, 7, 2]. Unfortunately, there's no convenient notation for accessing an entire column.

The transpose of a 3 x 3 matrix is the matrix that results from exchanging the columns and rows of the original matrix. For example, the transposition of the array shown above is:

Copy Code
1  4  3
5  7  9
8  2  6

Write a method that takes a 3 x 3 matrix in Array of Arrays format and returns the transpose of the original matrix. Note that there is a Array#transpose method that does this -- you may not use it for this exercise. You also are not allowed to use the Matrix class from the standard library. Your task is to do this yourself.

Take care not to modify the original matrix: you must produce a new matrix and leave the original matrix unchanged.

Examples

Copy Code
matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
This program should print "true" twice.

PEDAC
************** Problem **************
3X3 matrix where the
-rows have to become columns and
-the columns have to become rows
-it's easy to get rows arr[0]
************** Examples **************
matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix = [
   [1  4  3]
   [5  7  9]
   [8  2  6
]
************** Data Structures **************
Input: nested array

Output: nested array, transposed

************** Notes **************
************** Algorithm **************
-get the 1st column [1, 5, 8]
new_matrix = [
  [matrix[0][0],  matrix[1][0] matrix[2][0]],
  [matrix[0][1], matrix[1][1], matrix[2][1]],
  [matrix[0][2], matrix[1][2] matrix[2][2]]
]
-get the 2nd row [4, 7, 2]

get the third row [3, 9, 6]
************** Code **************

************** Refactor **************

-test ALL assumptions in irb — after session with Sedrick — this approach works
=end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

def transpose(matrix)
  new_matrix = [
    [matrix[0][0], matrix[1][0], matrix[2][0]], #when the arrays are over
    [matrix[0][1], matrix[1][1], matrix[2][1]], #you start accessing  elen at index 1
    [matrix[0][2], matrix[1][2], matrix[2][2]], #from all orig arrays u take elem at index 5
  ]
end

new_matrix = transpose(matrix)
p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

puts "here"
#how about not hard-coding?


matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

arr1, arr2, arr3 = matrix
new_matrix = matrix.map.with_index do |row, i|
  [arr1[i], arr2[i], arr3[i]]
end

p new_matrix
