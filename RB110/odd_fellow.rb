#
# Create a method that takes an array of integers as an argument and returns the integer that appears an odd number of times. There will always be exactly one such integer in the input array.
#
# Problem
# =======
# -method takes an array of integers, could be negative
# -mehtod returns the integers that appears an odd number of times
# -(there will be always exactly 1)
#
# Exampls
# ========
# p odd_fellow([4]) == 4
# 1 time, 1 is odd
# p odd_fellow([7, 99, 7, 51, 99]) == 51
# => 51 appears 1 time
# p odd_fellow([7, 99, 7, 51, 99, 7, 51]) == 7
# =>51
# p odd_fellow([25, 10, -6, 10, 25, 10, -6, 10, -6]) == -6
# -6 appears 3 times
# p odd_fellow([0, 0, 0]) == 0
# => 0 appears 3 times
#
# Algorithmn
# ==========
# COUNT integers, store resutls in a hash
#
# ITERATE over the hash
# -1 key will have the odd value
#
# RETURN that key

def odd_fellow(arr)
  arr.tally.each { |key, value| return key if value.odd? }
end
p odd_fellow([4]) == 4
p odd_fellow([7, 99, 7, 51, 99]) == 51
p odd_fellow([7, 99, 7, 51, 99, 7, 51]) == 7
p odd_fellow([25, 10, -6, 10, 25, 10, -6, 10, -6]) == -6
p odd_fellow([0, 0, 0]) == 0
