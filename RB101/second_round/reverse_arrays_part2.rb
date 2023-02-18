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
  array.reverse_each { |num| result << num }
  result
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

puts
# mayank's code
=begin
Write a method that takes an Array, and returns a new Array
with the elements of the original list in reverse order. Do not modify the original list.

You may not use Array#reverse or Array#reverse!, nor may you use the method you wrote in the previous exercise.

Input: An Array
Output: An Array

Rules:
1. Reverse the elements in the Array
2. The method should return a new array, without modifying the argument
3. Do not change the element objects themselves, e.g. reverse!(["abc"]) == ["abc"]
4. Array elements can be either integers or strings, at least according to our test cases

Algorithm:
1. Define a method called reverse which takes one parameter
2. Initialise one counter local variable
3. Initialise another local variable, new_array with empty array object assigned to it
4. Use destructive map to loop over each element of the duplicate Array
  decrement counter by 1
  Set return value of block to be the element at "counter" index of the array local variable


Zero index would be -1
1st index would be -2
Third index would be -3 and so on..
=end

def reverse(array)
  duplicate_array = array.clone # cloning so we have 2 arrays now that are same
  counter = 0

  duplicate_array.map! do |element| # we are mutating duplicate array, a copy of the array argument
    counter -= 1
    array[counter] # so we take element -1 from argument array and insert it in index 0 of the duplicate array
  end
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

