=begin
Create a function that takes an integer array and return the biggest from between positive sum, negative sum, or 0s count.\
The major is understood as the greatest absolute.

l = [1,2,3,4,0,0,-3,-2], the function has to return 10, because:

Positive sum = 1+2+3+4 = 10
Negative sum = (-3)+(-2) = -5
0s count = 2 (there are two zeros in array)
Examples
major_sum([1, 2, 3, 4, 0, 0, -3, -2]) ➞ 10

major_sum([-4, -8, -12, -3, 4, 7, 1, 3, 0, 0, 0, 0]) ➞ -27

major_sum([0, 0, 0, 0, 0, 1, 2, -3]) ➞ 5
# Because -3 < 1+2 < 0sCount = 5
Notes
All numbers are integers.
There aren't empty arrays.
All tests are made to return only one value.

PEDAC:
P:
- write a method that takes an array of integers as an argument
- integers can be negative o 0
- method returns the biggest between positive sum, negative sum o 0s count

E:
l = [1,2,3,4,0,0,-3,-2], the function has to return 10, because:
p major_sum(l) == 10 because =>

Positive sum = 1+2+3+4 = 10
Negative sum = (-3)+(-2) = -5
0s count = 2 (there are two zeros in array)
=> I have 3 numbers, and I need to return the biggest

major_sum([0, 0, 0, 0, 0, 1, 2, -3]) == 5
positive 3
negative -3
zeros 5
sum up positive and negative and add zeros

-it looks like I need to sum up positive nums, negative nums and count how many 0s

A:
- `initialize positive sum`, `negative sum`, `count_of_zeros` 0s
- iterate over the array:
  - if num positive and not zero, add it to positives
  - of num zero, add 1 to count
  - if num negative, sum it
- add all these nums to `result` array
- transform nums into absolute values
- get the absolute value of the see which num of those 3 is the biggest and return it
- how to get the greatest value?

=end

def major_sum(arr)
  result = []
  positive_nums_sum = 0
  negative_nums_sum = 0
  zeros_count = 0

  arr.each do |num|
    positive_nums_sum += num if num.positive? && num != 0
    zeros_count += 1 if num.zero?
    negative_nums_sum += num if num.negative?
  end

  result << positive_nums_sum << negative_nums_sum << zeros_count
  max = result.map { |n| n.abs }.max # the greatest absolute

  result.each do |num|
    return num if -num == max
  end

  result.max
end
p major_sum([1, 2, 3, 4, 0, 0, -3, -2]) == 10
p major_sum([-4, -8, -12, -3, 4, 7, 1, 3, 0, 0, 0, 0]) == -27
p major_sum([0, 0, 0, 0, 0, 1, 2, -3]) == 5