# Reversed Arrays (Part 1)
# Write a method that takes an Array as an argument,
# and reverses its elements in place; that is, mutate the Array passed
# into this method. The return value should be the same Array object.

# You may not use Array#reverse or Array#reverse!.

# list = [1,2,3,4]
# result = reverse!(list)
# result == [4, 3, 2, 1] # true
# list == [4, 3, 2, 1] # true
# list.object_id == result.object_id # true

# list = %w(a b e d c)
# reverse!(list) == ["c", "d", "e", "b", "a"] # true
# list == ["c", "d", "e", "b", "a"] # true

# list = ['abc']
# reverse!(list) == ["abc"] # true
# list == ["abc"] # true

# list = []
# reverse!(list) == [] # true
# list == [] # true

# Note: for the test case list = ['abc'], we want to reverse the elements in the array.
# The array only has one element, a String,
# but we're not reversing the String itself, so the reverse! method call should return ['abc'].

# PEDAC
# -I have to write a method that is reversing the elements of an array, mutating the array in place
# The question to ask here is HOW CAN I MUTATE AN ARRAY? and then follow one of the options. And the options are:
# array[]=
# array.replace([other_array])
# array.insert(index, what)

# Examples
# list = [1,2,3,4]
# result = reverse!(list)
# result == [4, 3, 2, 1] # true
# list == [4, 3, 2, 1] # true
# list.object_id == result.object_id # true

# list = %w(a b e d c)
# reverse!(list) == ["c", "d", "e", "b", "a"] # true
# list == ["c", "d", "e", "b", "a"] # true

# list = ['abc']
# reverse!(list) == ["abc"] # true
# list == ["abc"] # true

# list = []
# reverse!(list) == [] # true
# list == [] # true

# Data structures
# input: an array of strings/integers, 1 element array or an empty array

# Algorithm
# [1, 2, 3] take 1st element and push it into 1st position, delete the first element
# [1, 2, 3] it's already there so nothing happens
# [2, 1, 3] take 2nd element and push it into 1st position, delete the 2nd element
# [3, 2, 1]

# OR

# [1, 2, 3]
# [1, 2, 3]
# [1, 3, 2]
# [3, 2, 1]

# index = 0
# arr = [1, 2, 3]
# -iterate through the array the number of times equal to its size
# -while iterating, each time delete array's last element and insert it into the array
# -so the first time the array will be like [3, 1, 2], then [3, 2, 1]


def reverse!(list)
  list.size.times { |i| list.insert(i, list.pop) }

  list
end

p list = [1,2,3,4]
p result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

list = %w(a b e d c)
reverse!(list) == ["c", "d", "e", "b", "a"] # true
list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
reverse!(list) == ["abc"] # true
list == ["abc"] # true

list = []
reverse!(list) == [] # true
list == [] # true

puts ""

# ls solution
def reverse!(array)
  left_index = 0
  right_index = -1

  while left_index < array.size / 2
    array[left_index], array[right_index] = array[right_index], array[left_index]
    left_index += 1
    right_index -= 1
  end

  array
end

p list = [1,2,3,4]
p result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

p 'my tests'
p list = [1, 2, 3] # middle element stays the same :-)
p result = reverse!(list)
p result == [3, 2, 1] # true
p list == [3, 2, 1] # true
p list.object_id == result.object_id # true

p list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

p list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

p list = []
p reverse!(list) == [] # true
p list == [] # true

# other solutions
def reverse!(list)
  list.sort_by! { |a| -list.index(a)}
end

p list = [1,2,3,4]
p result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

p 'my tests'
p list = [1,2,3]
p result = reverse!(list)
p result == [3, 2, 1] # true
p list == [3, 2, 1] # true
p list.object_id == result.object_id # true

p list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

p list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

p list = []
p reverse!(list) == [] # true
p list == [] # true

puts ""

def reverse_arr(array)
  temp_arr = []
  array.each {|elem| temp_arr.prepend(elem)}
  array.each_index {|index|
    array[index] = temp_arr[index]
  }
  array
end

p list = [1,2,3,4]
p result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

p 'my tests'
p list = [1,2,3]
p result = reverse!(list)
p result == [3, 2, 1] # true
p list == [3, 2, 1] # true
p list.object_id == result.object_id # true

p list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

p list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

p list = []
p reverse!(list) == [] # true
p list == [] # true

puts ""

def reverse!(arr) # this solutions returns false for the last 2 test cases! we could correct it adding an if clause for an empty array
  counter_one = 1
  storage_arr = []

  loop do
    storage_arr << arr[-(counter_one)]
    counter_one += 1
    break if counter_one > arr.size
  end

  counter_two = 0

  loop do
    arr[counter_two] = storage_arr[counter_two]
    counter_two += 1
    break if counter_two == storage_arr.size
  end

  arr
end

p list = [1,2,3,4]
p result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

p 'my tests'
p list = [1,2,3]
p result = reverse!(list)
p result == [3, 2, 1] # true
p list == [3, 2, 1] # true
p list.object_id == result.object_id # true

p list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

p list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

p list = []
p reverse!(list) == [] # true
p list == [] # true

puts ""

def reverse!(list)
  temp_array = []
  list.each { |val| temp_array.prepend(val) }
  list.each_with_index { |val,idx| list[idx] = temp_array[idx] } # arr[]= is mutating so use it! Answer to the question HOW can I mutate an array?
end

p list = [1,2,3,4]
p result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

