# Write a method that takes one argument, a positive integer, and returns the sum of its digits.

# input: a positive integer
# output: is sum of digits
# algorithm:
# -split the integer, => array
# -initiate the result array
# -iterate through array and add its elements to the result array

def sum(number)
  numbers = number.to_s.split("")
  result = 0
  numbers.each do |number|
    result += number.to_i
  end
  result
end


# puts sum(23) == 5
# puts sum(496) == 19
# puts sum(123_456_789) == 45

 print sum(23)
