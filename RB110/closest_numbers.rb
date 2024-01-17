=begin
# Write a method that takes an array of integers and returns the
# two numbers that are closest together in value.

PEDAC
P:
- write a method that takes an array of integers as an argument
- method returns the 2 numbers that are closest in value

# Examples:
p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
5-25=5
5-15=10
5-11=6
5-20=15
*25-15=10
*25-11=14
*25-20=5
--15-11=4 => 15, 11 are closest in value
--15-20=5
&&&11-20=8

p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]

# The tests above should print "true".

DS:
input: array of integers
output: an array of integers closest in value

A:
- create hash_result
- create `pairs`

- iterate over the array, starting with index 0 up to arr.size exclusive - 1, this is outer iteration
- finish this outer iteration at the one but last number
- iterate again, starting from the number at the starting_index + 1 up to arr.size exclusive
- populate the `pairs` array with sliced pairs
- slice at the initial index

- subtract in pairs one int  from another and find out what is the absolute value of the result
- return the min absolute value

- save into the hash, pair(key) and their absolute difference
- for the least value, return the key
=end
def closest_numbers(arr)
  h= {}
  pairs = []

  (0...arr.size).each do |first_number|
    (first_number.next...arr.size).each do |second_number|
      # p "starting is #{starting_number}"
      # p "ending is #{ending_number}"
      pairs << [arr[first_number], arr[second_number]]
    end
  end

  pairs.each do |pair|
    h[pair] = (pair[0] - pair[1]).abs
  end

  least_value = h.values.min

  h.each do |k, v|
    return k if v == least_value
  end

end
p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]