# Write a method that takes a pair of integers as arguments, x and y. Remove y digits of x without reordering the digits of x such that you get the smallest possible value z, and return z.

# Problem
# ========
# -method takes 2 arguments, a number and a number of digits to remove
# -method removes the indicated number of digits (different possibilities)
# -method returns the smallest digits from the ones created

# Examples:
# shrink(1358210, 1) => 135210
# -358210
# 1-58210
# 13-8210
# 135-210
# 1358-10
# 13582-0
# 35821- => which one is smallest? 135-210
# shrink(1358210, 2) => 13210
# --58210
# 1--8210
# 13--210
# 135--10
# 1358--0
# 13582--=> which one is smallest? 13--210 remove overlapping numbers, remove counter + 1
# shrink(1358210, 3) => 1210
# ---8210
# 1---210
# 13---10
# 135---0
# 1358----=> which one is smallest? 1---210
# shrink(1358210, 4) => 110
# ----210
# 1----10
# 13----0
# 135----
# => which one is smallest? 1----10

# WRONG APPROACH, SHOULD HAVE ANALYZED ALL TEST CASES!!!
# p shrink(1358210, 1) == 135210
# p shrink(1358210, 2) == 13210
# shrink(1358210, 3) == 1210
# p shrink(1358210, 4) == 110
# p shrink(135089, 1) == 13089
# p shrink(135089, 2) == 1089
# p shrink(135089, 3) == 89
# p shrink(135089, 4) == 8 #returns false coz ---08-
# Algorithm
# =========
# -TRANSFORM 1st num to a string
# -make a copy of the str
# -iterate over the original str
# -remove indicated by 2nd argument number of elements from copy *
# --start with index 0 and remove `numbers_to_delete`
# --start with index 1 and remove `numbers_to_delete`
# --start with index 2 and remove `numbers_to_delete`
# --start with index 3 and remove `numbers_to_delete`, etc.

# -if `numbers_to_delete` is more than 1? (in which case we just remove counter)
# -how to remove more than 1 element from the array?
# -save the result as an integer to `all_numbers`

# -RETURN the smallest number from `all_numbers`
def shrink(number, numbers_to_delete)
  string = number.to_s
  all_numbers = []

  counter = 0
  while counter <= string.size - numbers_to_delete
    arr = string.dup.chars
    arr.slice!(counter, numbers_to_delete)
    all_numbers << arr.join.to_i
    # p all_numbers
    counter += 1
  end

  all_numbers.min
end
p shrink(1_358_210, 1) == 135_210
p shrink(1_358_210, 2) == 13_210
shrink(1_358_210, 3)
p shrink(1_358_210, 4) == 110
p shrink(135_089, 1) == 13_089
p shrink(135_089, 2) == 1089
p shrink(135_089, 3) == 89
p shrink(135_089, 4) == 8 # returns false coz ---08-
# ----89
# 1----9
# 135----

puts
# Correct Algorithm
# ===================
# High level
# -----------
# FIND the first digit which is followed by a smaller digit or that is the last digit
# delete the digit
# repeat as many times as is specified by the second input integer
# return the integer

# With more detail:
# ------------------
# Find the first digit which is followed by nil or a smaller digit:

# convert the first input integer to an array of characters and save as a variable arr_integers
# iterate over each character with its index and see if the following digit is smaller or if this is the last digit.
# Delete the digit:

# delete the digit
# Repeat as many times as is specified by the second input integer:

# create a loop to run second integer times and place find and delete logic in the loop
# Return the integer:

# convert arr_integersto integer

def shrink(int, num_remove)
  arr_int = int.to_s.chars
  num_remove.times do
    arr_int.each_with_index do |num, idx|
      if idx == arr_int.count - 1 || num > arr_int[idx + 1]
        arr_int.delete_at(idx)
        break
      end
    end
  end
  arr_int.join.to_i
end
p shrink(1_358_210, 1) == 135_210
p shrink(1_358_210, 2) == 13_210
shrink(1_358_210, 3)
p shrink(1_358_210, 4) == 110
p shrink(135_089, 1) == 13_089
p shrink(135_089, 2) == 1089
p shrink(135_089, 3) == 89
p shrink(135_089, 4) == 8

puts
puts "Jack's solution"
# - TRANSFORM integer to an array of digits and reverse so that they're in the correct order
# [1, 3, 5, 0, 8, 9] (last test case)
# -prepare all possible combinations of the digits after 4 digits have been removed(so a combination of 2 digits in case of the last test case)
# [[1, 3], [1, 5], [1, 0], [1, 8], [1, 9], [3, 5], [3, 0], [3, 8], [3, 9], [5, 0], [5, 8], [5, 9], [0, 8], [0, 9], [8, 9]]
# -join these combinations to a string and then to integer
# -select and RETURN the smallest

def shrink(x, y)
  x_digits = x.digits.reverse

  removed_digits = x_digits.combination(x_digits.size - y).to_a # combination(6-4)
  removed_digits.map!(&:join).map!(&:to_i)
  removed_digits.min
end
p shrink(1_358_210, 1) == 135_210
p shrink(1_358_210, 2) == 13_210
shrink(1_358_210, 3)
p shrink(1_358_210, 4) == 110
p shrink(135_089, 1) == 13_089
p shrink(135_089, 2) == 1089
p shrink(135_089, 3) == 89
p shrink(135_089, 4) == 8

# my idea
# Algorithm
# ============
# -convert x to `array_of_digits`, reverse to get correct order back
# -get indices from 0 to arr.size - 1
# -make a combination of those indices according to y
# ITERATE over the indices nested (2D) array and at each iteration (array of indices)
# call the helper method that deals with removing all indices (indicated in 1 subarray) from the copy of the array and returns a ready integer after converting the array to a string and then to integer

# -write a separate HELPER METHOD for removing all the necessary indices from the copy of the array
# - make a copy of the array and from that copy
# --remove numbers at those indices or replace them with ''
# -- join to get a str, convert to int
# --return the smallest int of those created

def remove_selected_indices(array_of_digits, array_of_indices)
  copy = array_of_digits.dup
  copy.each.with_index do |_n, index|
    copy[index] = '' if array_of_indices.include?(index)
  end
  copy.compact.join.to_i
end
# p remove_selected_indices([1, 3, 5, 0, 8, 9], [0, 3, 4, 5])

def shrink(x, y)
  array_of_digits = x.digits.reverse

  indices = []
  array_of_digits.size.times do |index|
    indices << index
  end

  all_indices = indices.combination(y).to_a

  generated_nums = []
  all_indices.each do |subarray|
    generated_nums << remove_selected_indices(array_of_digits, subarray)
  end

  generated_nums.min
end
# p shrink(1358210, 1) #== 135210
# p shrink(1358210, 2) == 13210
# p shrink(1358210, 3) == 1210
# p shrink(1358210, 4) == 110
# p shrink(135089, 1) == 13089
# p shrink(135089, 2) == 1089
# p shrink(135089, 3) == 89
p shrink(135_089, 4) #== 8
