
=begin
 Given an array of numbers, for each number find out how many numbers
# in the array are smaller than it. When counting numbers, only count
# unique values. That is, if a given number occurs multiple times in
# the array, it should only be counted once.

PEDAC:
P:
- write a method
- method takes an array of numbers
- for each number find out how many numbers are smaller
- return that number as an element in an array
- but when counting, only count unique values

# Examples:
p smaller_numbers_than_current(ç) == [3, 0, 1, 1, 2]
=> 3 nums are smaller than 8: 1, 2, 3 (2 is counted only once)
=> 0 nums are smaller than 1
=> 1 num is smaller than 2: 1
=> 1 num is smaller than 2: 1
=> 2 nums are smaller than 3: 1, 2

p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4])
                            == [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]

DS:
input: array of nums
output: array of nums of same size

A:
- iterate over the input array
- at every iteration select from the uniq array numbers that are smaller than the current number and save to `result` the size of the array returned by `select`

- return the `result` array with sizes
=end
def smaller_numbers_than_current(arr)
  res = []

  arr.each do |number|
    res << arr.uniq.select { |n| n < number }.size
  end

  res
end
p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4]) == [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]

# first outer iteration is looking at 8
# inner iteration with select iterating through arr with uniq numbers is asking which all numbers are smaller than 8
# then select returns all those numbers in an array
# but we are not interested in the array but in its size
# which we are saving to `result`