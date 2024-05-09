# Problem 17
# Create a method that takes an array of integers as an argument. The method should determine the minimum integer value that can be appended to the array so the sum of all the elements equal the closest prime number that is greater than the current sum of the numbers. For example, the numbers in [1, 2, 3] sum to 6. The nearest prime number greater than 6 is 7. Thus, we can add 1 to the array to sum to 7.
#
# Notes:
#
# The array will always contain at least 2 integers.
# All values in the array must be positive (> 0).
# There may be multiple occurrences of the various numbers in the array.
#
# p nearest_prime_sum([1, 2, 3]) == 1        # Nearest prime to 6 is 7
# p nearest_prime_sum([5, 2]) == 4           # Nearest prime to 7 is 11
# p nearest_prime_sum([1, 1, 1]) == 2        # Nearest prime to 3 is 5
# p nearest_prime_sum([2, 12, 8, 4, 6]) == 5 # Nearest prime to 32 is 37
#
# Nearest prime to 163 is 167
# p nearest_prime_sum([50, 39, 49, 6, 17, 2]) == 4
#
# Problem
# ========
# method takes an array of integers as an arg
# -method finds out the MININUM INTEGER VALUE  that can be appened to the array so that teh sum of
# all elements equal to the cloest prime number that is greater than the current sum of integers
#
# -method returns that integer that can be added
#
# Examples
# =========
# p nearest_prime_sum([1, 2, 3]) == 1        # Nearest prime to 6 is 7
# => sum is 6, we need to add 1 to form 7
#
# p nearest_prime_sum([5, 2]) == 4           # Nearest prime to 7 is 11
# => sum is 7, we need to add 4 to form 11
#
# p nearest_prime_sum([1, 1, 1]) == 2        # Nearest prime to 3 is 5
# sum is 3, we need to add 2 to form 5
#
# p nearest_prime_sum([2, 12, 8, 4, 6]) == 5 # Nearest prime to 32 is 37
# sum is 32, we need to add 5 to form 37
#
# Nearest prime to 163 is 167
# p nearest_prime_sum([50, 39, 49, 6, 17, 2]) == 4
# sum is 163, 4 needs to be added to form 167
#
# Algorithm
# -ADD UP numbers in the array to form `sum`
#
# -write helper method `is_prime(n)`
# -return false if 1
# -return false if number divided by numbers from 2 to argument (excluding) doesn't leave a remainder
# -return true
#
#
# INIT `tracking` number to 1 track how many times 1 is added to `sum`
# LOOP
# -with each loop iteration add 1 to `sum`
# -break if no more adding is necessary becasue the num `is prime?`
# -add 1 to `tracking`
# -end loop
#
# -RETURN the `tracking` number
def is_prime?(n)
  (2...n).each do |divisor|
    return false if n % divisor == 0
  end

  true
end
# p is_prime?(11)

def nearest_prime_sum(arr)
  sum = arr.sum

  tracking = 1 # this will track how many loop iterations/how many times we needed to add 1

  loop do
    sum += 1 # increase sum by 1 with each loop iteration
    break if is_prime?(sum) # break if no more increase is needed, return tracking

    tracking += 1
  end

  tracking # return tracking
end
p nearest_prime_sum([1, 2, 3]) == 1        # Nearest prime to 6 is 7
p nearest_prime_sum([5, 2]) == 4           # Nearest prime to 7 is 11
p nearest_prime_sum([1, 1, 1]) == 2        # Nearest prime to 3 is 5
p nearest_prime_sum([2, 12, 8, 4, 6]) == 5 # Nearest prime to 32 is 37
