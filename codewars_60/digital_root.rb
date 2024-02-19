=begin
[Train: Sum of Digits / Digital Root \| Codewars](https://www.codewars.com/kata/541c8630095125aba6000c00/train/ruby)
6 kyu
In this kata, you must create a digital root function.

A digital root is the recursive sum of all the digits in a number. Given n, take the sum of the digits of n. If that value has more than one digit, continue reducing in this way until a single-digit number is produced. This is only applicable to the natural numbers.

Here's how it works:

digital_root(16)
=> 1 + 6
=> 7

digital_root(942)
=> 9 + 4 + 2
=> 15 ...
=> 1 + 5
=> 6

digital_root(132189)
=> 1 + 3 + 2 + 1 + 8 + 9
=> 24 ...
=> 2 + 4
=> 6

digital_root(493193)
=> 4 + 9 + 3 + 1 + 9 + 3
=> 29 ...
=> 2 + 9
=> 11 ...
=> 1 + 1
=> 2

P:
- write a method that takes a number
- split that number into digits
- sum all the digits

- do the above until the number has only 1 digit

DS:
input: integer
output: integer

A:
- split the input number into digits (array)
- sum the digits

- do the above in a loop until the number has just 1 digit

=end

def digital_root(number) # good solution, recursion is heavy
  loop do
    number = number.digits.sum
    return number if number.to_s.size == 1
  end
end

p digital_root(16) == 7
p digital_root(456) == 6

puts

#codewars solution I like
def digital_root(n)
  n < 10 ? n : digital_root(n.digits.sum)
end
p digital_root(16) == 7
p digital_root(456) == 6

puts

# - ALGORITHM
#   - transform the number into digits
#   - return the sum of digits
#   - if the sum is not 1 digits
#     - perform step 1 and 2
#   - if the sum is one digits
#     - return the sum

def sum_of_digits(numbers_array)
  numbers_array.reduce(0) { |num, sum| sum += num}
end
p digital_root(16) == 7
p digital_root(456) == 6

puts

def digital_root(number)
  numbers = number.digits.reverse

  return sum_of_digits(numbers) if numbers.size == 1

  digital_root(sum_of_digits(numbers))
end
p digital_root(16) == 7
p digital_root(456) == 6
