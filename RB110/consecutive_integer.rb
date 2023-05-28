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
p get_sum(2) == 10
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

Calculating the starting integer:
Rule: first integer of row == to last integer of the proceeding row + 2
Algorithm
-get the preceding row
-get the last integer of that row
-add 2 to the integer
************** Algorithm **************
# mine
-build the specified row so that you can sum its elements
-I have the information which row it is
-the row number is equal to the number of integers that the row contains, i.e. row 1 contains 1 integer,
 row 2 contains 2 integers, row 3 contains 3 integers, etc.
-the argument number gives me information which row it is and
  how many positive integers I need to add to my array of integers
-produce an array of those integers, starting from 0
-sum all those integers

#LS algorithm
1.Create an empty `rows ` array to contain all of the rows
2. Create a 'row' array and add it to the overall `rows` array
3. Repeat the above step until all the necessary rows have been created
4. Sum the final rows
5. Return the sum

Problem: create a row
Rules: row is an array
-array contains integers
-integers are consecutive even numbers
-integers in each row form a part of an overall larger sequence
-rows are of different lengths
Input: the information needed to provide the output
-the start integer for the row # missed this the first time I was solving it
-the length of the row -- missed the fact that there are 2 pieces of input when I was solving it on my own first
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

-start the loop
-add the start integer to the row(step 2 above)
-increment the start integer by 2 (step 3 above)
-break out of the loop if length of row  equals row_length
************** Code **************

************** Refactor **************

Differentiate between EXPLICIT AND IMPLICIT requirements?
=end

# def get_row(row_number)
#   final_array = []
#   integer_to_add = 2
#   target_array_size_for_this_iteration = 1 # don't you just love the name of this variable
#   temp_array = []
#
#   loop do
#     while temp_array.size < target_array_size_for_this_iteration
#       temp_array << integer_to_add
#       integer_to_add += 2
#     end
#     final_array << temp_array
#     temp_array = []
#     target_array_size_for_this_iteration += 1
#   break if final_array.size >= row_number
#   end
#     final_array.last
#   end
# p get_row(1) == [2]
# p get_row(2) == [4, 6]
# p get_row(3) == [8, 10, 12]

#LS algorithm
# 1.Create an empty `rows ` array to contain all of the rows
# 2. Create a 'row' array and add it to the overall `rows` array
# -All rows have been created when the length of the `row` array is equal to the input integer (number)
# 3. Repeat the above step until all the necessary rows have been created
# 4. Sum the final rows
# 5. Return the sum

puts
# puts LS
def get_row(start_integer, row_length)
  row = []
  current_integer = start_integer
  loop do
    row << current_integer
    current_integer += 2
    break if row.length == row_length
  end
  row
end
# p get_row(2, 1) #== [2]
# p get_row(4, 2) #== [4, 6]
# p get_row(8, 3) #== [8, 10, 12]
def sum_even_number_row(row_number)
  rows = []
  start_integer = 2
    (1..row_number).each do |current_row_number|
    rows << get_row(start_integer, current_row_number)
    start_integer = rows.last.last + 2
    end
  rows.last.sum
end

p sum_even_number_row(1) == 2
p sum_even_number_row(2) == 10
p sum_even_number_row(4) == 68


