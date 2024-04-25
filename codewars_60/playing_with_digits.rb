# [Train: Playing with digits \| Codewars](https://www.codewars.com/kata/5552101f47fc5178b1000050/train/ruby)
# 6 kyu
# Some numbers have funny properties. For example:
#
# 89 --> 8¹ + 9² = 89 * 1
#
# 695 --> 6² + 9³ + 5⁴= 1390 = 695 * 2
#
# 46288 --> 4³ + 6⁴+ 2⁵ + 8⁶ + 8⁷ = 2360688 = 46288 * 51
#
# Given a positive integer n written as abcd... (a, b, c, d... being digits) and a positive integer p
# we want to find a positive integer k, if it exists, such as the sum of the digits of n taken to the successive powers of p is equal to k * n.
# In other words:
#
# Is there an integer k such as : (a ^ p + b ^ (p+1) + c ^(p+2) + d ^ (p+3) + ...) = n * k
#                                 P = (a ^ p + b ^ (p+1) + c ^(p+2) + d ^ (p+3) + ...)
#                                 P = n * k
#                                 k = P / n
#                                 k = (a ^ p + b ^ (p+1) + c ^(p+2) + d ^ (p+3) + ...) / n
#
# If it is the case we will return k, if not return -1.
# Note: n and p will always be given as strictly positive integers.
#
# dig_pow(89, 1) should return 1 since 8¹ + 9² = 89 = 89 * 1
# dig_pow(92, 1) should return -1 since there is no k such as 9¹ + 2² equals 92 * k
# dig_pow(695, 2) should return 2 since 6² + 9³ + 5⁴= 1390 = 695 * 2
#                                         P : 6² + 9³ + 5⁴ => 1390
#                                         n : 695
#                                         k = P / n
#                                         k = 1390 / 695
# dig_pow(46288, 3) should return 51 since 4³ + 6⁴+ 2⁵ + 8⁶ + 8⁷ = 2360688 = 46288 * 51
#                                         P : 4³ + 6⁴+ 2⁵ + 8⁶ + 8⁷ => 2360688
#                                         n : 46288
#                                         k = P / n
#                                         k = 2360688 / 46288
#
# PEDAC"
# P:
# - write a method that takes 2 integers as an arguments
# - raise the digits from the first integer to consecutive powers, starting from
#   the power expressed by the 2nd argument
# - method finds positive integer k (if it exists) such as the sum of the digits of n taken to the successive powers of p is equal to k*n
# - if there is such an integer, return k, if not, return -1
#
# E:
# 89 --> 8¹ + 9² = 89 * 1
# => 8 do potegi pierwszej + 9 do potegi drugiej = 8 + 81 = 89 * 1
#
# 695 --> 6² + 9³ + 5⁴= 1390 = 695 * 2
# 6(first digit) to the power of 2 + 9(second digit) to the power of 3 + 5(third digit) to the power of 4 ==695 * 2 (2 is the second argument!)
#
# 46288 --> 4³ + 6⁴+ 2⁵ + 8⁶ + 8⁷ = 2360688 = 46288 * 51
# => I have to multiply the 1st argument number by unknown number until I get the SAME result as the result of takign to consecutive powers
# p dig_pow(46288, 3) == 51
#
# DS:
# input: 2 integers
# output: 1 integer
#
# A:
# EXTRACT digits from the first argument
# INIT `power_sum` to store the increasing sum of powers
# ITERATE over digits with index
# --while iterating, increase power_sum by digit raised to the consecutive powers(p+i where i is index)
# --the TRICK is that I can use INDEX and index is not infinite, it's the index of digits AND
# --we don't have UNLIMITED indices, we have as many as digits + 1 (coz index starts with 0)
# -if power_sum
#
# Notes
# digits

# def dig_pow(n, p)
#   digits = n.digits.reverse # extract the digits
#   power_sum = 0 # INIT power_sum

#   digits.each_with_index do |digit, i| #ITERATE over digits, use index (smart!)
#     power_sum += digit**(p + i) #increaste power_sum as you iterate through numbers and raise them to consecutive powers
#   end

#   if power_sum % n == 0 # when you reach the number is that same as power_sum
#     return power_sum / n # return the result of division of power_sum / by n
#   else
#     return -1 # otherwise -1 needs to be returned
#   end
# end

# # Test cases
# puts dig_pow(89, 1)   # Output: 1
# puts dig_pow(92, 1)   # Output: -1
# puts dig_pow(695, 2)  # Output: 2
# puts dig_pow(46288, 3)  # Output: 51

# In the above solution, we first extract the digits of the number n and store them in an array called digits. Then, we iterate over each digit, calculate its power using the formula digit**(p + i), and add it to power_sum. After iterating through all digits, we check if power_sum is divisible by n. If it is, we return the result of the division, otherwise, we return -1.

# puts
# def dig_pow(n, p)
#   sum = n.digits.reverse.map.with_index { |digit, i| digit ** (p + i) }.sum
#   sum % n == 0 ? sum / n : -1
# end

# puts dig_pow(89, 1)   # Output: 1
# puts dig_pow(92, 1)   # Output: -1
# puts dig_pow(695, 2)  # Output: 2
# puts dig_pow(46288, 3)# Output: 51

puts
# INIT result
# TRANSFORM num to string
# TRANSFORM to arr, iterate over each string-number
# -ADD to result the power of that number (convert to integer first) ** power (2nd argument)
# -INCREASE power by 1
#
# RETURN - 1 if result is LESS than number(1st argument)
# RETURN the result of division of result by number

def dig_pow(num, pow)
  result = 0
  num.to_s.chars.each do |n|
    result += n.to_i**pow
    pow += 1
  end
  return -1 if result < num

  result / num
end

p dig_pow(89, 1) == 1
p dig_pow(92, 1) == -1
p dig_pow(46_288, 3) == 51
p dig_pow(695, 2) == 2
