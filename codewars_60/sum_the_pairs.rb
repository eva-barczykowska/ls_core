
=begin
# https://www.codewars.com/kata/54d81488b981293527000c8f/train/ruby
Given a list of integers and a single sum value, return the first two values (parse from the left please) in order of appearance that add up to form the sum.

If there are two or more pairs with the required sum, the pair whose second element has the smallest index is the solution.

Negative numbers and duplicate numbers can and will appear.

8:28
P 
Input: array of integer, integer sum 
Output: array with 2 integers or nil 

Rules:
- find all pairs in Array
- then return that pair which sum is equal to the second arg 
- return nil if there is no such pair of ints 


E 
[1, 4, 8, 7, 3, 15], 8 => 
1 + 4 = 5
1 + 8 = 9
1 + 7 = 8
1 + 3 = 4
1 + 15 = 16

4 + 8 = 12
4 + 7 = 11
4 + 3 = 7
4 + 15 = 19

8
7
3
15 (we do not need the last single num)


[20, -13, 40], -7 => 
20 + -13 = 7
20 + 40 = 60
-13 + 40 = 27

D 
input: array and Integer
middle: subarrays to form all possible pairs, main Array
end: return subarrays

A 
- FIND all pairs of nums
  - create a nested loop 
  - outer loop is # array.size.times method with first num in a pair 
  - inner loop with first num + 1 #upto array size - 1 and it's a second num in a pair 
  - add them in a new empty array as a subarray
- SELECT  by sum which equal to the second arg 
  - iterate with each
  - by iteration find the sum and check if it is equal to the second arg
- RETURN pair when it found this sum
=end

l1= [1, 4, 8, 7, 3, 15]
l2= [1, -2, 3, 0, -6, 1]
l3= [20, -13, 40]
l4= [1, 2, 3, 4, 1, 0]
l5= [10, 5, 2, 3, 7, 5]
l6= [4, -2, 3, 3, 4]
l7= [0, 2, 0]
l8= [5, 9, 13, -3]

def sum_pairs(array, sum)
  pairs = {}
  array.size.times do |first|
    (first + 1).upto(array.size - 1) do |second|
      pairs[[array[first], array[second]]] = [first, second]
    end
  end

  selected = pairs.select do |k, v|
    k.sum == sum
  end

  if !selected.empty?
    selected.min_by { |k, v| v[1] }[0]
  else
    nil
  end
end

p sum_pairs(l1, 8) == [1, 7]
p sum_pairs(l2, -6) == [0, -6]
p sum_pairs(l3, -7) == nil
p sum_pairs(l4, 2) == [1, 1]
p sum_pairs(l5, 10) == [3, 7]
p sum_pairs(l6, 8) == [4, 4]
p sum_pairs(l7, 0) == [0, 0]
p sum_pairs(l8, 10) == [13, -3]
