=begin
Multiply All Pairs
Write a method that takes two Array arguments in which each Array contains
a list of numbers, and returns a new Array that contains the product of every
pair of numbers that can be formed between the elements of the two Arrays.
The results should be sorted by increasing value.

multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

PEDAC
Problem
-write a method that takes 2 arrays as arguments
-the method returns a product of all possible pairs
2,4
2,3
2,1
2,2

then
4,4
4,3
4,1
4,2

-and then sort the resulting array and return it

Example
multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

Data structures
input: 2 arrays
output: 1 array with products of all possible pairs, sorted ascending

Algorithm
-initialize result array
-initialize a counter1 and counter2 variables for arr1 and arr2 respectively
-start the outer loop with arr1
-start the inner loop with arr2
-add product of each element from the first array with all the elements of the 2nd array etc. until all the pairs are exhausted
-sort the array and return it

Code
=end
def multiply_all_pairs(arr1, arr2)
  result = []
  counter1 = 0
  counter2 = 0
  while counter1 < arr1.size
    counter2 = 0  # zero the counter, otherwise the counter is already 4 after the first iteration of all pairs, eg 2-4, 2-3, 2-1, 2-2 and increase by 1
    while counter2 < arr2.size
      result << arr1[counter1] * arr2[counter2]
      counter2 += 1
    end
    counter1 += 1
  end
  result.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

puts ""

def multiply_all_pairs(arr1, arr2)
  result = []
  arr1.each do |num_from_arr1|
    arr2.each do |num_from_arr2|
      result << num_from_arr1 * num_from_arr2
    end
  end
  result.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

puts ""

# ls solution
def multiply_all_pairs(array_1, array_2)
  products = []
  array_1.each do |item_1|
    array_2.each do |item_2|
      products << item_1 * item_2
    end
  end
  products.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

# For the above solution we have two iterators, one for the first array and one
# for the second. We want all the different combinations of multiples, duplicates
# included. To do this, we need to iterate through each item in the first array,
# and then multiply it by each item in the second array.
# Finally, we sort our array of products and return that array.

def multiply_all_pairs(array_1, array_2)
  array_1.product(array_2).map { |num1, num2| num1 * num2 }.sort
end
# array_1.product(array_2) will give me this: [[2, 4], [2, 3], [2, 1], [2, 2], [4, 4], [4, 3], [4, 1], [4, 2]]r

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) #== [2, 4, 4, 6, 8, 8, 12, 16]
