# Write a method that takes an integer argument, and returns an Array
# of all integers, in sequence, between 1 and the argument.
#
# You may assume that the argument will always be a valid integer
# that is greater than 0.

# Explicit requirements:
# -a method that takes an integer argument
# -and returns an array of all integers, in sequence, between 1 and argument
#
# Data structures:
# -input: integer
# -output: array of integers
#
# Algorithm:
# -count up to the integer argument, how?
# -put all the digits in a result array
# -return the result array

def sequence(int)
  result = []
  counter = 1
  while counter <= int
    result << counter
    counter += 1
  end
    result
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
puts

# ls solution

def sequence(number)
  (1..number).to_a
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
p sequence(-11)
puts

# Further Exploration
# Food for thought: what do you think sequence should return if the argument
# is not greater than 0. For instance, what should you do if the argument
# is -1? Can you alter your method to handle this case?

def sequence(number)
  if number < 0
    (number..number.abs).to_a
  else
  (1..number).to_a
  end
end

p sequence(-11)
p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
puts

def sequence(number)
  if number == 0
    return [0]
  elsif number < 0
    (number..-1).to_a
  else
  (1..number).to_a
  end
end

p sequence(-11)
p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
p sequence(0) == [0] #0 is an edge case here
puts
# a solution I liked. However, this does not account for zero argument input.

def sequence(num)
  num.positive? ? [*1..num] : [*num..-1].reverse
end

p sequence(-11)
p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
p sequence(0) == [0] #produces an empty array
puts

#I also saw that some people expected a reversed array:

def sequence(num)
  num > 0 ? (1..num).to_a : (num..1).to_a.reverse
end

p sequence(-11)
p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
p sequence(0) == [0] #but this solution also does not account for input == 0