p 'my tests'
p list = [1,2,3]
p result = reverse!(list)
p result == [3, 2, 1] # true
p list == [3, 2, 1] # true
p list.object_id == result.object_id # true

p list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

p list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

p list = []
p reverse!(list) == [] # true
p list == [] # true

puts ""

def reverse!(list)
  count = 0
  new_list = list.map do |_|
    count -= 1
    list[count]
  end
  list.replace(new_list)
end

p list = [1,2,3,4]
p result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

p 'my tests'
p list = [1,2,3]
p result = reverse!(list)
p result == [3, 2, 1] # true
p list == [3, 2, 1] # true
p list.object_id == result.object_id # true

p list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

p list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

p list = []
p reverse!(list) == [] # true
p list == [] # true

puts ""

def reverse!(arr) # returns false for the last 2 test cases
  return arr if arr.empty? #fixed it with this line
  dup = arr.dup
  i = 0
  j = -1

  loop do
    arr[i] = dup[j]
    i += 1
    j -= 1
    break if i == arr.size
  end
  arr
end

p list = [1,2,3,4]
p result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

p 'my tests'
p list = [1,2,3]
p result = reverse!(list)
p result == [3, 2, 1] # true
p list == [3, 2, 1] # true
p list.object_id == result.object_id # true

p list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

p list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

p list = []
p reverse!(list) == [] # true
p list == [] # true

puts ""

def reverse!(array) # again, returns nil for an empty array
  # p array.object_id
  return array if array.empty?

  index = array.length
    temp_array = []
    array.length.times do
    index -= 1
    temp_array << array[index]
  end

  until array.size == 0
    array.pop
  end

  counter = 0
  until counter == temp_array.size
    array << temp_array[counter]
    counter += 1
  end

#test
  # p array.object_id
  # p array
end

p list = [1,2,3,4]
p result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

p 'my tests'
p list = [1,2,3]
p result = reverse!(list)
p result == [3, 2, 1] # true
p list == [3, 2, 1] # true
p list.object_id == result.object_id # true

p list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

p list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

p list = []
p reverse!(list) == [] # true
p list == [] # true

puts ""

def reverse!(array)
  array.each do |el|
    array.prepend(array.delete(el))
  end
end

p list = [1,2,3,4]
p result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

p 'my tests'
p list = [1,2,3]
p result = reverse!(list)
p result == [3, 2, 1] # true
p list == [3, 2, 1] # true
p list.object_id == result.object_id # true

p list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

p list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

p list = []
p reverse!(list) == [] # true
p list == [] # true

puts ""

# If we were to do this by hand, we'd take the last number of the array, pop it
# off and insert it at the beginning, pushing every element up one index.
# Then we'd take pop off the last number and insert it after the first number.
# Then we'd pop off the last number and insert it after the second number etc.
# We repeat this length - 2 times.
#
# Take a look:
#
# [1,2,3,4] (pull out 4, insert before 1)
#
# [4,1,2,3] (pull out 3, insert after 4)
#
# [4,3,1,2] (pull out 2, insert after 3)
#
# [4,3,2,1] (here we stop)
#
# size = 4, number of iterations = size - 1

puts ""

def reverse_manual!(arr)
  (arr.size - 1).times do |i|
    p "iteration number is #{i}"
    last = arr.pop
    p "last is #{last}, this is what will get inserted at position #{i}"
    arr.insert(i, last)
    p "array is #{arr}"
  end
  arr
end

p list = [1,2,3,4]
p result = reverse_manual!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

p list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

p list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

p list = []
p reverse!(list) == [] # true
p list == [] # true

puts ""

def reverse!(array)
  return array if array.empty? || array.size == 1

  array_middle = array.size / 2

  index_a = 0
  index_b = -1
  loop do
    buffer = array[index_b]
    array[index_b] = array[index_a]
    array[index_a] = buffer

    index_a += 1
    index_b -= 1

    break if index_a == array_middle
  end

  array
end

p list = [1,2,3,4]
p result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

p 'my tests'
p list = [1,2,3]
p result = reverse!(list)
p result == [3, 2, 1] # true
p list == [3, 2, 1] # true
p list.object_id == result.object_id # true

p list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

p list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

p list = []
p reverse!(list) == [] # true
p list == [] # true

puts ""

def reverse!(list)
  return list if list.empty?
  counter = 0
  loop do
    element = list.pop
    list.insert(counter, element)
    counter += 1
    break if counter == list.size
  end
  list
end

def reverse!(list)
  list.size.times { |i| list.insert(i, list.pop) }

  list
end

p list = [1,2,3,4]
p result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

p list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

p list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

puts ""

# not a particularly efficient approach, but short and gets the job done
def reverse!(arr)
  temp = []
  arr.length.times { |element| temp << arr.pop } # throw out everything and put it in the temp array
  p "now temp is #{temp}"
  arr.prepend(temp).flatten! # put everything into the empty array from which I've thrown everything out but this will be an array in an array so flatten! it
end

p list = [1,2,3,4]
p result = reverse!(list)
p result #== [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

p list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

p list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

puts ""

def reverse!(arr)
  left_index = 0
  right_index = arr.size-1

  until left_index >= right_index
    arr[left_index], arr[right_index] = arr[right_index], arr[left_index]
    left_index += 1
    right_index -= 1
  end
  arr
end

p list = [1,2,3,4]
p result = reverse!(list)
p result #== [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

p list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

p list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true
