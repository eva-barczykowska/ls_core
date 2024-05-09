=begin
Problem 14
Create a method that takes a single integer argument and returns the sum of all the multiples of 7 or 11 that are less than the argument. If a number is a multiple of both 7 and 11, count it just once.

For example, the multiples of 7 and 11 that are below 25 are 7, 11, 14, 21, and 22. The sum of these multiples is 75.

If the argument is negative, return 0.

p seven_eleven(10) == 7
p seven_eleven(11) == 7
p seven_eleven(12) == 18
p seven_eleven(25) == 75
p seven_eleven(100) == 1153
p seven_eleven(0) == 0
p seven_eleven(-100) == 0

Problem
========
-method takes an int
-method retuns an integer
-the integer represents a sum of all the multiples of 7 or 11 that are less than argument
-if a number is a multiple of both 7 and 11, count it just once
-if arg is negative, return 0

Examples
p seven_eleven(10) == 7
1, 2, 3, 4, 5, 6, 7, 8, 9
7
p seven_eleven(11) == 7
1, 2, 3, 4, 5, 6, 7, 8, 9, 10
7
p seven_eleven(12) == 18
7, 11
=> 18

p seven_eleven(25) == 75
p seven_eleven(100) == 1153
p seven_eleven(0) == 0
=> argument is 0
p seven_eleven(-100) == 0
=> negative argument

Algorithm
==========
INIT `sum` array

ITERATE over the numbers from 1 to number EXCLUSIVE
-for each number, if it is divisible by both 7 and 11, add it to `sum`
-elsif num evenly divisible by 11, add it to sum
-else num evenly divisible by 7, add it to sum

RETURN sum of `sum`
=end
def seven_eleven(n)
  sum = 0
  (0...n).each do |num|
    # p num
    if num % 7 == 0 && num % 11 == 0
      sum += num
    elsif num % 11 == 0
      sum += num
    elsif num % 7 == 0
      sum += num
    end
  end

    sum
end
p seven_eleven(10) == 7
p seven_eleven(11) == 7
p seven_eleven(12) == 18
p seven_eleven(25) == 75
p seven_eleven(100) == 1153
p seven_eleven(0) == 0
p seven_eleven(-100) == 0
