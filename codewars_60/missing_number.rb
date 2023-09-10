=begin
Create a function that takes an array of numbers between 1 and 10 (excluding one number) and returns the missing number.

Examples
missing_num([1, 2, 3, 4, 6, 7, 8, 9, 10]) ➞ 5

missing_num([7, 2, 3, 6, 5, 9, 1, 4, 8]) ➞ 10

missing_num([10, 5, 1, 2, 4, 6, 8, 3, 9]) ➞ 7

Notes:
The array of numbers will be unsorted (not in order).
Only one number will be missing.

P:
-write a method that takes an array of integers as an argument
-the integers are 1 to 10
-1 integer will be missing
-return the missing number

Examples
missing_num([1, 2, 3, 4, 6, 7, 8, 9, 10]) == 5
missing_num([7, 2, 3, 6, 5, 9, 1, 4, 8]) == 10
missing_num([10, 5, 1, 2, 4, 6, 8, 3, 9]) == 7

DS:
input: an array of integers from 1 to 10, not in order
output: an integer (the missing one)

Notes:
-times
A:
-create a reference of numbers 1..10
-subtract argument array from reference array
-save the result to `res` and return it
=end

def missing_num(array)
  reference = []

  10.times do |number|  # building an array
    reference << number + 1
  end

  (reference - array).first

end


p missing_num([1, 2, 3, 4, 6, 7, 8, 9, 10]) == 5
p missing_num([7, 2, 3, 6, 5, 9, 1, 4, 8]) == 10
p missing_num([10, 5, 1, 2, 4, 6, 8, 3, 9]) == 7

puts

def missing_num(array)
  reference = [*1..10]

  (reference - array)[0]
end

p missing_num([1, 2, 3, 4, 6, 7, 8, 9, 10]) == 5
p missing_num([7, 2, 3, 6, 5, 9, 1, 4, 8]) == 10
p missing_num([10, 5, 1, 2, 4, 6, 8, 3, 9]) == 7

puts

def missing_num(array)
  reference = *(1..10)

  (reference - array)[0]
end

p missing_num([1, 2, 3, 4, 6, 7, 8, 9, 10]) == 5
p missing_num([7, 2, 3, 6, 5, 9, 1, 4, 8]) == 10
p missing_num([10, 5, 1, 2, 4, 6, 8, 3, 9]) == 7

puts

def missing_num(array)
  (((1..10).to_a) - array).first
end

p missing_num([1, 2, 3, 4, 6, 7, 8, 9, 10]) == 5
p missing_num([7, 2, 3, 6, 5, 9, 1, 4, 8]) == 10
p missing_num([10, 5, 1, 2, 4, 6, 8, 3, 9]) == 7

puts

def missing_num(array)
  ([*1..10] - array).first
end

p missing_num([1, 2, 3, 4, 6, 7, 8, 9, 10]) == 5
p missing_num([7, 2, 3, 6, 5, 9, 1, 4, 8]) == 10
p missing_num([10, 5, 1, 2, 4, 6, 8, 3, 9]) == 7
