=begin
Rotation (Part 1) 23:04
Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.

Do not use the method Array#rotate or Array#rotate! for your implementation.

P-----
-method takes an array as an arg
-method returns rotated array
-rotated means first element is moved to the end of the array
-original array mustn't be modified
-cannot use ROTATE

E-----
rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
=> 7 went to the end

rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
=> 'a' went to the end

rotate_array(['a']) == ['a']
=> stays same coz just 1 element

DS----
input: arr
output: modified array
A-----
-make a copy of the original argument array
-remove the fist element of the array and save it to `first`
-stick `first` at the end

=end
def rotate_array(arr)
  copy = arr.dup

  first = copy.shift
  copy << first
end
p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]
p x == [1, 2, 3, 4]