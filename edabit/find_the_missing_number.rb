# Create a function that takes an array of numbers between 1 and 10 (excluding one number) and returns the missing number.
# Notes
# The array of numbers will be unsorted (not in order).
# Only one number will be missing.
# P:
# - write a method that takes 1 arg, an array from 1 to 10
# - the array will be unsorted
# - the array has 1 missing number
# - there is always only 1 number missing
# - the method finds and returns this number

# N:
# -create a num reference *(1..10)

# A:
# - create a reference of numbers 1..10

# - subtract the array arg from the reference

# - return the result after changing arr to str and to an int

def missing_num(arr)
  all_numbers = *(1..10)

  (all_numbers - arr).join.to_i
end

p missing_num([1, 2, 3, 4, 6, 7, 8, 9, 10]) == 5
p missing_num([7, 2, 3, 6, 5, 9, 1, 4, 8]) == 10
p missing_num([10, 5, 1, 2, 4, 6, 8, 3, 9]) == 7