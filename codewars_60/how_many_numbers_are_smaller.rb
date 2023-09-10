=begin
Given an array of numbers, for each number find out how many numbers
in the array are smaller than it. When counting numbers, only count
unique values. That is, if a given number occurs multiple times in
the array, it should only be counted once.

Examples:

p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4]) == [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]

# The tests above should print "true".

P:
-write a method that takes an array as an argument
-it returns an array that contains how many numbers are smaller than each number
-we only count unique values

E:
p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
=> smaller than 8? - 3 (1, 2, 3)
=> smaller than 1 - 0
=> smaller than 2 -1 (1)
=> smaller than 2 -1 (1)
=> smaller than 3 - 2 (1, 2)
p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4]) == [0, 2, 4, 5, 6, 1, 2, 3, 2]
=>
p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]

Notes:
-shift
A:
-return [0] if array has only 1 element

-initialize result
-initialize temp

-remove the first number and save it to current_num

-verify which numbers in the array appear multiple times and
 save the unique nums in uniq_array

-iterate over the uniq array and if a number is smaller than the current_num,
save it to temp array

-once itration is over
-save the size of temp  to result

start from the beginning and repeat this until arg array is empty
=end

def smaller_numbers_than_current(array)
  result = []
  temp = []

  unique_array = array.uniq

  loop do
    break if array.empty?

    current_num = array.shift

    unique_array.each do |num|
      if num < current_num
        temp << num
      end
    end

    result << temp.size
    temp.clear
  end

  result
end


p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4]) == [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]


# feedback from Kana
# talk and then type
# speak first and then type
# as long as my t. cases pass, I DON'T NEED to refactor YAY

# small steps could be wrapped in an iterative method


def smaller_numbers_than_current(array)
  unique_values = array.uniq

  array.map do |num|
    unique_values.count { |value| value < num }
  end
end

p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4]) == [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]

