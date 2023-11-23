# Code Snippets to analyze

###### For all the snippets describe what is happening with specific focus on return values, expected output and the concept demonstrated.
# Be particular about using clear and accurate language.

#1.
# p 2 <=> 1
# p 1 <=> 2
# p 2 <=> 2

# p 'b' <=> 'a'
# p 'a' <=> 'b'
# p 'a' <=> 'a'

# p 1 <=> 'a'

# On lines 1-3 a rocket operator symbol is used to compare integers. This operator is used for comparison and returns -1
# if the operand on the left side of the operator is smaller than the operand on the right side of the operator,
# 0, if they are equal and 1 if the operand on the right hand side is greater.
# The lines will return 1, -1 and 0 respectively.

# For strings, their value in the ASCII table is used when comparing with the <=> operator.
# The lines will return 1, -1 and 0 respectively.

# Last line will output NIL because the objects we are trying to compare are different object types.


#2.
# 'a' <=> 'b'
# 'apple' <=> 'ape'
# 'cat' <=> 'catty'

# First line will return -1 because the rocket operator `<=>` compares strings according to their value in the ASCII
# table. `"a"` has a lower value than `"b"`, which we can compare calling the `#ord` method on each of these strings.

# Second line returns 1 because characters from the first and second word are compared and when we reach second `p` from
# `"apple"`, we compare it with `"e"` from `"ape"`. The former has a greater value in the ASCII table then the latter
# and so the string `"apple"` is deemed greater. This line returns 1.

# Last line returns -1 because the second out of the 2 compared strings is longer.


#3.
def remove_evens!(arr)
  cloned_arr = arr.dup
  cloned_arr.each do |num|
    if num % 2 == 0
      arr.delete(num)
    end
  end
  arr
end

remove_evens!([1, 2, 3, 4, 5, 6])
=begin
This is a method definition denoted by the words `def..end`. The method has 1 parameter, an array called `arr`.

Within the method body `cloned_arr` is initialised to point to the return value of invoking `dup` method on the `arr`,
which is passed as an argument when this method is called. The `dup` method makes a `shallow copy` of an argument. This
means that it copies the object, in this case the array but the objects/elements inside this array are not copied
but shared.

What happens next, on 3rd line, `each` method is called on the `cloned_arr` and a block parameter `|num|` is passed to
`each`. At the moment of executing, each element from the `cloned_arr` will be in turn passed to this block parameter.
Within the block, denoted by the words `do..end`, we have an `if condition` stating that if the number at the current
iteration is evenly divisible by 2 (i.e. leaves no remainder), then we want to delete that number, for which we
call the `delete` method on the `arr` argument and pass the `num` as the element to be deleted. We are performing this action
on the array argument  `arr`, not on the copy `cloned_arr`. So what will happen to the elements of `cloned_arr`?

Well, because the elements of `cloned_arr` and `arr` are shared, whichever action we perfom on the elements of one array,
this action will be visible also in the other array. In this case the destructive `delete` method is called
on `arr` and the elements that are evenly divisible by 2 will be deleted from both 'arr' and cloned `arr`.

This code will return `[1, 3, 5].`
The concept demonstrated here is shallow copy. Btw, making a deep copy is very difficult in Ruby, but possible.
=end

#4.
# array = ['a', 'b', 'c', 'd', 'e']
#
# array.each do |letter|
#   letter.upcase!
# end
#
# p array

# #5.
# names = ["george", "bobbi", "joel", "susan"]
# names = names.each do |name|
#           name.capitalize
#         end
#
# p names
# ```
#
# ```ruby
# #6.
names = ["george", "bobbi", "joel", "susan"]
names.each do |name|
  puts name.capitalize
end
=begin
On the first line `names` variable is initialized to an array `["george", "bobbi", "joel", "susan"]`.

On the next line the `Array#each` method is invoked on `names`, a block with the block parameter
`|name|` is passed to it and to this block parameter that each subsequent element of the calling array will be passed to
during execution. Within the block (delimited by the words `do..end`) we invoke the `puts` method and pass to it
the return value of calling the `capitalize` method on each element of the array.

