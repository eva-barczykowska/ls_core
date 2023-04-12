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
-first split the first number to know what digits I work with
--12345.to_s.split("").map { |s| s.to_i }--
-how to check that they are not all different?
---12345.to_s.split("").tally-- this will calculate if numbers are unique
-numbers will be keys and values will be how many of those digits (but not consecutive, I have to take care of this
 separately!)
-if I don't have 3 same digits in the first argument, I'm returning 0

-count each of those digits, do I have a 3 of any of them immediately next to each other in the first argument number?
-if no, return 0

-loop over the digits
-define result
-if a digit is same as the previous one, add it to the result array
-after looping, I can check the size of the result array
-if the size is >= 3, then I should also loop through the 2nd number argument
-if I don't find 3 same consecutive digits in both arguments to the method,
then I need to return 0

If I find, then I return 1

-if yes, do I have also a straight double in the second number argument?

************** Code **************
=end
def triple_double(num1, num2)
  num1_array = num1.to_s.split("").map { |s| s.to_i }
  count_nums_in_num1 = num1_array.tally # tally is not a good idea, because we are counting ALL numbers instead of checking for consecutive numbers
  p count_nums_in_num1
  return 0 if count_nums_in_num1.values.none? { |v| v > 2 }

  if count_nums_in_num1.has_value?(3)
    number_to_look_for = count_nums_in_num1.select { |_, v| v == 3}
    number_to_look_for = number_to_look_for.keys.join.to_i # gives me the number to look for in the second num
    p number_to_look_for
  end

  num2_array = num2.to_s.split("").map { |s| s.to_i }

  if num2_array.count(number_to_look_for) != 2
    return 0
  else
    return 1
  end
end
# p triple_double(12345, 12345) == 0
# p triple_double(666789, 12345667) == 1
p triple_double(10560002, 100) #== 1
# p triple_double(1112, 122) == 0