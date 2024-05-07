#
# Problem 7
# Create a method that takes an array of integers as an argument and returns the number of identical pairs of integers in that array. For instance, the number of identical pairs in [1, 2, 3, 2, 1] is 2: there are two occurrences each of both 2 and 1.
#
# If the array is empty or contains exactly one value, return 0.
#
# If a certain number occurs more than twice, count each complete pair once. For instance, for [1, 1, 1, 1] and [2, 2, 2, 2, 2], the method should return 2. The first array contains two complete pairs while the second has an extra 2 that isn't part of the other two pairs.
#
# p pairs([3, 1, 4, 5, 9, 2, 6, 5, 3, 5, 8, 9, 7]) == 3
# p pairs([2, 7, 1, 8, 2, 8, 1, 8, 2, 8, 4]) == 4
# p pairs([]) == 0
# p pairs([23]) == 0
# p pairs([997, 997]) == 1
# p pairs([32, 32, 32]) == 1
# p pairs([7, 7, 7, 7, 7, 7, 7]) == 3
#
# Problem
# =======
# -method takes an array of integers as an arguemnt
# -array can be empty or contain same values
# -method returns the NUMBER OF IDENTICAL PAIRS
# [1, 2, 3, 2, 1] => 2 because we have two ones and two twos
# -if array is empty or contains only 1 values, method returns 0
# -if a num occurs more than twice, count each complete pair only once
# [1, 1, 1, 1] => 2
# [2, 2, 2, 2, 2] => 2
#
# Examples
# =========
# p pairs([3, 1, 4, 5, 9, 2, 6, 5, 3, 5, 8, 9, 7]) == 3
# => 2, 5, 9
#
# p pairs([2, 7, 1, 8, 2, 8, 1, 8, 2, 8, 4]) == 4
# => 2, 1 and 2 pairs of 8 => 4
#
# p pairs([]) == 0
# p pairs([23]) == 0
# => empty or just 1 number
#
# p pairs([997, 997]) == 1
# p pairs([32, 32, 32]) == 1
# p pairs([7, 7, 7, 7, 7, 7, 7]) == 3
#
# Algorithm
# ==========
# COUNT each number, store the count in a hash `count`
# key:uniq number, value: count
#
# INIT `sum`
#
# ITERATE over the `count` hash
# -if value is greater or equal to 2, divide the value by 2 and add increase sum by this result
#
# RETURN `sum`

def pairs(array)
  counts = array.tally

  sum = 0
  counts.each do |_number, count|
    sum += count / 2 if count >= 2
  end

  sum
end

p pairs([3, 1, 4, 5, 9, 2, 6, 5, 3, 5, 8, 9, 7]) == 3
p pairs([2, 7, 1, 8, 2, 8, 1, 8, 2, 8, 4]) == 4
p pairs([]) == 0
p pairs([23]) == 0
p pairs([997, 997]) == 1
p pairs([32, 32, 32]) == 1
p pairs([7, 7, 7, 7, 7, 7, 7]) == 3

puts

def pairs(array)
  sum = 0

  array.tally.values.each do |value|
    sum += value / 2 if value >= 2
  end

  sum
end

p pairs([3, 1, 4, 5, 9, 2, 6, 5, 3, 5, 8, 9, 7]) == 3
p pairs([2, 7, 1, 8, 2, 8, 1, 8, 2, 8, 4]) == 4
p pairs([]) == 0
p pairs([23]) == 0
p pairs([997, 997]) == 1
p pairs([32, 32, 32]) == 1
p pairs([7, 7, 7, 7, 7, 7, 7]) == 3
