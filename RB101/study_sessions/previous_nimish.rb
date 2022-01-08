# Write a method that takes one argument, a positive integer, and returns an array that contains the digits of the integer.

# input: a positive integer
# output: array of digits that the integer consists of
# algorithm:
# -convert the digit, which is an integer to string
# -split the string and return the array of characters

def digit_list(int)
  array = int.to_s.split("").map { |elem|  elem.to_i }
end


p digit_list(12345) #== [1, 2, 3, 4, 5]


# his solution:
def digit_list(num)
  result = []
  while num > 0
    digit = num % 10
    result.unshift(digit)
    num = num / 10
  end
  result
end

p digit_list(12345) #== [1, 2, 3, 4, 5]
p digit_list(7)
