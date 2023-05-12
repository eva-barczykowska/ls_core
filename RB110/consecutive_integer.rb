=begin
Imagine a sequence of consecutive even integers beginning with 2. The integers are grouped in rows, with the first
row containing 1 integer, the second one 2 integers, the third row 3, etc. Given an integer representing the number
of a particular row, return the sum of integers in that row.

PEDAC TEMPLATE

************** Problem **************
2
2, 4
2, 4, 6
2, 4, 6, 8
2, 4, 6, 8, 10, etc.

so in row 1, I have 1 even integer, 2
so in row 2, I have 2 even integers, 2, 4
so in row 3, I have 3 even integers, 2, 4, 6

---row number is equal the number of elements that is in that row
-the row is a subsequence of numbers

************** Examples **************


************** Data Structures **************
Input: single integer, a reference to a subset of integers
Output: a single integer
************** Algorithm **************
-build the specified row so that you can sum its elements
-I have the information which row it is
-the row number is equal to the number of integers that the row contains, i.e. row 1 contains 1 integer,
 row 2 contains 2 integers, row 3 contains 3 integers, etc.
-the argument number gives me information which row it is but more importantly, it tells me
  how many positive integers I need to add to my array of integers
-produce an array of those integers, starting from 0
-sum all those integers

************** Code **************

************** Refactor **************

Differentiate between EXPLICIT AND IMPLICIT requirements?
=end

def get_sum(row_number)
  array_of_numbers = []
  counter = 2
  while array_of_numbers.size < row_number
    array_of_numbers << counter
    counter += 2
  end
  array_of_numbers.sum
end

p get_sum(5)
