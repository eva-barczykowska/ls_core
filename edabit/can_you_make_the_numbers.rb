=begin
You are given an array representing the number of 0s, 1s, 2s, ..., 9s you have. The function will look like:

can_build([#0s, #1s, #2s, ..., #9s], [num1, num2, ...])

Write a function that returns true if you can build the following numbers using only the digits you have.

can_build([0, 1, 2, 2, 3, 0, 0, 0, 1, 1], [123, 444, 92]) ➞ true

# You have: one 1, two 2s, two 3s, three 4s, one 8 and one 9
# Using only these digits, you can build 123, 444, and 92

can_build([10, 2, 3, 8, 5, 8, 5, 5, 3, 1], [11, 2, 22, 49, 444, 998, 87, 44]) ➞ false

can_build([0, 0, 0, 0, 0, 0, 0, 0, 0, 0], []) ➞ true

can_build([0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [3]) ➞ false

P:
- we are given an array with numbers that represent how many of each number we have:
- how many zeros (represented by number at index 0)
- how many ones (represented by numer at index 1), etc. etc. this goes to 9

- the 2nd argument is an array of digits

- the method has to return if all the numbers in the 2nd arg array can be built from numbers in the first arg array

E:
can_build([0, 1, 2, 2, 3, 0, 0, 0, 1, 1], [123, 444, 92]) ➞ true

# You have: one 1, two 2s, two 3s, three 4s, one 8 and one 9
# Using only these digits, you can build 123, 444, and 92

can_build([10, 2, 3, 8, 5, 8, 5, 5, 3, 1], [11, 2, 22, 49, 444, 998, 87, 44]) ➞ false
- we have 10 zeros, 2 ones, 3 twos, 8 threes, 5 fours, 8 fives, 5 sixes, 5 sevenths, 3 eights, 1 nine
- I need 6 fouths but I have only 5

can_build([0, 0, 0, 0, 0, 0, 0, 0, 0, 0], []) ➞ true
-if the 2nd arg array is empty, return true

can_build([0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [3]) ➞ false
- if all elements are different than the 2nd argument, return false

Notes:
 [123, 444, 92].join.chars.map(&:to_i)
- tally
- zip

A:
-if the 2nd array is empty, return true
- if all numbers from 2nd array are not there in the first, return false

- deal with must_have argument first
- join it, split into single characters and transform into integers (because it's integers I need to process further)
- tally - this gives me the integers -> how manu of instances I need

- create a hash of indices and numbers:
- zip (0..9) with numbers and convert it to a hash

- return false if any of the required numbers is equal to 0 in the 1st indices_and_numbers array, this means that
  these numbers are required but not there in our resources

- remove from `numbers_and_indices` keys that don't exist in `must_have`, it will be easier to compare

- then check this:
- look at each key and value in must_have hash
  if the value for the same key in `indices_and_numbers` is less than the value for that key in `must_have`
  return false

- otherwise return true
=end

def can_build(nums, must_have)
  return true if must_have.empty?

  must_have = must_have.join.split("").map { |s| s.to_i }.sort.tally
  indices_and_numbers = (0..9).zip(nums).to_h

  return false if must_have.keys.any? { |key| indices_and_numbers[key] == 0 }

  p must_have

  indices_and_numbers = indices_and_numbers.select { |k, v| must_have.include?(k) }

  must_have.each do |key, value|
    if indices_and_numbers[key] < value
      return false
      end
  end

  true
end
p can_build([0, 1, 2, 2, 3, 0, 0, 0, 1, 1], [123, 444, 92]) == true
p can_build([10, 2, 3, 8, 5, 8, 5, 5, 3, 1], [11, 2, 22, 49, 444, 998, 87, 44]) == false
p can_build([0, 0, 0, 0, 0, 0, 0, 0, 0, 0], []) == true
p can_build([0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [3]) == false

puts
# another close solution
def can_build(nums, must_have)
  return true if must_have.empty?

  must_have = must_have.join.split("").map { |s| s.to_i }.sort.tally
  indices_and_numbers = (0..9).zip(nums).to_h

  return false if must_have.keys.any? { |key| indices_and_numbers[key] == 0 }

  indices_and_numbers = indices_and_numbers.select { |k, _| must_have.include?(k) }
  
  result = []
  must_have.each do |key, value|
    if indices_and_numbers[key] < value
      result << false
    else
      result << true
    end
  end

  result.all? {|elem| elem == true } ? true : false
end
p can_build([0, 1, 2, 2, 3, 0, 0, 0, 1, 1], [123, 444, 92]) == true
p can_build([10, 2, 3, 8, 5, 8, 5, 5, 3, 1], [11, 2, 22, 49, 444, 998, 87, 44]) == false
p can_build([0, 0, 0, 0, 0, 0, 0, 0, 0, 0], []) == true
p can_build([0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [3]) == false


# solving once again a day later
=begin
You are given an array representing the number of 0s, 1s, 2s, ..., 9s you have. The function will look like:

can_build([#0s, #1s, #2s, ..., #9s], [num1, num2, ...])

Write a function that returns true if you can build the following numbers using only the digits you have.

can_build([0, 1, 2, 2, 3, 0, 0, 0, 1, 1], [123, 444, 92]) ➞ true

# You have: one 1, two 2s, two 3s, three 4s, one 8 and one 9
# Using only these digits, you can build 123, 444, and 92
P:
- write a method that takes 2 arguments, both arrays
- 1st array represents the number of integers I have, e.g. I have 0 zeros, 1 ones, 2 twos, 2 threes, 3 fours, etc.
- the 2nd array has numbers that I need to build out of the numbers in the first array

Notes:
hash, tally, zip

DS:
input: 2 arrays
middle: hash
output: true/false

A:
- return true if the 2nd array is empty

-process 2nd array - join it to string, split on a char and transform into integers - that way I have an array of integers that I need
- count those integers and store the results in a hash `must_have in the form key: what integer, value: how many I need

-process 2nd array, zip it numbers 0..9, which signify indices with the number that I have, which signify counts
- store results in available

- now I have  2 hashes
- remove from `available_nums` the keys that are not there in `must_have`
- iterate over the `must_have` hash with block variables key, value
- check if the value that is present for the key is greater or equal than the value that we have in 1`available`
- if not, return false

- else return true
=end

puts

def can_build(available_nums, must_have_nums)
  return true if must_have_nums.empty?

  must_have_nums = must_have_nums.join.split("").map(&:to_i).tally
  available_nums = (0..9).zip(available_nums).to_h.select! { |key, _| must_have_nums.include?(key) }
  
  must_have_nums.each do |key, value|
    return false if available_nums[key] < value
  end

  true
end
p can_build([0, 1, 2, 2, 3, 0, 0, 0, 1, 1], [123, 444, 92]) == true
p can_build([10, 2, 3, 8, 5, 8, 5, 5, 3, 1], [11, 2, 22, 49, 444, 998, 87, 44]) == false
p can_build([0, 0, 0, 0, 0, 0, 0, 0, 0, 0], []) == true
p can_build([0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [3]) == false
