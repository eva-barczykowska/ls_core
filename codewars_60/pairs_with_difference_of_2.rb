
=begin
The objective is to return all pairs of integers from a given array of integers that have a difference of 2.

The result array should be sorted in ascending order of values.

Assume there are no duplicate integers in the array. The order of the integers in the input array should not matter.

p all_pairs([1, 2, 3, 4]) == [[1, 3], [2, 4]]
p all_pairs([4, 1, 2, 3]) == [[1, 3], [2, 4]]
p all_pairs([1, 23, 3, 4, 7]) == [[1, 3]]
p all_pairs([4, 3, 1, 5, 6]) == [[1, 3], [3, 5], [4, 6]]

P:
-write a method that takes an array an integers
-the method returns a nested array
-each inner array has 2 integers, the difference between them is 2

-the inner arrays have to be sorted in ascending order

E:
p all_pairs([1, 2, 3, 4]) == [[1, 3], [2, 4]]

p all_pairs([4, 1, 2, 3]) == [[1, 3], [2, 4]]

p all_pairs([1, 23, 3, 4, 7]) == [[1, 3]]

p all_pairs([4, 3, 1, 5, 6]) == [[1, 3], [3, 5], [4, 6]]
4-3, 4-1, 4-5, 4-6 => [4, 6]
3-1, 3-5, 3-6 => [1, 3], [3, 5]
1-5, 1-6 =>
5-6 =>

DS:
input: an array
middle: array ---what is it for?
output: a nested array

A:
- initialize result to []

- create an array of combinations of numbers from the input array
- combinations where difference is 2 example: [4, 3, 1, 5, 6]

- start at element at the index 0. For each element up to the last element of the array:
  - starting with the element at index 1, for each element up to the last element of the array

   - using Array Element Reference take both and store them in an array, append that array to `results`

   - take from input_array element at index 0 and index 1 and store it in `result` as an array
   - take from input_array element at index 0 and index 2 and store it in `result` as an array
   - take from input_array element at index 0 and index 3 and store it in `result` as an array
   -continue like this until the end of the array

  now move to element at index 1 and index 2 and store them in `result` as an array
  now move to element at index 1 and index 3 and store them in `result` as an array
  now move to element at index 1 and index 4 and store them in `result` as an array
  -continue like this until the end of the array

  -and again, move to element at index 3 and index 3 and store them in `result`...

- end inner loop that retrieved starting indices
- end outer loop that retrieved ending indices

-sort them ascending

-
=end
array = [4, 3, 1, 5, 6]
result = []
(0...array.size).each do |starting_index|
  (starting_index.next...array.size).each do |ending_index|
    result << [array[starting_index], array[ending_index]]
  end
end

p "result after the nested loop:"
p result
puts

result = result.select do |array|
  (array[0] - array[1]).abs == 2
end

p "result after select"
p result
puts

result = result.map do |array| # TRANSFORM this arrays where numbers are sorted
  array.sort # this means sort the numbers in the inner array
end

p "transformed arrays"
p result
puts

p result.sort # now, sort these arrays

def all_pairs(array)
  all_pairs = []
  (0...array.size).each do |starting_index|
    (starting_index.next...array.size).each do |ending_index|
      all_pairs << [array[starting_index], array[ending_index]]
    end
  end

  selected_pairs = all_pairs.select { |array| (array[0] - array[1]).abs == 2 }

  sorted_numbers = selected_pairs.map { |two_numbers| two_numbers.sort }  # TRANSFORM these arrays into arrays where numbers are sorted
  # this means sort the numbers in the inner array

  sorted_arrays = sorted_numbers.sort # now, sort these arrays (where numbers inside are already sorted)

  return sorted_arrays
end
p all_pairs([1, 2, 3, 4]) == [[1, 3], [2, 4]]
p all_pairs([4, 1, 2, 3]) == [[1, 3], [2, 4]]
p all_pairs([1, 23, 3, 4, 7]) == [[1, 3]]
p all_pairs([4, 3, 1, 5, 6]) == [[1, 3], [3, 5], [4, 6]]


# Nick
def all_pairs arr_given
  arr_of_combos = []
  arr_given.combination(2){|combo| arr_of_combos << combo}
  arr_solution = []

  arr_of_combos.each do |sub_array|
    difference = (sub_array[0] - sub_array[1]).abs
    arr_solution << sub_array.sort if difference == 2
  end
  arr_solution.sort
end


p all_pairs([1, 2, 3, 4]) == [[1, 3], [2, 4]]
p all_pairs([4, 1, 2, 3]) == [[1, 3], [2, 4]]
p all_pairs([1, 23, 3, 4, 7]) == [[1, 3]]
p all_pairs([4, 3, 1, 5, 6]) == [[1, 3], [3, 5], [4, 6]]


=begin
Write a function that takes in a string of one or more words, and returns the same string, but with all five or more letter words reversed (Just like the name of this Kata). Strings passed in will consist of only letters and spaces. Spaces will be included only when more than one word is present.

Examples:
spinWords( "Hey fellow warriors" ) => returns "Hey wollef sroirraw"
spinWords( "This is a test") => returns "This is a test"
spinWords( "This is another test" )=> returns "This is rehtona test"

PEDAC
P:
-write a method that takes a string of 1 or more words
-the str will be only letters and spaces
-the method returns a str BUT in that string, all words that have more than 5 letters have to be reversed

E:
spin_words( "Hey fellow warriors" ) => returns "Hey wollef sroirraw"
=> fellow.size == 6 => it's reversed, same goes for warriors

spin_words( "This is a test") => returns "This is a test"
=> no words whose size is > 4

spin_words( "This is another test" )=> returns "This is rehtona test"
=> another.size > 4 and that's why it's reversed

DS:
input: String
middle: array
output: String

A:
-if there's no space, this means it's just one word
-if the size of this word is > 4, return its reversed version
-if not, return as it is

-else
-split the word on a space
-initialize a return_string
-iterate over array of words according to their size: if size > 4, append the reversed version of the word, else append the word as it is

-join the array and return it
=end
def spin_words(str)
  return_string = []

  return str.reverse if !str.include?(" ") && str.size > 4
  return str if !str.include?(" ") && str.size <= 4


  array = str.split

  array.each do |word|
    if word.size > 4
      return_string << word.reverse
    else
      return_string << word
    end
  end

  return_string.join(" ")
end

p spin_words( "Hey fellow warriors" ) == "Hey wollef sroirraw"
p spin_words( "This is a test") == "This is a test"
p spin_words( "This is another test" ) == "This is rehtona test"



