# creating pairs of elements from a given array
arr = [1, 2, 3, 4, 5, 6, 7, 8]
result = []
(0...arr.size).each do |index|
  (index + 1...arr.size).each do |second_index|
    result << [arr[index], arr[second_index]]
  end
end

#result:
# [[1, 2], [1, 3], [1, 4], [1, 5], [1, 6], [1, 7], [1, 8], [2, 3], [2, 4], [2, 5], [2, 6], [2, 7], [2, 8], [3, 4], [3, 5], [3, 6], [3, 7], [3, 8], [4, 5], [4, 6], [4, 7], [4, 8], [5, 6], [5, 7], [5, 8], [6, 7], [6, 8], [7, 8]]

puts "Result is #{result}"
other_way = arr.product(arr)
puts "Other way is #{other_way}"

#the result is different here: | kazdy z kazdym, all the possible combinations
# [[1, 1], [1, 2], [1, 3], [1, 4], [1, 5], [1, 6], [1, 7], [1, 8], [2, 1], [2, 2], [2, 3], [2, 4], [2, 5], [2, 6], [2, 7], [2, 8], [3, 1], [3, 2], [3, 3], [3, 4], [3, 5], [3, 6], [3, 7], [3, 8], [4, 1], [4, 2], [4, 3], [4, 4], [4, 5], [4, 6], [4, 7], [4, 8], [5, 1], [5, 2], [5, 3], [5, 4], [5, 5], [5, 6], [5, 7], [5, 8], [6, 1], [6, 2], [6, 3], [6, 4], [6, 5], [6, 6], [6, 7], [6, 8], [7, 1], [7, 2], [7, 3], [7, 4], [7, 5], [7, 6], [7, 7], [7, 8], [8, 1], [8, 2], [8, 3], [8, 4], [8, 5], [8, 6], [8, 7], [8, 8]]

# creating substrings and adding to an array
str = 'hello there happy studies'
substrings = []
(0...str.size).each do |start| # ... to exclude the last number because we start counting from 0
  (start + 1...str.size).each do |finish|
    substrings << str[start..finish]
  end
end

puts "Substrings are:"
p substrings

# can add the step method if we want to only modify elements at certain indices
# for example, if we wanted to grab every second index
string = "we only want every other word"
words = string.split
result = []
(1...words.size).step(2) do |i| # very nice!
  result << words[i]
end

puts "--Using step method we modified the string 'we only want every other word' to this:--"
p result

# Problem 1
# Order the elements of an existing array in reverse in a new array
array = [1, 2, 3, 4]
p array
reversed_array = []
array.each { |num| reversed_array.unshift(num) }
p reversed_array

puts

puts "or:"
array = [1, 2, 3, 4]
p array
reversed_array = []
array.reverse_each { |n| reversed_array << n }
p reversed_array

puts

# Reverse the order of elements in an existing array
array = [1, 2, 3, 4]
length = array.size

for i in 0...(length / 2)
  temp = array[i]
  array[i] = array[length - 1 - i]
  array[length - 1 - i] = temp
end
p array

# Problem 2
# Return all sub-strings
def substrings(arr)
  arr.chars.each_with_object([]).with_index do |(_, acc_arr), index|
    1.upto(arr.length - index) do |length|
      acc_arr << arr[index, length]
    end
  end
end

p substrings("abcde")
p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
puts

# Problem 3
# How to check if a number is a number in the fibonacci sequence?
# f(n) = f(n - 2) + f(n - 1)
def fibonacci?(number)
  first = 1
  last = 1
  loop do
    fibonacci = first + last
    first = last
    last = fibonacci
    return true if fibonacci == number
    return false if fibonacci > number
  end
end
p fibonacci?(40)
p fibonacci?(5)
p fibonacci?(13)