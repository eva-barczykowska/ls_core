=begin
[Train: Array.diff \| Codewars](https://www.codewars.com/kata/523f5d21c841566fde000009/train/ruby)
6 kyu
Your goal in this kata is to implement a difference function, which subtracts one list from another and returns the result.
It should remove all values from list a, which are present in list b.

array_diff([1,2],[1]) == [2]
If a value is present in b, all of its occurrences must be removed from the other:

array_diff([1,2],[1]) == [2]
=end

=begin
P:
- write a method that takes 2 arrays and REMOVES from FIRST array all elements found in SECOND array
- then the method returns the result, in the form of array

E:
p array_diff([1,2], [1]) == [2]
=> 1 gets removed from the first array, so only [2]
 is left

p array_diff([1,2,2], [1]) == [2,2]
=> 1 gets removed from the first array

p array_diff([1,2,2], [2]) == [1]
=> BOTH of 2s are removed, so only  [1] is left

p array_diff([1,2,2], []) == [1,2,2]
=> nothing gets removed

p array_diff([], [1,2]) == []
=> nothing can be removed becasue the array is empty

DS:
input: 2 arrays
output: array that contains first array after the elements (all instances of) have been removed

A:
- convert to str both arrays
- delete from the first string all occurrences of the second string
- change string back into an array
- return the array
=end
def array_diff(arr1, arr2)
  str1 = arr1.join
  str2 = arr2.join

  str1.delete(str2).split("").map(&:to_i)
end
p array_diff([1,2], [1]) == [2]
p array_diff([1,2,2], [1]) == [2,2]
p array_diff([1,2,2], [2]) == [1]
p array_diff([1,2,2], []) == [1,2,2]
p array_diff([], [1,2]) == []

# session
=begin
[Train: Array.diff \| Codewars](https://www.codewars.com/kata/523f5d21c841566fde000009/train/ruby)
6 kyu
Your goal in this kata is to implement a difference function, which subtracts one list from another and returns the result.

It should remove all values from list a, which are present in list b.

array_diff([1,2],[1]) == [2]
If a value is present in b, all of its occurrences must be removed from the other:

array_diff([1,2],[1]) == [2]
=end

=begin
PROBLEM
=======
Desc.
----
  Given (2) Arrays as Input, remove from First List all values that are present in Second List.

Rules
-----
  + Explicit
    - remove from First list ALL occurrences of all values that occur in Second List
    - second list only contains (1) value?

  + Implicit
    - Input Lists contain Integers if not empty
    - return empty Array if First List is empty
    - mutate the caller

Notes
-----
+ mutative selection problem
  - deleting elements from First Input Array

EXAMPLES
=======


2.
First List : [1, 2, 2]
Second List : [1]
remove_val : 1

it 1 : 1 == 1?
it 1, end : [2, 2]

it 2 : 2 == 1?
it 2, end : [2, 2]

it 3 : 2 == 1?
end : [2, 2]

2.

DATA STRUCTURES
===============
Input : (2) Arrays

Intermediate Steps : mutate First Input Array

Output : First Input Array (mutated)

ALGORITHM
==========
+ return empty Array if First Input Array is empty
+ return First Input Array if Second Input Array is empty
+ identify remove_val in Second Input Array

+ iterate over all elements in First Input Array and mutatively select elements
  + select current element if value does not match that of remove_val

+ return First Input Array  (now mutated)

=end

def array_diff(arr1, arr2)
  return arr1 if arr1.empty? || arr2.empty?

  remove_val = arr2[0]

  arr1.select! do |num|
    num != remove_val
  end

  arr1

end

p array_diff([1,2], [1]) == [2]
p array_diff([1,2,2], [1]) == [2,2]
p array_diff([1,2,2], [2])  == [1]
p array_diff([1,2,2], []) == [1,2,2]
p array_diff([], [1,2]) == []

puts

# A:
# - convert to str both arrays
# - delete from the first string all occurrences of the second string
# - change string back into an array
# - return the array
# =end

def array_diff(arr1, arr2)
  str1 = arr1.join
  str2 = arr2.join

  str1.delete(str2).split("").map(&:to_i)
end
p array_diff([1,2], [1]) == [2]
p array_diff([1,2,2], [1]) == [2,2]
p array_diff([1,2,2], [2]) == [1]
p array_diff([1,2,2], []) == [1,2,2]
p array_diff([1, 2, 2, 1], [1,2]) == [] # this is passing not because my code is good but because of coincidence!
p array_diff([], [1]) == []
p array_diff([1,3, 2], [1,2]) == [3] # this is passing not because my code is good but because of coincidence!

# above solution - codewars don't pass, overlooked last example where the array of elements to be deleted is more than 1 character
# another go
# A:
# - iterate over the 2nd array
# - reject destructively the element(s) from the first array that equal to the element from the 2nd array at the current iteration
# - return the first array after the iteration/rejection is finished
# - return an empty array if the first array is empty

def array_diff(arr1, arr2)
  arr2.each do |number_to_delete|
    arr1.reject! { |n| n == number_to_delete }
  end

  arr1
end
p array_diff([1,2], [1]) == [2]
p array_diff([1,2,2], [1]) == [2,2]
p array_diff([1,2,2], [2]) == [1]
p array_diff([1,2,2], []) == [1,2,2]
p array_diff([1, 2, 2, 1], [1,2]) == []
p array_diff([], [1]) == []
p array_diff([1,3, 2], [1,2]) == [3]

puts

def array_diff(arr1, arr2)
  arr2.each { |delete_this| arr1.reject! { |n| n == delete_this } }
  arr1
end
p array_diff([1,2], [1]) == [2]
p array_diff([1,2,2], [1]) == [2,2]
p array_diff([1,2,2], [2]) == [1]
p array_diff([1,2,2], []) == [1,2,2]
p array_diff([1, 2, 2, 1], [1,2]) == []
p array_diff([], [1]) == []
p array_diff([1,3, 2], [1,2]) == [3]

puts
puts "codewars solutions I liked"
def array_diff(a, b)
  a.reject { |e| b.include? e }
end
p array_diff([1,2], [1]) == [2]
p array_diff([1,2,2], [1]) == [2,2]
p array_diff([1,2,2], [2]) == [1]
p array_diff([1,2,2], []) == [1,2,2]
p array_diff([1, 2, 2, 1], [1,2]) == []
p array_diff([], [1]) == []
p array_diff([1,3, 2], [1,2]) == [3]

puts
def array_diff(a, b)
  a.difference(b)
end
p array_diff([1,2], [1]) == [2]
p array_diff([1,2,2], [1]) == [2,2]
p array_diff([1,2,2], [2]) == [1]
p array_diff([1,2,2], []) == [1,2,2]
p array_diff([1, 2, 2, 1], [1,2]) == []
p array_diff([], [1]) == []
p array_diff([1,3, 2], [1,2]) == [3]




