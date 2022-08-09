=begin
Sum of Sums
Write a method that takes an Array of numbers and then returns the sum of the sums
of each leading subsequence for that Array.
You may assume that the Array always contains at least one number.

PEDAC
Problem
-I need to write a method that takes an array of numbers as an argument
-the method returns the sum of the sums of each leading subsequence for that array
-so for example if the array is [3, 5, 2], the subsequences are (3) + (3 + 5) + (3 + 5 + 2),
 so starting with 1 and increasing by 1 until the end of the array is reached
 and those subsequences are then added and result is returned

 Examples
sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
sum_of_sums([4]) == 4
sum_of_sums([1, 2, 3, 4, 5]) == 35

Data Structures
input: array of numbers
output: integer

Algorithm
-given that my array is [3, 5, 2]

-my first sum is array[0] --> 3, I add my 1st sum to the result
-my second sum is array[0] + array[1] --> 3 + 5, I add my 2nd sum to the result
-my third sum is array[0] + array[1] + array[2] -- 3 + 5 + 2 - I add my 3rd sum to the result

-the above will give me [3 + 8 + 10] = 21

-so my first sum is 3 or the 1st element of the array,
-then I should iterate over the array and add all the elements until the current counter
so I always need to add array[0] + counter
Code
=end
def sum_of_sums(array)
  # return array[0].to_i if array.size == 1
  counter = 1
  res = []
  loop do
    res << array.slice(0, counter)
    counter += 1
    break if counter > array.size
  end
  res.flatten.sum
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35
