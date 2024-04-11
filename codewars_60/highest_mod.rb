=begin
Given a collection of integers, write a method to find the highest possible value that can be obtained by taking the modulus of two elements (e.g., 11 % 3 = 2)

highest_mod([1, 1, 1, 1, 1]) == 0
highest_mod([1, 2, 3, 4, 5]) == 4
highest_mod([88, 54, 67, 56, 36]) == 67
=end

# Problem
# Want to find the highest modulus of two elements from the given Array
# input: array of ints
# intermediate : sorted Array
# output : highest modulo value (integer)

# First, sort the Array
# Working with that sorted array 
#   Take the second to last element % last element

def highest_mod(array)
  return 0 if array.sort.uniq.size == 1
  sorted_arr = array.sort.uniq
  sorted_arr[-2] % sorted_arr[-1]
end

p highest_mod([1, 1, 1, 1, 1]) == 0
p highest_mod([1, 2, 3, 4, 5]) #== 4
p highest_mod([88, 54, 67, 56, 36])
p highest_mod([88, 54, 67, 56, 88, 36]) #== 67


=begin
Edward
Problem 
 Inputs
  - Array of integers
 Outputs 
  - Integer, highest modulus of two elements in input
  Explicit requirements 
    - array contains only integers
  Implicit requirements
    - Each array has at least 2 elements

  Examples are below

  Data structure 
   - sub arrays to contain all of the possible combinations 


Algorithm
- iterate through the input array
- add all two combination arrays to a new array
  - initialize 
- iterate through these arrays 
- take modulo first element, by second element and store it in another array
- sort the array and return the last element. 

=end

=begin

A:
-return 0 if all numbers same

-create all possible combinations of 2
-iterate from index 0 to arr.size - 2 -- start
-start + 1 until arr.size - 1 -- finish
--save the pairs of numbers into `pairs`

-apply modulo to each array in `pairs`
-which one is the hightest result?
-return the biggest number

=end
# puts "Ewa"
def highest_mod(arr)
  return 0 if arr.uniq.size == 1
  pairs = []

  (0..arr.size - 2).each do |start|
    (start + 1...arr.size).each do |finish|
      pairs << [arr[start], arr[finish]]
    end
  end
 p pairs
  pairs.map { |p| p[0] % p[1] }.max

# end
p highest_mod([1, 1, 1, 1, 1]) #== 0
p highest_mod([1, 2, 3, 4, 5]) #== 4
p highest_mod([88, 54, 67, 56, 36]) #== 67

puts

def highest_mod(arr)
  return 0 if arr.uniq.size == 1
  pairs = arr.permutation(2).to_a # why permutation?
  p pairs

  pairs.map { |p| p[0] % p[1] }.max

end
p highest_mod([1, 1, 1, 1, 1]) == 0
p highest_mod([1, 2, 3, 4, 5]) == 4
p highest_mod([88, 54, 67, 56, 36]) == 67

=begin
Jack
P 
  Input: Collection (Array of Integers)
  Output: Integer

  Take an Array of Integers
  Find the highest value from the modulus of any two elements in that array of Integers.

ALGO:
Big picture
  1. Get every 2 element combination from input Array
  2. Store each modulus from those 2 element's
  3. Find the highest value of the modulus values
  4 Return highest modulus value
Finer:  
  1. Go over each 1st element in input Array
    - For each 2nd element go over all other elements in input Array
    - Get modules of 1st and 2nd
    - Store the modulus of the two elements 
  2. Go over each modulus of the elements
    - Sort values by highest to lowest
    - Get the first value
  4 Return highest modulus value
    Return that first value
Even Finer:
    - ITERATE/LOOP over element input array
        ITERATE/LOOP over each element of input array
        IF first element != second element
          GET Modulo of first element and second element
          STORE that modulo value
    - SORT the modulo values by highest to lowest values
    - RETURN the first value of the modulo values
=end

#[1, 2, 3]
def highest_mod(arr)
  modulos = []

  arr.each do |e1|
    arr.each do |e2|
      modulos << e1 % e2 if e1 != e2
    end
  end

  return 0 if modulos.empty?
  modulos.sort.last
end
p highest_mod([1, 1, 1, 1, 1]) == 0
p highest_mod([1, 2, 3, 4, 5]) == 4
p highest_mod([88, 54, 67, 56, 36]) == 67

=begin
Udeshika
P:
Input - array of integers
output - integer (highest possible modulus of two elements)



=begin
Given a collection of integers, write a method to find the highest possible value that can be obtained
by taking the modulus of two elements (e.g., 11 % 3 = 2)

P 
Input: arr of int 
Output: integer, modulus 

Rules: 
- find the value of modulus of two numbers 
- return the highest 
- modulo every element by all elements in array
- should i include the modulus by itself? 2 % 2?

E 
[1, 1, 1, 1, 1] -> 
[1, 2, 3, 4, 5] -> 
1 % 1 = 0
1 % 2 = 1
1 % 3 = 1
1 % 4 = 1
1 % 5 = 1

2 % 1 = 0
2 % 2 = 0
2 % 3 = 2
2 % 4 = 2
2 % 5 = 2

3 % 2 = 1
3 % 3 = 0
3 % 4 = 3
3 % 5 = 3

4 % 1 = 0
4 % 2 = 0
4 % 3 = 1
4 % 4 = 0
4 % 5 = 4 return this

5 % 1 = 0
5 % 2 = 1
5 % 3 = 2
5 % 4 = 1
5 % 5 = 0

D 
begin: array of integers
  middle: integers to calculate, array to store the result numbers
end: return only one max Integer

A 
- FIND modulus of every current num by all elements in Array
  - iterate over array # 1 -> map
  - initialize inner iteration to divide by every element in Array -> select and return only the highest 
- RETURN the highest
=end

def highest_mod(array)
  array.map do |outer_num|
    array.map do |inner_num|
      outer_num % inner_num
    end.max # only one max integer of all modulus of outer_num
  end.max
end

p highest_mod([1, 1, 1, 1, 1]) == 0
p highest_mod([1, 2, 3, 4, 5]) == 4
p highest_mod([88, 54, 67, 56, 88, 36]) == 67