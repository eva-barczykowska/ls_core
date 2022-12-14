# Reversed Arrays (Part 1)
# Write a method that takes an Array as an argument, and reverses its elements
# in place; that is, mutate the Array passed into this method.
# The return value should be the same Array object.
#
# You may not use Array#reverse or Array#reverse!.

# Examples:
# list = [1, 2, 3, 4]
# result = reverse!(list)
# result == [4, 3, 2, 1] # true
# list == [4, 3, 2, 1] # true
# list.object_id == result.object_id # true
#
# list = %w(a b e d c)
# reverse!(list) == ["c", "d", "e", "b", "a"] # true
# list == ["c", "d", "e", "b", "a"] # true
#
# list = ['abc']
# reverse!(list) == ["abc"] # true
# list == ["abc"] # true
#
# list = []
# reverse!(list) == [] # true
# list == [] # true

# PEDAC
# Problem
# -write a method that takes an array as an argument
# -reverse the array elements in place without using Ruby inbuilt #reverse or #reverse! method
# -return THE SAME ( but mutated) array
# -object_id before mutation and after mutation has to be the same
# (well, otherwise it means we returned a different object rather than mutated array)
#
# Examples
# list = [1, 2, 3, 4]
# result = reverse!(list)
# result == [4, 3, 2, 1] # true
# list == [4, 3, 2, 1] # true
# list.object_id == result.object_id # true
#
# list = %w(a b e d c)
# reverse!(list) == ["c", "d", "e", "b", "a"] # true
# list == ["c", "d", "e", "b", "a"] # true
#
# list = ['abc']
# reverse!(list) == ["abc"] # true
# list == ["abc"] # true
#
# list = []
# reverse!(list) == [] # true
# list == [] # true

# Data Structures
# -input: array
# -output: array(mutated)
#
# Algorithm
# -return an empty array if the array passed as an argument is empty
# -otherwise
# -initialize a variable `target` and point it to the return value of calling the size method on the input array
# -initialize variable `mutated_array_index` and point it to an integer `0`
# -initialize `last_element_index` variable and point it to the return value of calling the size method on the array minus `1`
# -start a loop
# -within the body of the loop, append to the array argument the last element of the array argument
# -then change the last element of the array argument to an empty string
# -decrease `last_element_index` and increase `mutated_array_index`
# break out of the loop when `mutated_array_index` reaches the `target`
# -reject all elements that are empty strings

# Code

def reverse!(arr)
  return arr if arr.empty?
  target = arr.size  # I want to have that many elements
  mutated_array_index = 0 # I have that many elements
  last_element_index = arr.size - 1 # I will start reversing/building my target array with this element
  loop do
    arr.push(arr[last_element_index])
    arr[last_element_index] = ''
    last_element_index -= 1
    mutated_array_index += 1
    break if mutated_array_index == target
  end
  arr.reject! { |ch| ch == "" }
end

p list = [1, 2, 3, 4]
p result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

puts

p list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

puts

p list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

puts

p list = [] # had to deal separately with this
p reverse!(list) == [] # true
p list == [] # true

puts
puts "LS solution"
# LS solution
def reverse!(array)
  left_index = 0
  right_index = -1

  while left_index < array.size / 2
    array[left_index], array[right_index] = array[right_index], array[left_index] # interesting multiple assignment on 1 line
    left_index += 1
    right_index -= 1
  end

  array
end

# so 1 becomes 4 and 4 becomes 1 => [4, 2, 3, 1]
# left index is 0 and right index is -1
# so 1 becomes 4 and 4 becomes 1 => [4, 2, 3, 1]
# we increase right index by 1 and decrease left index by 1
# left index is 1 and right index is -2
# so 2 becomes 3 and 3 becomes 2 => [4, 3, 2, 1]
# we increase right index by 1 and decrease left index by 1
# at this point our left index is 2 and right index is -3
# so the next iteration of the while loop will not execute because the condition is
# while left_index < array.size / 2 so while 2 < 4/2

p list = [1, 2, 3, 4]
p result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true
p
p list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true
p
p list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true
p
p list = []
p reverse!(list) == [] # true
p list == [] # true
