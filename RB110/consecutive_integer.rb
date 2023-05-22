=begin
Imagine a sequence of consecutive even integers beginning with 2. The integers are grouped in rows, with the first
row containing 1 integer, the second one 2 integers, the third row 3, etc. Given an integer representing the number
of a particular row, return the sum of integers in that row.

PEDAC TEMPLATE

************** Problem **************
row 1 = > 2
row 2 => 4, 6
row 3 => 8, 10, 12
row 4 => 14, 16, 18, 20
row 5 => 22, 24, 26, 28, 30

so in row 1, I have 1 even integer, 2
so in row 2, I have 2 even integers, 2, 4
so in row 3, I have 3 even integers, 2, 4, 6

---row number is equal the number of elements that is in that row
-the row is a subsequence of numbers

************** Examples **************
row 1 => 2 => 2
row 2 => 4, 6 => 10
row 4 => 14, 16, 18, 20 = 68

p get_sum(1) == 2
p get_sum(2) == 6
p get_sum(4) == 68

************** Data Structures **************
Input: single integer, a reference to a subset of integers
Output: a single integer
visualized:
[
[2]
[4, 6]
[8, 10, 12]
[14, 16, 18, 20]
]
************** Algorithm **************
-build the specified row so that you can sum its elements
-I have the information which row it is
-the row number is equal to the number of integers that the row contains, i.e. row 1 contains 1 integer,
 row 2 contains 2 integers, row 3 contains 3 integers, etc.
-the argument number gives me information which row it is and
  how many positive integers I need to add to my array of integers
-produce an array of those integers, starting from 0
-sum all those integers

-create an empty `rows ` array to contain all of the rows
-create a 'row' array and add it to the overall `rows` array
-repeat the above step until all the necessary rows have been created
-sum the final rows
-return the sum

Problem: create a row
Rules: row is an array
-array contains integers
-integers are consecutive even numbers
-integers in each row form a part of an overall larger sequence
-rows are of different lengths
Input: the information needed to provide the output
-the start integer for the row
-the length of the row
Output: the row
Examples
Start 2, length 1 => [2]
Start 4, length 2 => [4, 6]
Start 8, length 3 => [8, 10, 12]
Output: the row itself `[8, 10, 12]`
Data structures: array of integers

Algorithm for this problem
1. create an empty row containing the integers/for the integers?
2. add the starting integer
3. increment the starting integer by 2 to get the sequence
All the rows have been created when the length of `rows` array is equal to the input integer
4. repeat step 2 and 3 until the array reached the correct length
5. return the array

************** Code **************

************** Refactor **************

Differentiate between EXPLICIT AND IMPLICIT requirements?
=end

def get_row(row_number)
  integers = []
  integer_to_add = 2

  loop do
  integers << [integer_to_add]
  integer_to_add += 2
  break if integers.size > row_number
  end

  integers
end
p get_row(2)
# def sum_even_number_row
#
# end
#
# p get_sum(1) == 2
# p get_sum(2) == 6
# p get_sum(4) == 68
#
#
