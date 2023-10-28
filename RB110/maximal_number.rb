=begin
Given an integer n, find the maximal number you can obtain by deleting exactly one digit of the given number.

P:
-write a method that takes an integer
-the method returns the maximal number that I can obtain by deleting exactly 1 number from the argument

E:
delete_digit(791983) == 91983
91983
71983
79983
79183
79193
79198
=>91983
expected = [91983, 71983, 79983, 79183, 79193, 79198]
delete_digit(152) == 52
delete_digit(1001) == 101
delete_digit(10) == 1

DS:
input: integer
output: integer

Notes:
A:
- create `numbers` array

# - change the int argument into string and then array

# - loop over the array
# - initialize `counter`
# - use index to iterate over the array and at each iteration select elements of the array at each index BUT the index
    that is equal to counter
# - join that array and append it to `numbers`
# - increase the counter

# - transform the array of string-numbers into integers
# - check which number in `numbers` is the greatest and return it
=end

def delete_digit(n)
  numbers = []

  array = n.to_s.chars

  counter = 0
  while counter < array.size
    numbers << array.select.with_index { |_, index| index != counter }.join
    counter += 1
  end

  numbers.map { |e| e.to_i }.sort.last

end
p delete_digit(791983) == 91983
p delete_digit(152) == 52
p delete_digit(1001) == 101
p delete_digit(10) == 1

# Feedback
# SLOW DOWN when bugs are encountered
# Don't worry about speed, practise coding with intention
# Stay calm when things don't work as expected and debug