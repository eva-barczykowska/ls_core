=begin
You have to create a method that takes a positive integer number and returns the next bigger number formed by the same digits.
examples:

12 --> 21
513 --> 531
2017 --> 2071
If no bigger number can be formed using these digits, return -1.
examples:
9 --> -1
111 --> -1
531 --> -1
p next_bigger(9) == -1
p next_bigger(12) == 21
p next_bigger(513) == 531
p next_bigger(2017) == 2071
p next_bigger(111) == -1
p next_bigger(531) == -1
p next_bigger(123456789) == 123456798

PEDAC
P:
- write a method that takes an int as an arg
- method returns the next bigger number formed by the same digits
- if no bigger int can be formed, return -1
E:
p next_bigger(9) == -1
=> -1 coz bigger int can't be formed since it's only 1 digit

p next_bigger(12) == 21
=> 21

p next_bigger(513) == 531
=> 51, 53, 15, 13, 513, 531

p next_bigger(2017) == 2071
=> 2017, 2071, 0217, 0271...

p next_bigger(111) == -1
=> if they are all same, return - 1

p next_bigger(531) == -1
=> if no bigger number can be formed, return -1

p next_bigger(123456789) == 123456798

DS:
input: int
output: int, next bigger to the argument integer

N:

A:
- if it's just 1 digit, return - 1 ???

- create alls possible digits combinations(this gives me a nested array)
- transform this nested array into an array of digits
- tranform str digits into digits

- sort digits.

- iterate through them

- return the next bigger number than the argument int
- if not found, return - 1
=end

def next_bigger(int)
  combinations = int.digits.permutation.to_a

  combinations = combinations.map { |c| c.join }.map { |s| s.to_i }.sort

  greater = combinations.find { |n| n > int }

  return greater unless greater.nil?

  return - 1
end

p next_bigger(9) == -1
p next_bigger(12) == 21
p next_bigger(513) == 531
p next_bigger(2017) == 2071
p next_bigger(111) == -1
p next_bigger(531) == -1
p next_bigger(123456789) == 123456798

puts
# another method notation
#
def next_bigger(int)
  combinations = int.digits.permutation.to_a

  combinations = combinations
                   .map { |c| c.join }
                   .map { |s| s.to_i }
                   .sort

  greater = combinations.find { |n| n > int }

  return greater unless greater.nil?

  - 1
end

p next_bigger(9) == -1
p next_bigger(12) == 21
p next_bigger(513) == 531
p next_bigger(2017) == 2071
p next_bigger(111) == -1
p next_bigger(531) == -1
p next_bigger(123456789) == 123456798
