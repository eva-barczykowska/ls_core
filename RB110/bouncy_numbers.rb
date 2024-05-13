# =begin
# BOUNCY NUMBERS
# Some numbers have only ascending digits, like 123, 3445, 2489, etc.
# Some numbers have only descending digits, like 321, 5443, 9842, etc.
# A number is "bouncy" if it has both ascending and descending digits, like 313, 92543, etc.
# Write a method that takes a list of numbers and counts how many of them are bouncy.

# Input : Array (of nums)
# Output: Integer (The number of nums from input that are bouncy)

# Problem
# ========
# numbers can be ascending --123, 3445
# or descending 321, 5443
# or bouncy 313, 92543 when it's neither descendign or ascending
# our task is to find bouncy numbers and return how many there are in the argument array
# BOUNCY NUMBER has to have ascending and descending part in them

# Examples
# ========

# # p bouncy_count([]) == 0
# => empty array returns 0

# # p bouncy_count([11, 0, 345, 21]) == 0
# => if 1 digit number, return false so dont count this number
# => if digits in a number all same, return false so don't count this number
# => if descending or ascenging, return false
# => seems I need to have at least 3 digits to establish if a number is bouncsy?

# THEORY
# =======
# ascending- all the numbers are equal or greater than the previous one
# descending - all the numbers are equal or smaller than the previous one
# what is not ascending or descending, will be bouncy, provided it's at least 3 digits long

# Examples
# ==========
# analyze all examples!
# # p bouncy_count([121, 4114]) == 2
# [1, 2] [2,1]
# [4,1] [1,1] [1,4]

# =>if digit is same as previous
# # p bouncy_count([176, 442, 80_701_644]) == 2

# Algorithm
# ========
# WRITE 2 helper methods, `ascending?` and `descending?`
# INIT `result`
# TRANSFORM number argument to `number_array`
# INIT `index` to 1
# ITERATE over the numbers in `number_array`
# ASK if all the numbers from index to current index are SMALLER/EQUAL than the number at the current index
# there will be multiple iterations, save the return value of each of these iterations to `result`

# ASK if `result` has all true values, if yes, this means that the number is ascending and method returns true implicitly

# ++++now to the same for `descending`

# main method
# ===========
# INIT `count`
# ITERATE over the numbers
# -increase `count` if number is not ascending or descending (coz that means it's bouncy!)

# RETURN `count`

# =end
# def ascending?(num)
#   result = []
#   number_array = num.digits.reverse
#   index = 1

#   while index < number_array.size
#    result <<  number_array[0..index].all? { |num| num <= number_array[index] }
#    index += 1
#   end
#   result.all? { |e| e == true }
# end

# # p ascending?(123)
# # p ascending?(321)

# def descending?(num)
#   result = []
#   number_array = num.digits.reverse
#   index = 1

#   while index < number_array.size
#    result <<  number_array[0..index].all? { |num| num >= number_array[index] }
#    index += 1
#   end
#   result.all? { |e| e == true }
# end
# # p descending?(123)
# # p descending?(321)

# # def bouncy_count(arr)
# #   return 0 if arr.empty?
# #   count = 0

# #  arr.each do |num|
# #   if num.to_s.size < 3
# #     next
# #   elsif !ascending?(num) && !descending?(num)
# #   count += 1
# #   end
# # end

# #   count
# # end

# # p bouncy_count([]) == 0
# # p bouncy_count([11, 0, 345, 21]) == 0
# # p bouncy_count([121, 4114]) == 2
# # p bouncy_count([176, 442, 80_701_644]) == 2

# #refactor

# def bouncy_count(arr)
#   count = 0

#  arr.each { |num| count += 1 if !ascending?(num) && !descending?(num) }

#   count
# end

# p bouncy_count([]) == 0
# p bouncy_count([11, 0, 345, 21]) == 0
# p bouncy_count([121, 4114]) == 2
# p bouncy_count([176, 442, 80_701_644]) == 2

# # puts Jack's solution
# def bouncyCount(nums)
#   nums.count { |num| any_ascending_digits?(num) && any_descending_digits?(num) }
# end

# def any_ascending_digits?(num)
#   digits = num.digits

#   digits.each_with_index do |digit, ind|
#     next if ind == 0 # we can use next to skip index, remember that
#     return true if digit > digits[ind-1]
#   end

#   false
# end

# def any_descending_digits?(num)
#   digits = num.digits

#   digits.each_with_index do |digit, ind|
#     next if ind == 0
#     return true if digit < digits[ind-1]
#   end

#   false
# end
# p bouncy_count([]) == 0
# p bouncy_count([11, 0, 345, 21]) == 0
# p bouncy_count([121, 4114]) == 2
# p bouncy_count([176, 442, 80_701_644]) == 2

puts 'his second solution'

def bouncy_count(nums)
  nums = nums.map(&:digits) # e.g. [[6, 7, 1], [2, 4, 4], [4, 4, 6, 1, 0, 7, 0, 8]]
  p nums

  num_combos = nums.map do |num|
    digit_combos = []
    num.each_cons(2) { |digit_combo| digit_combos << digit_combo }
    digit_combos
  end
  p num_combos
  # num_combos.select { |digit_combos| is_bouncy?(digit_combos) }#.size
end

def is_bouncy?(digit_combos)
  return false unless digit_combos.any? { |digit_combo| digit_combo.first > digit_combo.last }
  return false unless digit_combos.any? { |digit_combo| digit_combo.first < digit_combo.last }

  true
end
# p bouncy_count([]) == 0
# p bouncy_count([11, 0, 345, 21]) == 0
# p bouncy_count([121, 4114]) #== 2
p bouncy_count([176, 442, 80_701_644]) == 2
