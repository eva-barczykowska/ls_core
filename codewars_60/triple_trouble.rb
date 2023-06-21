=begin
598. Triple trouble
(https://www.codewars.com/kata/55d5434f269c0c3f1b000058)
6 kyu
Write a function triple_double(num1, num2) which takes numbers num1 and num2
and returns 1 if there is a straight triple of a number at any place in num1 and also a straight double of the same number in num2.
If this isn't the case, return 0

** return 1: straight triple and straight double
return 0 if there is not both a straight triple and a straight double
PEDAC TEMPLATE

************** Problem **************
-write a method that takes 2 arguments, num1 and num2
-this method returns 1 if there is a straight triple of a number at any place in num1 AND
 also a straight double of the same number in num2
-so I need 3 occurrences of any digit (from the first number argument) in the first number and a double occurrence of
any digit(from the first number argument) in the second number

Questions:
-the test cases have only consecutive numbers, this has to be accounted for, right?

************** Examples **************
p triple_double(12345, 12345)   == 0 --> because no triple in the first one!
p triple_double(666789, 12345667) == 1 -->because triple in the fist one and double in the second one!
p triple_double(10560002, 100)  == 1 --> because triple in the first one and double in the second one!
p triple_double(1112, 122) == 0 --> because triple in the first one BUT no in the second one!

************** Data Structures **************
input: 2 integers
output: 0 or 1
************** Algorithm **************
-initialize `consecutive_digits_in_num1` and `consecutive_digits_in_num2` and point both to reference 0
-change num1 and num2 to string and iterate over both, creating substrings of each
10560002
1, 10, 105, 1056, 10560, 105600. 1056000, 10560002
0, 05, 056, 0560, 05600, 056000, 0560002
5, 56, 560, 5600, 56000, 560002
6, 60, 600, 6000, 60002
0, 00, 000, 0002
0, 00, 002
0, 02
-get all strings that are of size 3, how to analyze them? I want to know that I have the same cluster of 3 digits
in the num1 and cluster of SAME 2 digits in num2
-first get rid of all clusters whose size is smaller or greater than 3
-then get rid of clusters whose digits are not same
-if I don't have any clusters greater than 3, I can return 0 already
if I have clusters greater than 3 in num1, I have to check if I have cluster  consisting of same digits and
of size 2 in num2


OR
-account for nil or 0 input
-account for 0 input
-change the num to an array of single digits
-find out if any numbers are repeated in array1 and also which ones
-after retrieving the numbers that are repeated return 0 if they are repeated less than 3 times

-find out if any numbers are repeated in array2 and also which ones
-if none of the target numbers extracted from array1 are present in array2, return 0
-if the numbers are present but their count is different than 2, return 0
-else return 1

=end
def triple_double(num1, num2)
  return 0 if num1.nil? || num2.nil?
  return 0 if num1.zero? || num2.zero?

  array1 = num1.to_s.split("").map { |s| s.to_i }
  array1_chunks = array1.chunk_while { |i, j| j == i + 0 }.select { |array| array.size == 3 }.flatten
  # p "all chunks from 1st array"
  # p array1_chunks

  return 0 if array1_chunks.size < 3 # these will be all chunks of 3 or more same consecutive numbers
  target_numbers = array1_chunks.uniq
  # p "target numbers"
  # p target_numbers # now see if ANY of those target numbers are present in the num2 array 1 after another

  array2 = num2.to_s.split("").map { |s| s.to_i }
  array2 = array2.chunk_while { |i, j| j == i + 0 }.select { |array| array.size == 2 }.flatten

  # p "all chunks from 2nd array"
  # p array2

  return 0 if array2.none? { |num| target_numbers.include?(num) }
  return 0 unless target_numbers.any? { |number| array2.count(number) == 2 }
  return 1
end

p triple_double(111222345, 122345) == 1
p triple_double(133345, 123345) == 1
p triple_double(12345, 12345) == 0
p triple_double(666789, 12345667) == 1
p triple_double(10560002, 100) == 1
p triple_double(1112, 122) == 0
p triple_double(451999277, 41177722899) == 1
p triple_double(1222345, 12345) == 0
