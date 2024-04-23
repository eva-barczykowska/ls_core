# Given 2 two arguments of an array of numbers and a number, find
# all the pairs that results in the forming a triangle with the number.
#
# Note: To determine if three numbers form a triangle you have to
# use the Triangle Inequality Theorem, which states that the sum of
# two side lengths of a triangle is always greater than the third side.
#
# If this is true for all three combinations of added side lengths, then
# you will have a triangle.
#
# Problem:
# -I have an array of numbers and a number (2nd argument)
# -out of this, find all pairs that result in forming triangles with the number
#
# -rule for a triangle: sum of (a + b) > c, || a + c > b, (b + c) > a
#
# E:
# p find_triangle_pairs([2, 3, 4, 5], 7).inspect #  == [ [ 3, 5 ], [ 4, 5 ] ]
# =>
# 2,3
# 2,4
# 2,5
# -3,4
# -3,5 *
# --4,5 * => 8 > 7, therefore  [ 3, 5 ], [ 4, 5 ]
#
# (a + b) > c, || a + c > b, (b + c) > a
#
# p find_triangle_pairs([1, 2, 3, 4], 10).inspect # ==  []
# => because a + b > c
#
# p find_triangle_pairs([7, 10, 12, 15], 9).inspect #==  [ [ 7, 10 ], [ 7, 12 ], [ 7, 15 ], [ 10, 12 ], [ 10, 15 ], [ 12, 15 ] ]
# 7,10
# 7,12
# 7,15
# -10,12
# -10,15
# --12,15 all of them are greater when summed
#
# p find_triangle_pairs([8, 2, 5, 6, 3], 4).inspect #==  [ [ 8, 5 ], [ 8, 6 ], [ 2, 5 ], [ 2, 3 ], [ 5, 6 ], [ 5, 3 ], [ 6, 3 ] ]
# 8,2 *not this
# a = 8,b=5 c=4 || (8 + 5) > 4, || 8 + 4 > 5, (5 + 4) > 8
# 8,6
# 8,3
# -2,5
# -2,6
# -2,3 not this
# --5,6
# --5,3
# ---6,3
#
# for every pair assign to a, b and c and do the calculation
#
# Algorithm
# -GET all possible pairs
# -ITERATE over pairs
# --assign numbers to a, b and c
# --verify that (a + b) > c, AND a + c > b AND (b + c) > a
# --if they are all TRUE, add the pair to the `result` array
# -else move on to the next pair-array
#
# RETURN result
#
# -----ask if I got it right

def find_triangle_pairs(arr, c)
  result = []
  all_pairs = []

  (0...arr.size - 1).each do |start|
    (start + 1...arr.size).each do |finish|
      all_pairs << [arr[start], arr[finish]]
    end
  end

  all_pairs.each do |pair|
    a = pair[0]
    b = pair[1]
    result << pair if (a + b) > c && a + c > b && (b + c) > a
  end

  result
end
p find_triangle_pairs([2, 3, 4, 5], 7) == [[3, 5], [4, 5]]
p find_triangle_pairs([1, 2, 3, 4], 10) == []
p find_triangle_pairs([7, 10, 12, 15], 9) ==  [[7, 10], [7, 12], [7, 15], [10, 12], [10, 15], [12, 15]]
p find_triangle_pairs([8, 2, 5, 6, 3], 4) ==  [[8, 5], [8, 6], [2, 5], [2, 3], [5, 6], [5, 3], [6, 3]]
