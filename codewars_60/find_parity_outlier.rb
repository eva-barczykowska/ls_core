=begin
[Kata Stats: Find The Parity Outlier \| Codewars](https://www.codewars.com/kata/5526fc09a1bbd946250002dc)
6 kyu
You are given an array (which will have a length of at least 3, but could be very large) containing integers.
The array is either entirely comprised of odd integers or entirely comprised of even integers except for a single integer N.
Write a method that takes the array as an argument and returns this "outlier" N.

 Examples
[2, 4, 0, 100, 4, 11, 2602, 36]
Should return: 11 (the only odd number)

[160, 3, 1719, 19, 11, 13, -21]
Should return: 160 (the only even number)

P:
Input: an array
output: an odd number, or an even number

A:
- take 3 numbers and save to an array
- count the even numbers

- if the result is 1, find the even number and return it
- else find and return the odd number
=end
# code that is not taking into account
#
def find_outlier(arr)
  sample = arr.sample(3).count { |n| n.even? }

  if sample > 1
    return arr.find { |n| n.odd? }
  else
    return arr.find { |n| n.even? }
  end
end

p find_outlier([2, 3, 5]) == 2
p find_outlier([2, 2, 3]) == 3
p find_outlier([160, 3, 1719, 19, 11, 13, -21]) == 160
p find_outlier([2, 4, 0, 100, 4, 11, 2602, 36]) == 11


puts
def find_outlier(arr)
  sample = arr.sample(3).select { |n| n.even? }
  # p sample
  sample.size > 1 ? arr.find { |n| n.odd? } : arr.find { |n| n.even? }
end

p find_outlier([2, 3, 5]) == 2
p find_outlier([2, 2, 3]) == 3
p find_outlier([160, 3, 1719, 19, 11, 13, -21]) == 160
p find_outlier([2, 4, 0, 100, 4, 11, 2602, 36]) == 11
