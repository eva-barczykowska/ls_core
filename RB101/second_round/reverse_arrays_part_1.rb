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

# def reverse!(arr)
#   arr[0], arr[1], arr[2], arr[3] = arr[-1], arr[-2], arr[-3], arr[-4] not good coz doesn't mutate the array
# end

def reverse!(arr)
  target = arr.size
  mutated_array_index = 0
  last_element_index = arr.size - 1
  loop do
    arr.push(arr[last_element_index])
    arr[last_element_index] = ''
    last_element_index -= 1
    mutated_array_index += 1
    break if mutated_array_index == target
  end
  arr.reject! { |ch| ch == "" }
end

# Examples:
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

# p list = []
# p reverse!(list) == [] # true
# p list == [] # true
