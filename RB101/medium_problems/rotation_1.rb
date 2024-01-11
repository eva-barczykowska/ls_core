=begin
Rotation (Part 1)
Write a method that rotates an array by moving the first element to the end of the array.
The original array should not be modified.

Do not use the method Array#rotate or Array#rotate! for your implementation.

PEDAC
P:
- write a method that rotates an array by moving the 1st element 1 to the end of the array
- the original array should not be modified, so the method returns a new array

E:
rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
=> 1st element is 7, 7 is last in the return array

rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
=> 1st element is "a" , "a" is positioned last in the return array

rotate_array(['a']) == ['a']
=> if it's just 1 element, return the same array

x = [1, 2, 3, 4]
rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true

=> do not mutate the original array

DS:
input: array
output: array

A:
- save all the other elements to `all_but_first`
- save first element to `first` but save it as an array first = [arr[0]]

- initialize a new array
- stick `all_but_rest` and `first`
- return that array

=end
def rotate_array(arr)
  all_but_first = arr[1..-1]
  first = [arr[0]]

  all_but_first + first
end
p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true