# In this Kata, you will be given an array of integers whose elements have both a negative and a positive value,
# except for one integer that is either only negative or only positive.
# Your task will be to find that integer.
#
#   Examples:
#
#    [1, -1, 2, -2, 3] => 3
# 3 has no matching negative appearance
#    [-3, 1, 2, 3, -1, -4, -2] => -4
#     -4 has no matching positive appearance
#   [1, -1, 2, -2, 3, 3] => 3
#    (the only-positive or only-negative integer may appear more than once)
#
# A:
# how to find a number that appears only in 1 form????
# iterate over the Array
# if an integer is positive does it have its negative form in the array?
#   if not, return it
#   -if integer is negative, does it have it's positive form in the array?
#   if not, return it

def solve(arr)
  arr.each do |number|
    if number.negative? && !arr.include?(number.abs)
      return number
    elsif number.positive? && !arr.include?(-number)
      return number
    end
  end
end

p solve([1,-1,2,-2,3]) == 3
p solve([-3,1,2,3,-1,-4,-2]) == -4
p solve([1,-1,2,-2,3,3]) == 3
p solve([-110,110,-38,-38,-62,62,-38,-38,-38]) == -38
p solve([ -9,-105,-9,-9,-9,-9,105]) == -9