=begin
Sort Even-Odds

You are given a 0-indexed integer array nums. Rearrange the values of nums according to the
following rules:
1. Sort the values at odd indices of nums in non-increasing order.
** sort odd index in descending order
For example, if nums = [4,1,2,3] before this step, it becomes [4,3,2,1] after. The values at odd
indices 1 and 3 are sorted in non-increasing order.
2. Sort the values at even indices of nums in non-decreasing order.
** sort even idx nums in increasing order
For example, if nums = [4,1,2,3] before this step, it becomes [2,1,4,3] after. The values at even
indices 0 and 2 are sorted in non-decreasing order.

Return the array formed after rearranging the values of nums.

Example 1:
Input: nums = [4,1,2,3]
Output: [2,3,4,1]
Explanation:
First, we sort the values present at odd indices (1 and 3) in decreasing order.
So, nums changes from [4,1,2,3] to [4,3,2,1].
Next, we sort the values present at even indices (0 and 2) in increasing order.
So, nums changes from [4,1,2,3] to [2,3,4,1].
Thus, the array formed after rearranging the values is [2,3,4,1].
Example 2:
Input: nums = [2,1]
Output: [2,1]
Explanation:
Since there is exactly one odd index and one even index, no rearrangement of values takes
place.
The resultant array formed is [2,1], which is the same as the initial array.
input: an array of integers.
output: a sorted array
=begin pedac

*************Problem********************
Overall goal: To write a method that takes an array of nums, sorts the odd index nums in descending order, sorts the
even index nums in ascending order. Then returns this newly sorted array
initial input: array of nums
overall output: new array of nums, sorted

explicit requirements:
input array: contains only integers
return array: sorted
  sort criteria: odd index nums are sorted descending, even idx nums are sorted ascending


implicit requirements:
arr of size 2 will return itself
all other arrays are size 4
questions:

**********Examples/Test cases************
odd: sort descending
even: sort ascending

sort_even_odd([1,3,5,4]) == [1,4,5,3]
** odd idx:  3, 4 => 4, 3
  even idx: 1, 5 => 1, 5
sort_even_odd([4,1,2,3]) == [2,3,4,1]
** odd idx: 1, 3 => 3, 1
    even idx: 2, 4 => 2, 4
sort_even_odd([2,4,1,78]) == [1,78,2,4]
sort_even_odd([2,1]) == [2,1]
** 2 item arr returns itself



*************Data Structure**************
array > new array

***************Algorithm*****************
Overall approach:
define a method with 1 param, array
select the even idx ele, sort them ascending
select the odd idx ele., sort them decending
zip the 2 arrays together

=end

# def sort_even_odd(array)
#   even = array.select.with)
# end
#
# p sort_even_odd([1,3,5,4]) # == [1,4,5,3]
# p sort_even_odd([4,1,2,3]) == [2,3,4,1]
# p sort_even_odd([2,4,1,78]) == [1,78,2,4]
# p sort_even_odd([2,1]) == [2,1]

# how about partition and then sort and then zip


def sort_even_odd(array)
  even = array.select.with_index { |ele, idx| idx.even? }.sort
  odd = array.select.with_index { |ele, idx| idx.odd? }.sort.reverse
  even.zip(odd).flatten
end

p sort_even_odd([1, 3, 5, 4]) == [1, 4, 5, 3]
p sort_even_odd([4, 1, 2, 3]) == [2, 3, 4, 1]
p sort_even_odd([2, 4, 1, 78]) == [1, 78, 2, 4]
p sort_even_odd([2, 1]) == [2, 1]
