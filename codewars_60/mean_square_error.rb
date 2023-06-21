=begin
26. Mean Square Error
(https://www.codewars.com/kata/51edd51599a189fe7f000015/train/ruby)
Complete the function that

accepts two integer arrays of equal length
compares the value each member in one array to the corresponding member in the other
squares the absolute value difference between those two values
and returns the average of those squared absolute value difference between each member pair.

Examples
[1, 2, 3], [4, 5, 6]              -->   9   because (9 + 9 + 9) / 3
** 3 3 3, 9 9 9 , (9+9+9)/3 = 9
[10, 20, 10, 2], [10, 25, 5, -2]  -->  16.5 because (0 + 25 + 25 + 16) / 4
** 0 5 5 4, 0 25 25 16 ,66/4 = 16
[-1, 0], [0, -1]                  -->   1   because (1 + 1) / 2
=begin pedac

*************Problem********************
Overall goal: To write a method that takes 2 arrays, performs a math computation and returns the resulting integer
initial input: arr1, arr2 / 2 arrays
overall output: float

explicit requirements:
2 arrays are of equal length
compute:
  compare the difference between each member of the arrays
    arr1[0] - arr2[0]
  get absolute value of this difference
  square each difference
  then get average (divide by the num of ele)


implicit requirements:

questions:

**********Examples/Test cases************
p solution([1, 2, 3], [4, 5, 6]) # == 9
# p solution([10, 20, 10, 2], [10, 25, 5, -2]) == 16.5
** returning a float
# p solution([-1, 0], [0, -1]) == 1


*************Data Structure**************
2 arr > float

***************Algorithm*****************
Overall approach:
define a method with arr1 arr2 as parameters
iterate over arr1, transform to array of differences
  ** map with index, arr1[0] - arr2[0], abs, square each one
  ** reutn value will be array of integers
get the average
  sum the return array of map
  divide by num of ele as a float
  ** array.size to _f
return value will be the average

=end

def solution(arr1, arr2)
  arr1.map.with_index {|int, idx| ((int - arr2[idx]).abs)**2 }.sum / arr1.size.to_f
end

p solution([1, 2, 3], [4, 5, 6])  == 9
p solution([10, 20, 10, 2], [10, 25, 5, -2]) == 16.5
p solution([-1, 0], [0, -1]) == 1



