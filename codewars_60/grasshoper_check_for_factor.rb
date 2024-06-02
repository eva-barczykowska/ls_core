# Don't change the order of the elements that are left.

# Problem
# This function should test if the factor is a factor of base.

# Return true if it is a factor or false if it is not.

# About factors
# Factors are numbers you can multiply together to get another number.

# 2 and 3 are factors of 6 because: 2 * 3 = 6

# You can find a factor by dividing numbers. If the remainder is 0 then the number is a factor.
# You can use the mod operator (%) in most languages to check for a remainder
# For example 2 is not a factor of 7 because: 7 % 2 = 1

# NOTE: base is a non-negative number, factor is a positive number.
# Problem
# ========
# -method takes 2 numbers: number and potential factor
# -method returns true/false based on whether the potential factor is a real factor
# -a real factor means tha the number can be evenly divided by this factor

def check_for_factor(number, factor)
  number % factor == 0
end
p check_for_factor(10, 2) == true
p check_for_factor(63, 7) == true
p check_for_factor(2450, 5) == true
p check_for_factor(24_612, 3) == true
p check_for_factor(9, 2) == false
p check_for_factor(653, 7) == false
p check_for_factor(2453, 5) == false
p check_for_factor(24_617, 3) == false
