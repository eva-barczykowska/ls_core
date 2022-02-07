# Write a method that searches for all multiples of 3 or 5 that lie between 1
# and some other number, and then computes the sum of those multiples.
# For instance, if the supplied number is 20, the result should be 98
# (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).
#
# You may assume that the number passed in is an integer greater than 1.

# Explicit requirements:
# -a method
# -gives you all multiples of 3 and 5 that lie between 1 and the given number
# and then computes the sum of those multiples
#
# Data structures:
# Input: integer
# Output: integer
#
# Algorithm:
# -find out how many 3s in the number?
# -find out how many 5s in the number?
# print the result so 3, 6, 9,etc.
# - a counter
# -while the counter < than the number
# if counter / 3 or counter / 5, add this COUNTER to the result array
# - add to the result array multiples of 3
# - add to the result array multiples of 5
# - sum the elements in the array

def multisum(num)
  res = []
  counter = 0
  while counter <= num
    if counter % 3 == 0
      res << counter
    elsif counter % 5 == 0
      res << counter
    end
    counter += 1
  end
  res.sum
end

p multisum(3) == 3 #(3 + 0 = 3)
p multisum(5) == 8 #(3 + 5 = 8)
p multisum(10) == 33 #(3 + 6 + 9 + 5 + 10)
p multisum(1000) == 234168
