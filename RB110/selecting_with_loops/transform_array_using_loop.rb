# transform each element of this array to be plural version of that noun
# expected: fruits = ['apples', 'bananas', 'pears']
# do not use map, use a loop
#
fruits = ['apple', 'banana', 'pear']

transformed_array = []
counter = 0

loop do
  current_fruit = fruits[counter]

  transformed_array << current_fruit + "s"

  counter += 1
  break if counter == fruits.size
end

p transformed_array

# ls solution
fruits = ['apple', 'banana', 'pear']
transformed_elements = []
counter = 0

loop do
  current_element = fruits[counter]

  transformed_elements << (current_element + 's')   # appends transformed string into array

  counter += 1
  break if counter == fruits.size
end

transformed_elements # => ["apples", "bananas", "pears"]

# Line 1 creates an array of fruits
# Line 2 creates an empty array, transformed_elements, which we will use to store our new transformed elements
# Line 3 sets a counter to 0, which is used to loop through fruits on lines 5-12
# Line 6 assigns current_element to the fruit that is at the position of counter in the array fruits.
# So, on the first iteration, when counter is 0, this will be "apple"
# On line 8, there are two things happening.
# Firstly, current_element + 's' creates a new string that comprises the string assigned to current_element appended with an 's'.
# Therefore, this is a new string with the value of "apples".
# Secondly, transformed_elements << (current_element + 's') uses the Array#<< method to append the new string to the transformed_elements array
# Lines 10 and 11 increment counter and break out of the loop when the end of the fruits array is reached
# Finally, line 14 returns the new array, transformed_elements, containing the new strings


