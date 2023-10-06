=begin
Create a function that takes a variable number of arguments, each argument representing the number of items in a group.
The function should return the number of permutations (combinations) of choices
you would have if you selected one item from each group.

-input may include zero

combinations(2, 3) ➞ 6

combinations(3, 7, 4) ➞ 84

combinations(2, 3, 4, 5) ➞ 120

P:
- the method takes a variable number of arguments
- each arg represents the number of items in a group
- method returns the number of permutations (combinations) of choices we'd have if we selected 1 item from each group

E:
combinations(2, 3) == 6
combinations(3, 7, 4) == 84
combinations(2, 3, 4, 5) == 120

DS:
- input: numbers
- output: an integer

A:
- it looks like I need to return a product of all the numbers in the input array

- I will do it by multiplying each number by the next one - so a product of all the numbers in the input array
=end
def combinations(*nums)
  p nums         #how does this become an array? via the * used before nums
  nums.inject(:*)
end
p combinations(2, 3) == 6
p combinations(3, 7, 4) == 84
p combinations(2, 3, 4, 5) == 120