`puts` is a method that outputs the string representation of the passed object so in this case we will see that all
elements of the `names` array are output capitalized and on separate lines like so:
George
Bobbi
Joel
Susan

what is returned, however, is the calling array, `["george", "bobbi", "joel", "susan"]` and this is because `each` does
not take into consideration the return value of the block passed to it but rather returns its caller.
=end
#
# p names
# ```
#
# ```ruby
# #7.
# [[1, 2], [3, 4]].each do |arr|
#   puts arr.first
# end
# ```
#
# ```ruby
# #8.
# [[1, 2], [3, 4]].map do |arr|
#   puts arr.first
# end
# ```
#
# ```ruby
# #9.
# [1, 2, 3].each_with_index do |num, index| 
#   puts "The index of #{num} is #{index}."
# end
# ```
#
# ```ruby
# #10.
# { a: "ant", b: "bear", c: "cat" }.each_with_index do |element, index|
#   puts "The index of #{element} is #{index}."
# end
# ```
#
# ```ruby
# #11.
# arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
#
# arr.select { |n| n.odd? }
# ```
#
# ```ruby
# #12.
# snowy_owl = {
#   "type"=>"Bird",
#   "diet"=>"Carnivore",
#   "life_span"=>"10 years"
# }
#
# snowy_owl.select do |key, value|
#   key == "type"
# end
# ```
#
# ```ruby
# #13.
# arr_a = %w(ant bat cat)
# arr_b = arr_a.dup
#
# arr_b.map! { |word| word.upcase }
#
# p arr_a
# p arr_b
# ```
#
# ```ruby
# #14.
# arr_a = %w(ant bat cat)
# arr_b = arr_a.dup
#
# arr_b[1].upcase!
# p arr_a
# p arr_b
# ```
#
# ```ruby
# #15.
# arr_a = %w(ant bat cat)
# arr_b = arr_a.dup
#
# arr_b.map! { |word| word.upcase! }
#
# p arr_a
# p arr_b
# ```
#
# ```ruby
# #16.
# ['dog', 'cat', 'pig'].sort_by do |word|
#   word[1]
# end
# ```
#
# ```ruby
# #17.
# [[2, 4], [2, 1, 4], [0, 1, 2], [3, 2, 0], [0, 1], [3, 2, 5]].sort
# ```
#
# ```ruby
# #18.
# { a: "ant", b: "bear", c: "cat" }.each_with_object([]) do |pair, array|
#   array << pair.last
# end
# ```
#
# ```ruby
# #19.
# { a: "ant", b: "bear", c: "cat" }.each_with_object({}) do |(key, value), hash|
#   hash[value] = key
# end
# ```
#
# ```ruby
# #20.
# [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hsh|
#   incremented_hash = {}
#   hsh.each do |key, value|
#     incremented_hash[key] = value + 1
#   end
#   incremented_hash
# end
# ```
#
# ```ruby
# #21.
# [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].each_with_object([]) do |hsh, arr|
#   incremented_hash = {}
#   hsh.each do |key, value|
#     incremented_hash[key] = value + 1
#   end
#   arr << incremented_hash
# end
# ```
#
# ```ruby
# #22.
# a = [1, 2, 3]
#
# a.map { |x| puts x**2 }
# ```
#
# ```ruby
# #23.
# [[[1, 2], [3, 4]], [5, 6]].map do |arr|
#   arr.map do |el|
#     if el.to_s.to_i == el   # it's an integer
#       el + 1
#     else                    # it's an array
#       el.map do |n|
#         n + 1
#       end
#     end
#   end
# end
# ```
#
# ```ruby
# #24.
# [[1, 2], [3, 4]].map do |arr|
#   arr.map do |num|
#     num * 2
#   end
# end
# ```
#
# ```ruby
# #25.
# [[[1], [2], [3], [4]], [['a'], ['b'], ['c']]].map do |element1|
#   element1.each do |element2|
#     element2.partition do |element3|
#       element3.size > 0
#     end
#   end
# end
# ```
#
# ```ruby
# #26.
# [[8, 13, 27], ['apple', 'banana', 'cantaloupe']].map do |arr|
#   arr.select do |item|
#     if item.to_s.to_i == item    # if it's an integer
#       item > 13
#     else
#       item.size < 6
#     end
#   end
# end
# ```
#
# ```ruby


#27.
=begin
[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end

In this code snippet, on the first line we call the `Array#select` method on the array of hashes, `[{ a: 'ant', b: 'elephant' }, { c: 'cat' }]`.
This method takes a block, the block parameter is called 'hash' and to this block parameter each hash from our calling array will be passed in turn.

Within the block that belongs to `#select`, the `all?` method is called on the hash passed to the block. This method also takes a block,
denoted by the words `do..end`. The block parameters, to which each hash key and value are passed subsequently, are called `key` and
`value`. Within the block belonging to the `all?` method, a statement `value[0] == key.to_s` is evaluated. This statement
will return `true` if the first character of a value passed to the block is equal to the return value of the `to_s` method invoked
on the key. If this statement returns `true` for all key-value pairs in the hash, then the `all?` method will return true, otherwise
it will return false.

Well this statement returns true for all key-value pairs only in the case of the last hash, `{ c: 'cat' }`.
This means that lines 2-4 will will evaluate as true for the hash { c: 'cat' } and false for the hash { a: 'ant', b: 'elephant' }.

The return values will be used by the select method to determine which element to select. The `select` method selects elements
from the caller based on the return value of the block. If the return value of the block is truthy, like in the case of
{ c: 'cat' }, then the element is selected and placed in a new array.

So this code returns [{:c=>"cat"}].
=end

# ```
#
# ```ruby
# #28.
# arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]
# arr.select do |hash|
#   hash.all? do |key, value|
#     value.all? do |num|
#       num.even?
#     end
#   end
# end
# ```
#
# ```ruby
# #29.
# arr = [['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]
# arr.sort_by do |sub_arr|
#   sub_arr.map do |num|
#     num.to_i
#   end
# end
# ```
#
# ```ruby
# #30.
# odd, even = [1, 2, 3].partition do |num| 
#   num.odd?
# end
#
# p odd
# p even
# ```
#
# ```ruby
# #31.
# experiment = [["???", "!!!", "?!?!"], ["select_me!", "please_select_me?", "how about_me?"], ["what does it mean to be a string?", 'true']]
#
# experiment2 = experiment.each do |array|
#   array.map { |string| string.include?('?') }
# end
#
# p experiment
# p experiment2
#
# ```
#
# ```ruby
# #32.
# array = [1, 2, 3, 4, 5]
#
# array.select do |num|
#    puts num if num.odd?
# end
#
# ```
#
# ```ruby
# #33
# arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
#
# new_array = arr.select do |n|
#   n + 1
# end
# p new_array
#
# ```
#
# ```ruby
# #34.
# arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
#
# new_array = arr.select do |n|
#   n + 1
#   puts n
# end
# p new_array
#
#
# ```
#
# ```ruby
# #35.
# words = %w(jump trip laugh run talk)
#
# new_array = words.map do |word|
#   word.start_with?("t")
# end
#
# p new_array
#
# ```
#
# ```ruby
# #36.
# arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
#
# incremented = arr.map do |n|
#             n + 1
#             end
# p incremented
#
# ```
#
# ```ruby
# #37.
# arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
#
# new_array = arr.map do |n|
#   n > 1
# end
# p new_array
#
# ```
#
# ```ruby
# #38.
# arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
#
# new_array = arr.map do |n|
#   n > 1
#   puts n
# end
# p new_array
#
# ```
#
# ```ruby
# #39.
# a = "hello"
#
# [1, 2, 3].map { |num| a }
#
# ```
#
# ```ruby
# #40.
# [1, 2, 3].select do |num|
#   num > 5
#   'hi'
# end
#
# ```
#
# ```ruby
# #41.
# ['ant', 'bat', 'caterpillar'].count do |str|
#   str.length < 4
# end
#
# ```
#
# ```ruby
# #42.
# ['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
#   hash[value[0]] = value
# end
#
# ```
#
# ```ruby
# #43.
# ['ant', 'bear', 'caterpillar'].pop.size
#
# ```
#
# ```ruby
# #44.
# [1, 2, 3].any? do |num|
#   puts num
#   num.odd?
# end
#
# ```
#
# ```ruby
# #45.
# arr = [1, 2, 3, 4, 5]
# arr.take(2)
#
# ```
# ```ruby
# #46.
# { a: 'ant', b: 'bear' }.map do |key, value|
#   if value.size > 3
#     value
#   end
# end
#
# ```
#
# ```ruby
# #47.
# [1, 2, 3].map do |num|
#   if num > 1
#     puts num
#   else
#     num
#   end
# end
#
# ```
#
# ```ruby
# #48.
# [123, 432, 543, 642, 543, 256].sort_by do |num|
#   num.digits.first
# end
#
# ```
#
# ```ruby
# #49.
# contacts = {
#   Jenny: '230-867-5309',
#   Skylar: '432-555-5555',
#   joe: '230-432-1234',
#   Jimmy: '123-123-1234'
# }
#
# contacts.sort_by do |_, number|
#   number.split('-')[0]
# end
#
# ```
#
# ```ruby
# #50.
# contacts = {
#   Jenny: '230-867-5309',
#   Skylar: '432-555-5555',
#   joe: '230-432-1234',
#   Jimmy: '123-123-1234'
# }
#
# contacts.sort_by do |name, _|
#   name.capitalize
# end
#
# ```
#
# ```ruby
# #51.
# hash = { chris: '510-204-5555', sam: '510-909-5526',
# adrienne: '650-433-2112' }
#
# hash.sort_by do |name, number|
#   p name.length * number.split('-')[2][0].to_i
# end
#
# ```
#
# ```ruby
# #52.
# words = %w(cantaloupe apple durian bananas)
#
# # default uses <=> to compare collection elements
# words.min
# words.min(2)
#
# # with a block
# words.min { |a, b| a.size <=> b.size }
# words.min(2) { |a, b| a.size <=> b.size }
#
# ```
#
# ```ruby
# #53.
# words = %w(cantaloupe apple durian)
#
# # sort by amount of vowels
# words.min_by { |word| word.count("aeiou") }
#
# words.min_by(2) { |word| word.count("aeiou") }
#
# ```
#
# ```ruby
# #54.
# def add_one_to(nums)
#   0.upto(nums.length) do |i|
#     nums[i] += 1
#   end
#   nums
# end
#
# numbers = [0, 1, 2, 3, 4]
#
# p add_one_to(numbers)
# p numbers
#
# ```
#
# ```ruby
# #55.
# def test(b)
#   b.map {|letter| "I like the letter: #{letter}"}
# end
#
# a = ['a', 'b', 'c']
# test(a)
#
# ```
#
# ```ruby
# #56.
# [1, 2, 3].reject do |num|
#   puts num > 2
# end
#
# ```
#
# ```ruby
# #57.
# { a: "ant", b: "bear", c: "cat" }.include?("ant")
#
# ```
#
# ```ruby
# #58.
# { flour: '1c', sugar: '.5c', eggs: 2 }.first(2)
#
# ```
# 58.
arr = [-10, nil, 'false', [], true]

selected = arr.map do |element|
  element
end

p selected
p selected.size

# `Array#map` method transforms the argument array according to the return value of the block and returns a new array.
# In this case, the return value of the block for each element passed to it, is the element itself.
#
# That is why each element will be returned by the block and used to transform the argument array, except that in this
# case we don't see any transformation because the array that `map` returns looks the same as the argument array.

# The array that map returns is stored in `selected`. When we print `selected` on penultimate line,
# we see ``[-10, nil, 'false', [], true]` so we see that `arr` and `selected` contain the same elements.

# When we print the size of `selected` on the last line, it's going to be 5,
# just like the size of the original array on the first line.
#
# This is because `map` returns and array that is of the same size as the original array on which `map` was called.

# This snippet represents the concept of transformation.


# 59.
# snippets from Ali
# Write a method that takes a nested array of sub-arrays of integers and returns a new array
# with each nested array sorted into an additional two sub-arrays with the the even integers in the first sub-array
# and the odd integers in the second.

# -first even, then odd
# def odd_and_even(arr)
#
#   arr.map do |subarray|
#     subarray.partition do |number|
#       number.even?
#    end
#   end
#
# end
#
# arr1 = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
# p odd_and_even(arr1) == [[[2], [1, 3]], [[4, 6], [5]], [[8], [7, 9]]] ####[[2], [1, 3]] AND [[4, 6], [5]], [[8], [7, 9]]
#
# arr2 = [[1, 3, 5], [7, 9, 11]]
# p odd_and_even(arr2) == [[[], [1, 3, 5]], [[], [7, 9, 11]]]

# puts
# 60
=begin
[[[1], [2], [3], [4]], [['a'], ['b'], ['c']]].map do |element1|
  element1.each do |element2| # element2 is in turn [1][2][3][4]["a"]["b"]["c"]
    element2.partition do |element3| # it is an array so we can call partition on it
      element3.size > 1
    end
  end
=end
=begin
  Explain the return value of this code.

The return value of this code is a new array  `[[[1], [2], [3], [4]], [["a"], ["b"], ["c"]]]`.

This is because the `Array#map` method transforms the calling array according to  the return value of the block
passed to it. The return value of the block is `[[[1], [2], [3], [4]], [["a"], ["b"], ["c"]]]` ,
since the `Array#each` method was invoked on each array passed to the block parameter `element1`.
each`  does not use the block’s return value but instead returns the object that it was called on.
This object, `[[[1], [2], [3], [4]], [["a"], ["b"], ["c"]]]` is now used by map for transformation, on line 1.

It could be added that it doesn’t matter that the `partition` method is invoked on the array passed to the
block parameter `element2`  on line 3 and also that then the partition method is passed a block with the
block parameter `element3` and then in turn the `size` method is called on the array passed to `element3` and that returns in turn integer 1, 1, 1, 1, 1, 1, 1 and then finally that the `<` method is called on that integer each time and this whole expression `1 < 1` returns `false` each time.  None of this matters because `each` doesn’t use the block’s return value.

The concept represented here is `transformation` and `iteration`, both `map` and `each` are iterating methods
but the first one uses the blocks return value to transform the caller and return a new array, while the
second does not use the blocks return value and returns the caller instead.
=end

=begin
# 61
a = ["1","2","11","13","14"]
p a.sort

This code when printed will output `["1", "11", "13", "14", "2"] ` because sort compares strings character by character
according to their value in the ASCII table. So `"1"` will be followed by `"11"` because the second character that is
of the lowest value, of all second characters in all the strings is 1. Then the second characters are compared and that's
why `"12"` will come next and then `"13"` and `"14"`. Only then we look again at the first character, a character that is greater
than the previous first character used for comparison, `"1"`. Now the string is `"2"` and this is the string with the greatest
value of all of the strings in the calling array. That is why the string `"2"` comes as last, which would not happen if
we were comparing integers.
=end


#62
words = %w(card soap knife crab soapy coin sand king kill)
words.sort
=begin
The first line is using a shortcut `%w` to create an array of strings so the return value of this line is
`["card", "soap", "knife", "crab", "soapy", "coin", "sand", "king", "kill"] `.

The second line will sort these strings alphabetically using the `sort` method, which in turns uses the `<=>` symbol,
called rocket operator, to compare the strings. How the rocket operator works is that it compares every character in the
string and based on that decides which string will be considered smaller and which greater. If the strings are equal up
to the last character but one string is longer, the longer string will be considered greater. So the `<=>` will check
for the value of each character in the ASCII table and return -1 if the first character is lesser in value that tne second,
0 if they are equal, and 1 if the second character is greater.

The last line of this code will return `["card", "coin", "crab", "kill", "king", "knife", "sand", "soap", "soapy"].`
=end

#63
selected_foods = [['apple', 'kiwi'], ['artichoke', 'broccoli']].select do |arr|
  arr.select do |food|
    food.start_with?('a')
  end
end
p selected_foods

=begin
mine:
On the first line `selected_foods` is initialized to the return value of invoking `select` method on a nested array
[['apple', 'kiwi'], ['artichoke', 'broccoli']]. `select` takes a block with the block parameter `arr`, to which each
inner array will be passed in turn when `select` is invoked. So first, the array `['apple', 'kiwi']` and then ['artichoke', 'broccoli'].
will be passed to it. We can say that this is outer iteration.

Then the inner iteration starts. Within this inner iteration, select method is called in turn on each above mentioned
inner arrays, a block `do..end` is passed to it and within the block body `start_with?` method is invoked on each
element that is currently passed to the block parameter `|food|` and the string `"a"` is passed to it as an argument.

Select selects elements of an array based on the return value of the block, so if the block returns a truthy value, the
element will be selected. The inner select therefore selects `"apple"` from the first array and `"artichoke"` from the
second. These two elements will be in turn used by the outher select (on the first line) so that select will return
[[apple], [artichoke]] and it is this return value that will be saved to `selected_foods`.

So last line will output `[[apple], [artichoke]]`.

Elizabeth's:
#select method is invoked on array [['apple', 'kiwi'], ['artichoke', 'broccoli']] , the return value of this method is
assigned to the variable `selected_foods`.
The select method takes a block variable `arr` where each inner array that’s being processed is bound to in turn.
Inside the body of `select` method is another `select` method that is invoked on inner array `arr` and each element
of this inner array is bound to the block parameter `food` when the `arr` is being processed.

Inside the body of the second select method, `start_with?` method is invoked on the `arr` element that has been passed
to the block parameter `food`. The `start_with?` method has been passed an argument `"a"`.
This checks if `"a"` is the first character of the element passed to the `|food|` block parameter.

If this evaluates as true, then the element is selected by the inner `select` method. The select method looks at
whether the return value of the block is truthy and if it is, it selects the element and places it in a new array.
When the start_with? method returns, a truthy value is returned and passed to inner select in case of "apple" and
falsey in case of "kiwi".  In case of the second `arr`, a truthy value is returned passed to select in case of
"artichoke" and a falsy value in case of "broccoli".
So the inner select will return in turn ["apple"] and ["artichoke"].

Both of these are truthy values so when evaluating each `arr` on the first line of the code, outer `select` will take
this return value of the inner select and use it to select elements of `arr`.
Both elements passed to `arr` will be selected and so when we print `selected_foods` on the last line,
we will see [['apple', 'kiwi'], ['artichoke', 'broccoli']].

second try:
On the first line the Array#select method is called on a nested array. This method takes a block denoted by words
do..end and a block parameter |arr|, to which each inner array will be bound in turn. Within the body of the block,
select is called again, this time on arr so first on array ["apple", "kiwi"] and then on array ["artichoke", "broccoli"].
The block passed to the method has a parameter |food|, to which each element of arr will be passed in turn and
the code within the block body will be executed.

Inner select, on line 2, returns ["apple"] and ["artichoke"] because for those 2 elements the start_with? method
returns true. Since selects cares about the return value of the block and the return value is true for these 2 elements,
these elements are selected and placed in a new array [["apple"], ["artichoke"]].
This new array is then used by the outer select, on line 1.

Since both of these arrays are truthy values, outer select selects each arr according to the return value of the block
and so it will select all the arrays from the caller. This return value of invoking select is then saved to
selected_foods and when we use the p method on the last line and pass selected_foods as an argument,
[['apple', 'kiwi'], ['artichoke', 'broccoli']] is output.

The concept represented here is selection, specifically the fact that select uses the return value of the block
in order to select elements from the caller and place them in a new array.
=end
