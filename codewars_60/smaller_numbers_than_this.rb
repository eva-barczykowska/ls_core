=begin
# Given an array of numbers, for each number find out how many numbers
# in the array are smaller than it. When counting numbers, only count
# unique values. That is, if a given number occurs multiple times in
# the array, it should only be counted once.

=begin pedac

*************Problem********************
Overall goal: To write a method that takes an array of integers and returns an array of all the integers that are smaller than the integer. /return an array of counts
initial input: array of integers
overall output: new array of integers/counts

explicit requirements:
input array: array of integers
rules for counting: count only the uniq values of the array
  Ex [8,1,2,2,3] count 8: 1, 2, 2, 3, count only uniq; 1,2, 3 returns count of 3,
    count 1: there is nothing smaller than one, so return 0
return array: array of counts not array of int


implicit requirements:
only 1 ele, returns 0
questions:
do i need to handle the 1 ele array separately??

**********Examples/Test cases************

p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
Ex [8,1,2,2,3] count 8: 1, 2, 2, 3, count only uniq; 1,2, 3 returns count of 3,
    count 1: there is nothing smaller than one, so return 0
    count 2: 1 is smaller, so return 1
    count 2: 1 is smaller so return 1
    count 3: 2, 2, 1 but only count uniq values so 2, 1 so 2 is returned
p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4])
                            == [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
** nothing is smaller so 0 is returned for each
p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]
**only 1 ele, returns 0



*************Data Structure**************
array > new array of counts


*************SCRATCH PAD**************
use map
iterate over uniq array, use count criteria is < int


***************Algorithm*****************
define a method, 1 parameter `array`
iterate over the array and transform it into array of counts
  transformation criteria:
    get uniq values of the array
    count the number of uniq values that are smaller than integer
return value of the method will be new array of counts

=end

def smaller_numbers_than_current(array)
  array.map do |integer|
    array.uniq.count { |int| int < integer }
  end
end


p smaller_numbers_than_current([8,1,2,2,3])  == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4])== [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]
