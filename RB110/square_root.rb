=begin
TA session with Philip

given an array of numbers, write a method that returns only the perfect squares
squares([1, 4, 9]) == [1, 4, 9]
squares([0, 1, 2, 3]) == [0, 1]
["1", "4", "9"], []


P - Understanding the Problem:
- Goal: understand what you're being asked to do
  - Read the problem description
  - Identify expected input and output
  - Establish rules/requirements/define the boundaries of the problem
  - Ask clarifying questions
  - Take your time on this step!

- are we always getting integers?
- is there anything special about a 'perfect square'?
- any other kind of input validation

E - Examples and Test Cases:
- Goal: further expand and clarify understanding about what you're being asked to do
  - Use examples/test cases to confirm or refute assumptions
   made about the problem in the previous step

squares([1, 4, 9]) == [1, 4, 9]
squares([0, 1, 2, 3]) == [0, 1]

D - Data Structures:
- Goal: begin to think logically about the problem
  - What data structures could we use to solve this problem?
    - What does our data look like when we get it? (input)
    - What does our data look like when we return it? (output?)
    - What does our data need to look like in the intermediate steps?
Input: Array of integers
Intermediate: Array of the square roots of each integer in argued array. Array of all squares between smallest and largest argued integers.
Output: Array of integers - any integer in the output will have been present in the input.



A - Algorithm:
- Goal: write out steps to solve the given problem in plain English
  - A logical sequence of steps for accomplishing a task/objective
  - Start high level, but make sure you've thought through and have provided sufficient detail for working through the most difficult parts of the problem
  - Stay programming-language-agnostic
  - Can create substeps for different parts or separate concerns into a helper method
  - You can (and should) revisit your algorithm during the implementation stage if you need to refine your logic
  - Before moving onto implementing the algorithm, check it against a few test cases

HIGH LEVEL
Iterate over the argued array and add only the squares to some results array.

MEDIUM LEVEL squares([0, 1, 2, 3]) == [0, 1]
create a results array that's empty

iterate over the argued Array
  At each iteration, append the original integer to the results array if it's a perfect squares
    - Check if an integer is a perfect square
    - Take the square root; if it's an integer, the argued integer is a perfect square.
      - Integer meaning the square root modulo 1 is less than 0.00000001.
return the results Array


C - Implementing a Solution in Code:
- Goal: translate the algorithm into your programming language of choice
  - Code with intent. Avoid hack and slash
- TEST FREQUENTLY
  - Use the REPL or run your code as a file
  - When testing your code, always have an idea in place of what you're expecting
  - If you find that your algorithm doesn't work, return there FIRST if needed and THEN fix your code
=end

# create a results array that's empty

# iterate over the argued Array
#   At each iteration, append the original integer to the results array if it's a perfect squares
#     - Check if an integer is a perfect square
#     - Take the square root; if it's an integer, the argued integer is a perfect square.
#       - Integer meaning the square root modulo 1 is less than 0.00000001.
# return the results Array

def squares(arr)
  results = []
  arr.each do |int|
    results << int if perfect_square?(int)
  end
  return results
end

def perfect_square?(int)
  root = Math.sqrt(int)
  (root % 1) < 0.0000001
end

p squares([1, 4, 9]) == [1, 4, 9]
p squares([0, 1, 2, 3]) == [0, 1]

puts
# my solution
=begin
given an array of numbers, write a method that returns only the perfect squares
squares([1, 4, 9]) == [1, 4, 9]
squares([0, 1, 2, 3]) == [0, 1]
squares([2, 3]) == []
squares([]) == []


P:
-write a method that takes an array of numbers as an argument
- these numbers have to be each perfect squares, like 1, 4, 9
- numbers like 2 or 3 are not perfect squares
- all numbers that are not perfect squares have to be removed from the argument array

E:
squares([1, 4, 9]) == [1, 4, 9]
=> all of the numbers are perfect squares, i.e. no remainder is left
=> 1*1 = 1, 2*2 = 4, 3*3 = 9

squares([0, 1, 2, 3]) == [0, 1]
=> 2 and 3 are not perfect squares, they have a remainder, Math.sqrt(2) => 1.4142135623730951

squares([2, 3]) == []
=> no perfect squares here

squares([]) == []
=> no numbers to consider

A:
- iterate over the argument array and find out square root of each number, save it to an array
- initialize `square_roots` hash with numbers from the array argument as keys and their square roots as values

-iterate over the hash and pick those numbers, for which the square root in the `square_roots` array has no more than 2
 digits/3 characters if changed to string

=end

def squares(array)
  return_array = []

  nums_and_roots = array.each_with_object({}) { |num, hash| hash[num] = Math.sqrt(num) }

  nums_and_roots.each do |num, square_root|
    return_array << num if square_root.to_s.size == 3
  end

  return_array
end

p squares([1, 4, 9]) == [1, 4, 9]
p squares([0, 1, 2, 3]) == [0, 1]
p squares([2, 3]) == []
p squares([]) == []