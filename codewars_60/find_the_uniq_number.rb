# There is an array with some numbers. All numbers are equal except for one. Try to find it!
# It’s guaranteed that array contains at least 3 numbers.
#
# The tests contain some very huge arrays, so think about performance.
# find_uniq([ 1, 1, 1, 2, 1, 1 ]) == 2
# find_uniq([ 0, 0, 0.55, 0, 0 ]) == 0.55
#
# -iterate over the array, and find a number that is different than the previous one

def find_uniq(array)
  array.tally.each do |k, v|
    return k if v == 1
  end
end
p find_uniq([ 1, 1, 1, 2, 1, 1 ]) == 2
p find_uniq([ 0, 0, 0.55, 0, 0 ]) == 0.55

puts
def find_uniq(arr)
  arr.uniq.min_by { |number| arr.count(number) }
end
p find_uniq([ 1, 1, 1, 2, 1, 1 ]) == 2
p find_uniq([ 0, 0, 0.55, 0, 0 ]) == 0.55

puts
def find_uniq(arr)
  arr.uniq.find { |n| arr.count(n) == 1 }
end
p find_uniq([ 1, 1, 1, 2, 1, 1 ]) == 2
p find_uniq([ 0, 0, 0.55, 0, 0 ]) == 0.55

puts

=begin
There is an array with some numbers. All numbers are equal except for one. Try to find it!

find_uniq([ 1, 1, 1, 2, 1, 1 ]) == 2
find_uniq([ 0, 0, 0.55, 0, 0 ]) == 0.55
It’s guaranteed that array contains at least 3 numbers.

The tests contain some very huge arrays, so think about performance.

PEDAC
P:
- write a method that takes an array of integers as an argument
- array can be huge
- find number that is different that all the others
- there will be only 1 such number
- input array is guaranteed to have at least 3 numbers

E:
find_uniq([ 1, 1, 1, 2, 1, 1 ]) == 2
find_uniq([ 0, 0, 0.55, 0, 0 ]) == 0.55

DS:
input: array
middle: hash
output: number

N:
tally
arr.size/2

A:.all
- split the array in half and see if  all elems are same in the left and right size

- pick index in the middle of the array
- save its element in elem
- check if left_side arr[0...elem] is same as arr[elem..-1]

- if left side is same, shift it and work with right side the same way
-if right side is same, shift it and work with left side the same way
- do that until you have an array of 10 elements
- tally
- iterate through a hash
- and return the odd integer, the value will be 1

-then iterate starting with the second number
- if it's
=end

def find_uniq(arr)
  arr.tally.select { |int, occurences| return int if occurences == 1 }
end
p find_uniq([ 1, 1, 1, 2, 1, 1 ]) == 2
p find_uniq([ 0, 0, 0.55, 0, 0 ]) == 0.55
p find_uniq([ 77, 0, 0, 0 ]) == 77


# codewars solution
def find_uniq(arr)
  arr.uniq.each { |int| return int if arr.count(int) == 1 }
end
p find_uniq([ 1, 1, 1, 2, 1, 1 ]) == 2
p find_uniq([ 0, 0, 0.55, 0, 0 ]) == 0.55
p find_uniq([ 77, 0, 0, 0 ]) == 77

def find_uniq input_array_of_ints
  array_uniq_ints = input_array_of_ints.uniq
  array_uniq_ints.each do |int|
    return int if input_array_of_ints.count(int) == 1
  end
end
p find_uniq([ 1, 1, 1, 2, 1, 1 ]) == 2
p find_uniq([ 0, 0, 0.55, 0, 0 ]) == 0.55

=begin
There is an array. All elements are the same except for one. Try to find it!

p find_uniq([ 1, 1, 1, 2, 1, 1 ]) === 2
p find_uniq([ 4, 4, 'foo', 4 ]) === 'foo'
It’s guaranteed that array contains more than 3 elements. Array may contain anything (including NaN).

PEDAC
- write a method that takes an array
- method returns unique element amongst elems of the array

E:
p find_uniq([ 1, 1, 1, 2, 1, 1 ]) === 2
p find_uniq([ 4, 4, 'foo', 4 ]) === 'foo'

DS:
input: array
output: odd element

A:
- initialize unique var where you store 2 uniq elements
- count each of them and return the one whose count is equal to 1
=end

def find_uniq(array)
  unique = array.uniq
  unique.each do |element|
    return element if array.count(element) == 1
  end
end
p find_uniq([ 1, 1, 1, 2, 1, 1 ]) == 2
p find_uniq([ 4, 4, 'foo', 4 ]) == 'foo'

# refactor
def find_uniq(array)
  array.uniq.each { |element| return element if array.count(element) == 1 }
end
p find_uniq([ 1, 1, 1, 2, 1, 1 ]) == 2
p find_uniq([ 4, 4, 'foo', 4 ]) == 'foo'