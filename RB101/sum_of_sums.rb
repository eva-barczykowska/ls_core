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

-I should iterate over the array and add all the elements until the current counter

Code
=end

def sum_of_sums(array)
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

puts ""

# ls solution 1
def sum_of_sums(numbers)
  sum_total = 0
  accumulator = 0

  numbers.each do |num|
    accumulator += num
    sum_total += accumulator # accumulator is the running total that we need to keep track of
  end

  sum_total
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35

# ls solution 2
def sum_of_sums(numbers)
  sum_total = 0
  1.upto(numbers.size) do |count|
    sum_total += numbers.slice(0, count).reduce(:+)
  end
  sum_total
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35

puts ""

def sum_of_sums(nums)
  (0...nums.size).reduce(0) do |sum, index|
    sum + nums[0..index].reduce(:+)
  end
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35

puts ""

def sum_of_sums(array)
  total = 0
  for i in 0..(array.size - 1)
    total += array[0..i].sum
  end
  total
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35
