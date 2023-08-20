# Write a function that takes an array of numbers (integers for the tests) and a target number. It should find two different items in the array that, when added together, give the target value. The indices of these items should then be returned in a tuple / list (depending on your language) like so: (index1, index2).

# For the purposes of this kata, some tests may have multiple answers; any valid solutions will be accepted.

# The input will always be valid (numbers will be an array of length 2 or greater, and all of the items will be numbers; target will always be the sum of two different items from that array).
# P:
# -write a method that takes 2 arguments, an array and an integer
# -any 2 numbers from that array, when added together, should give the sum == integer
# -then the indices of those items should be returned in an an array
# -more than 1 answer is possible (find first combination?)

# E:
# two_sum([1, 2, 3], 4) == [0, 2]
# 1+2 = 3
# 1+3 = 4 => so indices of 1 and 3 are [0, 2]
# 2+3 = 5

# DS:
# -input: an array and an integer
# -output: an array

# A:
# -iterate to get combinations of all the numbers
# how to iterate?
# 1st num + 2nd, 1st + 3rd, 1st + 4th etc. until the end of array, ie. THE ONE BUT LAST ELEMENT OF THE ARRAY,
# then
# 2nd num + 3rd, 2nd num + 4th, 2nd num + 5th etc. until the end of array e. THE ONE BUT LAST ELEMENT OF THE ARRAY,

# -while iterating, if the num of the 2 numbers is equal to target, return the indices of these
# 2 number
# -find the first sum of 2 integers equal to the 2nd argument
# -find and return the index of these 2 integers
# -if same numbers occur at different indices? we need to find all indices of those number, i.e.
# find the index of each number that makes this sum

# -loop over all the combinations and if a number at certain index and number at another index make the sum, return their indices
def two_sum(numbers, target)

  (0...(numbers.size - 1)).each do |index1| # finish at the second last index
    ((index1 + 1)...numbers.size).each do |index2| #take the number at the next index to add, not same index
      if [numbers[index1], numbers[index2]].sum == target
        return [index1, index2]
      end
    end
  end

end

p two_sum([1, 2, 3], 4) == [0, 2]
p two_sum([1, 2, 3], 4) == [0, 2]
p two_sum([1234, 5678, 9012], 14690) ==[1, 2]
p two_sum([2, 2, 3], 4) == [0, 1]

puts

#refactor
def two_sum(numbers, target)

  (0...(numbers.size - 1)).each do |index1| # finish at the second last index
    ((index1 + 1)...numbers.size).each do |index2| #take the number at the next index to add, not same index
      return [index1, index2] if [numbers[index1], numbers[index2]].sum == target
    end
  end
end

p two_sum([1, 2, 3], 4) == [0, 2]
p two_sum([1, 2, 3], 4) == [0, 2]
p two_sum([1234, 5678, 9012], 14690) ==[1, 2]
p two_sum([2, 2, 3], 4) == [0, 1]