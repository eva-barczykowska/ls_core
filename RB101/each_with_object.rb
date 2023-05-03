# Write a method that returns a list of all of the divisors of the positive integer passed in as an argument.
# The return value can be in any sequence you wish.

=begin
input: Integer
output: Array

Goal: intake the integer and return an array of all the divisors for the input integer.

Rules:
- positive numbers

D:
integer > Array

A:
- initialize result Array
- iterate from 1 to the input Integer
  - if the integer modulus the current number is exactly equal to 0, add it to result Array
- return result Array

=end

def divisors(num)
  (1..num).each_with_object([]) { |integer, result| result << integer if num % integer == 0 }
end

# LS

# def divisors(number)
#   1.upto(number).select do |candidate|
#     number % candidate == 0
#   end
# end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute