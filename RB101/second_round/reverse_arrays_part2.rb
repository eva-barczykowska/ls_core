=begin
Reversed Arrays (Part 2)
Write a method that takes an Array, and returns a new Array with the elements of the original list in reverse order. Do not modify the original list.

You may not use Array#reverse or Array#reverse!, nor may you use the method you wrote in the previous exercise.

PEDAC TEMPLATE

************** Problem **************
-write a method that takes an array as an argument
-the method returns NEW array
-all the elements of the original array are in reverse order
-do not modify the argument
-if the array argument is empty, return an empty array
-if the arg array size == 1, return the argument array
Questions:

************** Examples **************
p

************** Data Structures **************
input: array
output: new array, with elements reversed

************** Algorithm **************
-define result array
-if arg is empty, return an empty array
-if arg size == 1, return argument
-iterate over the argument array from the end
-append all the elements into the result array
-return the result array
************** Code **************

=end
def reverse(array)
  result = []
  # return array if array.empty? || array.size == 1
  array.reverse_each { |num| result << num }
  return result
end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

p list = [1, 3, 2]                      # => [1, 3, 2]
p new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true
