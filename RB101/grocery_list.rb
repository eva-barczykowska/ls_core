=begin
Grocery List
Write a method which takes a grocery list (array) of fruits with quantities and
converts it into an array of the correct number of each fruit.

buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]

PEDAC
Problem
-I have a method that takes as an argument an array of arrays, like so [["apples", 3], ["orange", 1], ["bananas", 2]]
-I have to convert it into an array of the correct number of each fruit, like so
["apples", "apples", "apples", "orange", "bananas","bananas"]

Examples
buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]

Data structures
input is an array of arrays/nested array, the contents are strings and integers
output is an array of strings

Algorithm
-initialize grocery variable to an empty array
-I will iterate over each internal arrays and look at the [0] element and [1]element
-save the [0] element to a variable called word
-save the [1] element to a variable called multiplier
-append to the grocery array in turn word multiplier by the multiplier, e.g. apples * 3
-e.g. if the value of the multiplier(2nd element of the internal array) is 3, I will append ["apples", "apples", "apples"] to the grocery array
-like that I will look at every internal array
-finally return the groceries array

Code
=end

def buy_fruit(array)
  groceries = []
  array.each do |nested_arr|
    multiplier = nested_arr.last
    word = nested_arr.first
    multiplier.times{ |number| groceries << word}
  end
  groceries
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]])# ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]

puts ""

# ls solutions
def buy_fruit(list)
  expanded_list = []

  list.each do |item|
    fruit, quantity = item[0], item[1] #like this a lot how they create 2 variables at the same time
    quantity.times { expanded_list << fruit } #also the use of .times
  end

  expanded_list
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]])# ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]

puts ""

def buy_fruit(list)
  list.map { |fruit, quantity| [fruit] * quantity }.flatten # the trick is the [], [fruit] * quantity => ["apples", "apples", "apples"]
end
p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]])# ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]

puts ""

# other solutions
def buy_fruit(input)
  input.each_with_object([]) { |pair, result_arr| pair[1].times { result_arr << pair[0] } }
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]])# ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]

puts ""

def buy_fruit(array_o_arrays)
  return_array = []
  array_o_arrays.each do |array|
    array[1].times {|i|return_array << array[0]}
  end
  return_array
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]])# ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]

puts ""

def buy_fruit(list)
  list.each_with_object([]) do |subarray, fruits|
  subarray.last.times { fruits << subarray.first }
  end
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]])# ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]

  puts ""

  def buy_fruit(list)
  list.map { |food| [food[0]] * food[1] }.flatten
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]])# ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
